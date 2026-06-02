-- Migration 002: Gym Tracker, Streaks and Mercy System

-- 1. Streaks and Mercy System columns in users table
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS login_streak INTEGER NOT NULL DEFAULT 0,
ADD COLUMN IF NOT EXISTS last_login_at TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS streak_shields INTEGER NOT NULL DEFAULT 0,
ADD COLUMN IF NOT EXISTS rest_days_remaining INTEGER NOT NULL DEFAULT 1,
ADD COLUMN IF NOT EXISTS is_on_rest_day BOOLEAN NOT NULL DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS rest_days_last_reset TIMESTAMPTZ DEFAULT NOW(),
ADD COLUMN IF NOT EXISTS streak_recovery_deadline TIMESTAMPTZ;

-- 2. Exercises Library Table
CREATE TABLE IF NOT EXISTS public.exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE, -- NULL means system default
    name VARCHAR(255) NOT NULL,
    target_muscle VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- RLS for exercises: system default is readable by everyone, custom by owner
ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercises_read_all" ON public.exercises 
    FOR SELECT USING (user_id IS NULL OR auth.uid() = user_id);
CREATE POLICY "exercises_write_own" ON public.exercises 
    FOR ALL USING (auth.uid() = user_id);

-- 3. Workout Templates Table
CREATE TABLE IF NOT EXISTS public.workout_templates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.workout_templates ENABLE ROW LEVEL SECURITY;
CREATE POLICY "workout_templates_own" ON public.workout_templates 
    FOR ALL USING (auth.uid() = user_id);

-- 4. Workout Template Exercises
CREATE TABLE IF NOT EXISTS public.workout_template_exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    template_id UUID NOT NULL REFERENCES public.workout_templates(id) ON DELETE CASCADE,
    exercise_id UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
    sets_count INTEGER NOT NULL DEFAULT 3,
    reps_target INTEGER,
    sort_order INTEGER NOT NULL DEFAULT 0
);

ALTER TABLE public.workout_template_exercises ENABLE ROW LEVEL SECURITY;
CREATE POLICY "workout_template_exercises_own" ON public.workout_template_exercises 
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM public.workout_templates t 
            WHERE t.id = template_id AND t.user_id = auth.uid()
        )
    );

-- 5. Workout Logs (History)
CREATE TABLE IF NOT EXISTS public.workout_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    template_id UUID REFERENCES public.workout_templates(id) ON DELETE SET NULL,
    name VARCHAR(255) NOT NULL, -- e.g. "Evening Workout"
    started_at TIMESTAMPTZ NOT NULL,
    completed_at TIMESTAMPTZ NOT NULL,
    duration_seconds INTEGER NOT NULL,
    total_volume_kg NUMERIC NOT NULL DEFAULT 0
);

ALTER TABLE public.workout_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "workout_logs_own" ON public.workout_logs 
    FOR ALL USING (auth.uid() = user_id);

-- 6. Workout Sets Table
CREATE TABLE IF NOT EXISTS public.workout_sets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    log_id UUID NOT NULL REFERENCES public.workout_logs(id) ON DELETE CASCADE,
    exercise_id UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
    set_number INTEGER NOT NULL,
    weight NUMERIC NOT NULL,
    reps INTEGER NOT NULL,
    rpe INTEGER,
    is_warmup BOOLEAN NOT NULL DEFAULT FALSE,
    is_completed BOOLEAN NOT NULL DEFAULT TRUE
);

ALTER TABLE public.workout_sets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "workout_sets_own" ON public.workout_sets 
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM public.workout_logs l 
            WHERE l.id = log_id AND l.user_id = auth.uid()
        )
    );

