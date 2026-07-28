-- Migration 003: Extend Exercises Schema for ExerciseDB Data

-- Add new columns
ALTER TABLE public.exercises 
ADD COLUMN IF NOT EXISTS body_part VARCHAR(100),
ADD COLUMN IF NOT EXISTS equipment VARCHAR(100),
ADD COLUMN IF NOT EXISTS gif_url TEXT,
ADD COLUMN IF NOT EXISTS secondary_muscles TEXT[],
ADD COLUMN IF NOT EXISTS instructions TEXT[],
ADD COLUMN IF NOT EXISTS external_id VARCHAR(255) UNIQUE;

-- Create search indexes for exercises
CREATE INDEX IF NOT EXISTS exercises_target_muscle_idx ON public.exercises(target_muscle);
CREATE INDEX IF NOT EXISTS exercises_body_part_idx ON public.exercises(body_part);
CREATE INDEX IF NOT EXISTS exercises_equipment_idx ON public.exercises(equipment);
CREATE INDEX IF NOT EXISTS exercises_user_id_idx ON public.exercises(user_id);

