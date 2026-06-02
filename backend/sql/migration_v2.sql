-- Alter users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_in_penalty_zone BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS penalty_ends_at TIMESTAMPTZ;
ALTER TABLE users ADD COLUMN IF NOT EXISTS stat_points INTEGER NOT NULL DEFAULT 0;

-- Create quest_subtasks table
CREATE TABLE IF NOT EXISTS quest_subtasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    quest_id UUID NOT NULL REFERENCES quests(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(500) NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    hp_reward INTEGER NOT NULL DEFAULT 5,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Alter users table to add HP
ALTER TABLE users ADD COLUMN IF NOT EXISTS hp INTEGER NOT NULL DEFAULT 0;

-- Alter quests table to link to boss
ALTER TABLE quests ADD COLUMN IF NOT EXISTS boss_id UUID REFERENCES bosses(id) ON DELETE SET NULL;

-- Create shadows table
CREATE TABLE IF NOT EXISTS shadows (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    rank VARCHAR(50) NOT NULL DEFAULT 'Normal',
    assigned_list_id UUID REFERENCES lists(id) ON DELETE SET NULL,
    xp_buff_multiplier DECIMAL(3,2) NOT NULL DEFAULT 1.10,
    extracted_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