-- 7. Seed System Exercises
INSERT INTO public.exercises (name, target_muscle, description) VALUES
('Bench Press', 'Chest', 'Barbell bench press for chest strength.'),
('Incline Bench Press', 'Chest', 'Incline barbell bench press for upper chest.'),
('Cable Crossover', 'Chest', 'Cable chest flyes for chest isolation.'),
('Pushups', 'Chest', 'Bodyweight pushups.'),
('Pullups', 'Back', 'Bodyweight or weighted pullups.'),
('Barbell Row', 'Back', 'Bent over barbell rowing for back thickness.'),
('Lat Pulldown', 'Back', 'Cable lat pulldown for back width.'),
('Deadlift', 'Back', 'Barbell deadlift for posterior chain.'),
('Squat', 'Quads', 'Barbell back squat for leg strength.'),
('Leg Press', 'Quads', 'Machine leg press for leg strength.'),
('Leg Extension', 'Quads', 'Leg extensions for quad isolation.'),
('Lying Leg Curl', 'Hamstrings', 'Lying leg curls for hamstrings isolation.'),
('Standing Calf Raise', 'Calves', 'Standing calf raises for calf development.'),
('Overhead Press', 'Shoulders', 'Standing barbell overhead press for shoulder strength.'),
('Lateral Raise', 'Shoulders', 'Dumbbell side raises for lateral deltoid.'),
('Face Pulls', 'Shoulders', 'Cable face pulls for rear deltoid and upper back.'),
('Bicep Curl', 'Biceps', 'Barbell or dumbbell curls for bicep development.'),
('Hammer Curl', 'Biceps', 'Hammer curls for brachialis and forearm.'),
('Tricep Pushdown', 'Triceps', 'Cable tricep extensions for tricep strength.'),
('Overhead Tricep Extension', 'Triceps', 'Dumbbell or cable overhead tricep extensions.'),
('Planks', 'Core', 'Core stability hold.'),
('Hanging Leg Raise', 'Core', 'Hanging leg raises for lower abdominals')
ON CONFLICT DO NOTHING;

-- 8. Functions and RPCs

-- Daily Check In
CREATE OR REPLACE FUNCTION public.daily_check_in()
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user public.users%ROWTYPE;
  v_last_login_date date;
  v_today_date date;
  v_yesterday_date date;
  v_msg text;
  v_streak_reset boolean := false;
  v_xp_awarded integer := 0;
BEGIN
  -- Get user record
  SELECT * INTO v_user FROM public.users WHERE id = auth.uid();
  IF v_user.id IS NULL THEN
    RAISE EXCEPTION 'User not authenticated';
  END IF;

  v_today_date := (now() AT TIME ZONE 'UTC')::date;
  
  -- Handle weekly rest day reset (1 rest day per week)
  IF v_user.rest_days_last_reset IS NULL OR (now() - v_user.rest_days_last_reset) >= interval '7 days' THEN
    UPDATE public.users 
    SET rest_days_remaining = 1, 
        rest_days_last_reset = now()
    WHERE id = auth.uid();
    v_user.rest_days_remaining := 1;
  END IF;

  -- If last login is null, start streak
  IF v_user.last_login_at IS NULL THEN
    UPDATE public.users 
    SET last_login_at = now(),
        login_streak = 1
    WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'streak', 1, 'xpAwarded', 30, 'message', 'Welcome to the Hunter System!');
  END IF;

  v_last_login_date := (v_user.last_login_at AT TIME ZONE 'UTC')::date;

  -- Already logged in today
  IF v_last_login_date = v_today_date THEN
    RETURN jsonb_build_object('success', true, 'streak', v_user.login_streak, 'xpAwarded', 0, 'message', 'Already checked in today.');
  END IF;

  v_yesterday_date := v_today_date - 1;

  -- Logged in yesterday -> increment streak
  IF v_last_login_date = v_yesterday_date THEN
    v_user.login_streak := v_user.login_streak + 1;
    -- Award XP based on streak: Day 1=30, Day 3=50, Day 7=100, Day 14=150, Day 30=300
    v_xp_awarded := CASE 
      WHEN v_user.login_streak = 3 THEN 50
      WHEN v_user.login_streak = 7 THEN 100
      WHEN v_user.login_streak = 14 THEN 150
      WHEN v_user.login_streak >= 30 AND v_user.login_streak % 30 = 0 THEN 300
      ELSE 30
    END;

    UPDATE public.users 
    SET last_login_at = now(),
        login_streak = v_user.login_streak,
        xp = xp + v_xp_awarded
    WHERE id = auth.uid();

    v_msg := format('Monarch, your login streak is now %s days! +%s XP.', v_user.login_streak, v_xp_awarded);
    RETURN jsonb_build_object('success', true, 'streak', v_user.login_streak, 'xpAwarded', v_xp_awarded, 'message', v_msg);
  END IF;

  -- Missed yesterday! Let's check mercy mechanics
  IF v_user.is_on_rest_day THEN
    -- Consumed rest day
    UPDATE public.users 
    SET last_login_at = now(),
        is_on_rest_day = false
    WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'streak', v_user.login_streak, 'xpAwarded', 0, 'message', 'Rest day used. Streak protected!');
  ELSIF v_user.streak_shields > 0 THEN
    -- Consumed shield
    UPDATE public.users 
    SET last_login_at = now(),
        streak_shields = streak_shields - 1
    WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'streak', v_user.login_streak, 'xpAwarded', 0, 'message', 'Monarchs Shield consumed! Streak protected!');
  ELSE
    -- Streak broken!
    UPDATE public.users 
    SET last_login_at = now(),
        login_streak = 1,
        streak_recovery_deadline = now() + interval '24 hours'
    WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'streak', 1, 'xpAwarded', 30, 'message', 'Your streak was broken! Daily Quest penalty area active. Buy Recovery Ticket in 24 hours to restore.');
  END IF;
