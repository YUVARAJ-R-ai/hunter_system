CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE quest_type AS ENUM ('DAILY','MAIN','SIDE','PENALTY','EMERGENCY');
CREATE TYPE difficulty_rank AS ENUM ('E','D','C','B','A','S');
CREATE TYPE category AS ENUM ('FITNESS','STUDY','WORK','HEALTH','SOCIAL','CREATIVITY');
CREATE TYPE item_rarity AS ENUM ('Common','Rare','Epic','Legendary');
CREATE TYPE item_type AS ENUM ('Weapon','Armor','Consumable','Rune','Artifact');
CREATE TYPE skill_type AS ENUM ('ACTIVE','PASSIVE');
CREATE TYPE stat_name AS ENUM ('STR','INT','AGI','VIT','END','SEN');

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL DEFAULT 'Hunter',
    level INTEGER NOT NULL DEFAULT 1,
    xp INTEGER NOT NULL DEFAULT 0,
    gold INTEGER NOT NULL DEFAULT 0,
    mana INTEGER NOT NULL DEFAULT 100,
    max_mana INTEGER NOT NULL DEFAULT 100,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_users_email ON users(email);

CREATE TABLE hunter_stats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    str INTEGER NOT NULL DEFAULT 10,
    "int" INTEGER NOT NULL DEFAULT 10,
    agi INTEGER NOT NULL DEFAULT 10,
    vit INTEGER NOT NULL DEFAULT 10,
    "end" INTEGER NOT NULL DEFAULT 10,
    sen INTEGER NOT NULL DEFAULT 10,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE list_groups (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE lists (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    group_id UUID REFERENCES list_groups(id) ON DELETE SET NULL,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'WORK',
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE quests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    list_id UUID REFERENCES lists(id) ON DELETE SET NULL,
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

CREATE TABLE habits (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'HEALTH',
    penalty_xp INTEGER NOT NULL DEFAULT 50,
    penalty_stat stat_name,
    penalty_stat_amount INTEGER DEFAULT 0,
    streak INTEGER NOT NULL DEFAULT 0,
    last_completed TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE bosses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    category category NOT NULL DEFAULT 'WORK',
    total_hp INTEGER NOT NULL DEFAULT 500,
    current_hp INTEGER NOT NULL DEFAULT 500,
    xp_reward INTEGER NOT NULL DEFAULT 1000,
    difficulty difficulty_rank NOT NULL DEFAULT 'E',
    defeated BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE skills (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    type skill_type NOT NULL DEFAULT 'ACTIVE',
    mp_cost INTEGER NOT NULL DEFAULT 0,
    required_level INTEGER NOT NULL DEFAULT 1,
    category category NOT NULL DEFAULT 'FITNESS',
    description TEXT NOT NULL DEFAULT '',
    unlocked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE inventory_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    type item_type NOT NULL DEFAULT 'Artifact',
    rarity item_rarity NOT NULL DEFAULT 'Common',
    equipped BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT NOT NULL DEFAULT '',
    stat_str INTEGER DEFAULT 0, stat_int INTEGER DEFAULT 0,
    stat_agi INTEGER DEFAULT 0, stat_vit INTEGER DEFAULT 0,
    stat_end INTEGER DEFAULT 0, stat_sen INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE achievements (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL DEFAULT '',
    unlocked BOOLEAN NOT NULL DEFAULT FALSE,
    unlocked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE rewards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    cost INTEGER NOT NULL DEFAULT 100,
    description TEXT NOT NULL DEFAULT '',
    purchased BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE daily_log (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    quest_id UUID REFERENCES quests(id) ON DELETE SET NULL,
    logged_date TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_hunter_stats_user ON hunter_stats(user_id);
CREATE INDEX idx_list_groups_user ON list_groups(user_id);
CREATE INDEX idx_lists_user ON lists(user_id);
CREATE INDEX idx_quests_user ON quests(user_id);
CREATE INDEX idx_quests_status ON quests(user_id, completed, failed);
CREATE INDEX idx_habits_user ON habits(user_id);
CREATE INDEX idx_bosses_user ON bosses(user_id);
CREATE INDEX idx_skills_user ON skills(user_id);
CREATE INDEX idx_inventory_user ON inventory_items(user_id);
CREATE INDEX idx_achievements_user ON achievements(user_id);
CREATE INDEX idx_rewards_user ON rewards(user_id);
CREATE INDEX idx_daily_log_user ON daily_log(user_id);

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER trigger_stats_updated_at BEFORE UPDATE ON hunter_stats FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
