-- ============================================================
-- Hunter System — Supabase Migration
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================================

-- Custom types (safe to re-run)
DO $$ BEGIN CREATE TYPE quest_type AS ENUM ('DAILY','MAIN','SIDE','PENALTY','EMERGENCY'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE difficulty_rank AS ENUM ('E','D','C','B','A','S'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE category AS ENUM ('FITNESS','STUDY','WORK','HEALTH','SOCIAL','CREATIVITY'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE item_rarity AS ENUM ('Common','Rare','Epic','Legendary'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE item_type AS ENUM ('Weapon','Armor','Consumable','Rune','Artifact'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE skill_type AS ENUM ('ACTIVE','PASSIVE'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN CREATE TYPE stat_name AS ENUM ('STR','INT','AGI','VIT','END','SEN'); EXCEPTION WHEN duplicate_object THEN NULL; END $$;

-- Users profile table (linked to Supabase Auth — NO password_hash)
CREATE TABLE IF NOT EXISTS public.users (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(100) NOT NULL DEFAULT 'Hunter',
    level INTEGER NOT NULL DEFAULT 1,
    xp INTEGER NOT NULL DEFAULT 0,
    gold INTEGER NOT NULL DEFAULT 0,
    mana INTEGER NOT NULL DEFAULT 100,
    max_mana INTEGER NOT NULL DEFAULT 100,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.hunter_stats (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID UNIQUE NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    str INTEGER NOT NULL DEFAULT 10,
    "int" INTEGER NOT NULL DEFAULT 10,
    agi INTEGER NOT NULL DEFAULT 10,
    vit INTEGER NOT NULL DEFAULT 10,
    "end" INTEGER NOT NULL DEFAULT 10,
    sen INTEGER NOT NULL DEFAULT 10,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.list_groups (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    group_id UUID REFERENCES public.list_groups(id) ON DELETE SET NULL,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'WORK',
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.quests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    list_id UUID REFERENCES public.lists(id) ON DELETE SET NULL,
    title VARCHAR(500) NOT NULL,
    type quest_type NOT NULL DEFAULT 'DAILY',
    difficulty difficulty_rank NOT NULL DEFAULT 'E',
    category category NOT NULL DEFAULT 'WORK',
    xp_reward INTEGER NOT NULL DEFAULT 100,
    gold_reward INTEGER NOT NULL DEFAULT 50,
    stat_boost_stat stat_name NOT NULL DEFAULT 'STR',
    stat_boost_amount INTEGER NOT NULL DEFAULT 1,
    has_deadline BOOLEAN NOT NULL DEFAULT FALSE,
    deadline VARCHAR(100),
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    failed BOOLEAN NOT NULL DEFAULT FALSE,
    is_important BOOLEAN NOT NULL DEFAULT FALSE,
    is_my_day BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.habits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'HEALTH',
    penalty_xp INTEGER NOT NULL DEFAULT 50,
    penalty_stat stat_name,
    penalty_stat_amount INTEGER DEFAULT 0,
    streak INTEGER NOT NULL DEFAULT 0,
    last_completed TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.bosses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'WORK',
    total_hp INTEGER NOT NULL DEFAULT 500,
    current_hp INTEGER NOT NULL DEFAULT 500,
    xp_reward INTEGER NOT NULL DEFAULT 1000,
    difficulty difficulty_rank NOT NULL DEFAULT 'E',
    defeated BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    type skill_type NOT NULL DEFAULT 'ACTIVE',
    mp_cost INTEGER NOT NULL DEFAULT 0,
    required_level INTEGER NOT NULL DEFAULT 1,
    category category NOT NULL DEFAULT 'FITNESS',
    description TEXT NOT NULL DEFAULT '',
    unlocked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.inventory_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    type item_type NOT NULL DEFAULT 'Artifact',
    rarity item_rarity NOT NULL DEFAULT 'Common',
    equipped BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT NOT NULL DEFAULT '',
    stat_str INTEGER DEFAULT 0,
    stat_int INTEGER DEFAULT 0,
    stat_agi INTEGER DEFAULT 0,
    stat_vit INTEGER DEFAULT 0,
    stat_end INTEGER DEFAULT 0,
    stat_sen INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL DEFAULT '',
    unlocked BOOLEAN NOT NULL DEFAULT FALSE,
    unlocked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.rewards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    cost INTEGER NOT NULL DEFAULT 100,
    description TEXT NOT NULL DEFAULT '',
    purchased BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.daily_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    quest_id UUID REFERENCES public.quests(id) ON DELETE SET NULL,
    logged_date TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Trigger: auto-create user profile + hunter_stats on signup
-- ============================================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = public
AS $$
BEGIN
  INSERT INTO public.users (id, email, username)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'username', 'Hunter')
  );

  INSERT INTO public.hunter_stats (user_id)
  VALUES (NEW.id);

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================================
-- updated_at trigger
-- ============================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_users_updated_at ON public.users;
CREATE TRIGGER trigger_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS trigger_stats_updated_at ON public.hunter_stats;
CREATE TRIGGER trigger_stats_updated_at BEFORE UPDATE ON public.hunter_stats FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- Row Level Security
-- ============================================================
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hunter_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.list_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lists ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.habits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bosses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.inventory_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rewards ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.daily_log ENABLE ROW LEVEL SECURITY;

-- RLS policies (each user sees only their own data)
CREATE POLICY "users_own" ON public.users FOR ALL USING (auth.uid() = id);
CREATE POLICY "hunter_stats_own" ON public.hunter_stats FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "list_groups_own" ON public.list_groups FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "lists_own" ON public.lists FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "quests_own" ON public.quests FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "habits_own" ON public.habits FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "bosses_own" ON public.bosses FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "skills_own" ON public.skills FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "inventory_items_own" ON public.inventory_items FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "achievements_own" ON public.achievements FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "rewards_own" ON public.rewards FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "daily_log_own" ON public.daily_log FOR ALL USING (auth.uid() = user_id);