END;
$$;

-- Buy Streak Shield
CREATE OR REPLACE FUNCTION public.buy_streak_shield()
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_gold integer;
  v_cost integer := 250;
BEGIN
  SELECT gold INTO v_gold FROM public.users WHERE id = auth.uid();
  IF v_gold IS NULL OR v_gold < v_cost THEN
    RAISE EXCEPTION 'Insufficient gold! Monarchs Shield costs % gold.', v_cost;
  END IF;

  UPDATE public.users 
  SET gold = gold - v_cost,
      streak_shields = streak_shields + 1
  WHERE id = auth.uid();

  RETURN jsonb_build_object('success', true, 'shields', (SELECT streak_shields FROM public.users WHERE id = auth.uid()), 'cost', v_cost);
END;
$$;

-- Recover Streak
CREATE OR REPLACE FUNCTION public.recover_streak(previous_streak integer)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_gold integer;
  v_cost integer := 500;
  v_deadline timestamptz;
BEGIN
  SELECT gold, streak_recovery_deadline INTO v_gold, v_deadline FROM public.users WHERE id = auth.uid();
  IF v_deadline IS NULL OR now() > v_deadline THEN
    RAISE EXCEPTION 'Streak recovery window has expired!';
  END IF;
  IF v_gold IS NULL OR v_gold < v_cost THEN
    RAISE EXCEPTION 'Insufficient gold! Recovery Ticket costs % gold.', v_cost;
  END IF;

  UPDATE public.users 
  SET gold = gold - v_cost,
      login_streak = previous_streak,
      streak_recovery_deadline = NULL
  WHERE id = auth.uid();

  RETURN jsonb_build_object('success', true, 'streak', previous_streak, 'cost', v_cost);
END;
$$;

-- Toggle Rest Day
CREATE OR REPLACE FUNCTION public.toggle_rest_day()
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_rest_days integer;
  v_is_on_rest boolean;
BEGIN
  SELECT rest_days_remaining, is_on_rest_day INTO v_rest_days, v_is_on_rest FROM public.users WHERE id = auth.uid();
  IF v_is_on_rest THEN
    -- Turn off
    UPDATE public.users SET is_on_rest_day = false WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'isOnRestDay', false, 'restDaysRemaining', v_rest_days);
  ELSE
    -- Turn on
    IF v_rest_days <= 0 THEN
      RAISE EXCEPTION 'No rest days remaining for this week!';
    END IF;
    UPDATE public.users 
    SET is_on_rest_day = true,
        rest_days_remaining = rest_days_remaining - 1
    WHERE id = auth.uid();
    RETURN jsonb_build_object('success', true, 'isOnRestDay', true, 'restDaysRemaining', v_rest_days - 1);
  END IF;
END;
$$;
