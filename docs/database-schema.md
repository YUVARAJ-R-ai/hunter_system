# Hunter System — Database Schema

## Overview

The Hunter System uses PostgreSQL with 12 tables, designed for Supabase-ready migration. All tables use UUID primary keys, TIMESTAMPTZ timestamps, and PostgreSQL enums for constrained types.

---

## Entity Relationship Diagram

```mermaid
erDiagram
    users ||--|| hunter_stats : "has"
    users ||--o{ list_groups : "owns"
    users ||--o{ lists : "owns"
    users ||--o{ quests : "owns"
    users ||--o{ habits : "owns"
    users ||--o{ bosses : "owns"
    users ||--o{ skills : "owns"
    users ||--o{ inventory_items : "owns"
    users ||--o{ achievements : "owns"
    users ||--o{ rewards : "owns"
    users ||--o{ daily_log : "logs"
    list_groups ||--o{ lists : "contains"
    lists ||--o{ quests : "contains"
    quests ||--o{ daily_log : "logged in"

    users {
        UUID id PK
        VARCHAR email UK
        VARCHAR password_hash
        VARCHAR username
        INT level
        INT xp
        INT gold
        INT mana
        INT max_mana
        TIMESTAMPTZ created_at
        TIMESTAMPTZ updated_at
    }

    hunter_stats {
        UUID id PK
        UUID user_id FK
        INT str
        INT int
        INT agi
        INT vit
        INT end
        INT sen
        TIMESTAMPTZ updated_at
    }

    list_groups {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        INT sort_order
        TIMESTAMPTZ created_at
    }

    lists {
        UUID id PK
        UUID user_id FK
        UUID group_id FK
        VARCHAR name
        ENUM category
        INT sort_order
        TIMESTAMPTZ created_at
    }

    quests {
        UUID id PK
        UUID user_id FK
        UUID list_id FK
        VARCHAR title
        ENUM type
        ENUM difficulty
        ENUM category
        INT xp_reward
        INT gold_reward
        ENUM stat_boost_stat
        INT stat_boost_amount
        BOOL has_deadline
        VARCHAR deadline
        BOOL completed
        BOOL failed
        BOOL is_important
        BOOL is_my_day
        TIMESTAMPTZ created_at
    }

    habits {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        ENUM category
        INT penalty_xp
        ENUM penalty_stat
        INT penalty_stat_amount
        INT streak
        TIMESTAMPTZ last_completed
        TIMESTAMPTZ created_at
    }

    bosses {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        ENUM category
        INT total_hp
        INT current_hp
        INT xp_reward
        ENUM difficulty
        BOOL defeated
        TIMESTAMPTZ created_at
    }

    skills {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        ENUM type
        INT mp_cost
        INT required_level
        ENUM category
        TEXT description
        BOOL unlocked
        TIMESTAMPTZ created_at
    }

    inventory_items {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        ENUM type
        ENUM rarity
        BOOL equipped
        TEXT description
        INT stat_str
        INT stat_int
        INT stat_agi
        INT stat_vit
        INT stat_end
        INT stat_sen
        TIMESTAMPTZ created_at
    }

    achievements {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        TEXT description
        BOOL unlocked
        TIMESTAMPTZ unlocked_at
        TIMESTAMPTZ created_at
    }

    rewards {
        UUID id PK
        UUID user_id FK
        VARCHAR name
        INT cost
        TEXT description
        BOOL purchased
        TIMESTAMPTZ created_at
    }

    daily_log {
        UUID id PK
        UUID user_id FK
        UUID quest_id FK
        TIMESTAMPTZ logged_date
    }
```

---

## Custom PostgreSQL Enums

| Enum | Values |
|------|--------|
| `quest_type` | DAILY, MAIN, SIDE, PENALTY, EMERGENCY |
| `difficulty_rank` | E, D, C, B, A, S |
| `category` | FITNESS, STUDY, WORK, HEALTH, SOCIAL, CREATIVITY |
| `item_rarity` | Common, Rare, Epic, Legendary |
| `item_type` | Weapon, Armor, Consumable, Rune, Artifact |
| `skill_type` | ACTIVE, PASSIVE |
| `stat_name` | STR, INT, AGI, VIT, END, SEN |

---

## Indexes

| Index | Table | Column(s) |
|-------|-------|-----------|
| `idx_users_email` | users | email |
| `idx_hunter_stats_user` | hunter_stats | user_id |
| `idx_list_groups_user` | list_groups | user_id |
| `idx_lists_user` | lists | user_id |
| `idx_quests_user` | quests | user_id |
| `idx_quests_status` | quests | user_id, completed, failed |
| `idx_habits_user` | habits | user_id |
| `idx_bosses_user` | bosses | user_id |
| `idx_skills_user` | skills | user_id |
| `idx_inventory_user` | inventory_items | user_id |
| `idx_achievements_user` | achievements | user_id |
| `idx_rewards_user` | rewards | user_id |
| `idx_daily_log_user` | daily_log | user_id |

---

## Triggers

- **`trigger_users_updated_at`** — Automatically updates `updated_at` on `users` table before each UPDATE
- **`trigger_stats_updated_at`** — Automatically updates `updated_at` on `hunter_stats` table before each UPDATE

---

## Supabase Migration Notes

This schema is designed for **zero-friction Supabase migration**:

1. **UUID primary keys** — Supabase default
2. **No ORM** — Raw SQL via `pg` client, identical to Supabase `supabase-js` patterns
3. **RLS-ready** — Every table has `user_id` FK for Row-Level Security policies
4. **Auth-compatible** — JWT auth maps directly to Supabase Auth
5. **Migration path**: Point `DATABASE_URL` to Supabase and import `init.sql`

---

## Full SQL Init Script

See: [`backend/sql/init.sql`](../backend/sql/init.sql)
