# Hunter System v2 — Implementation Plan

> **Scope:** UX Overhaul · Finance · Task Manager · Gym Logger · Anime System · Flutter Android
> **Status:** v2 — incorporates all user feedback (2026-04-21)

---

## 📐 System Rules (Source of Truth)

### Resource Glossary

| Resource | Symbol | Description |
|---|---|---|
| XP | ⚡ | Experience points — drives leveling up |
| Gold | 🪙 | In-game currency — spent in Reward Shop |
| HP | ❤️ | Hunter Points — micro-reward per sub-task, shows momentum |
| Mana | 💜 | Spent to unlock Skills |
| Stats | 📊 | STR/INT/AGI/VIT/END/SEN — boosted by quests and items |
| Gym Points | 🏋️ | Earned from workouts — converted to XP + STR/VIT boost |

---

### XP & Gold Flow

```
Quest
 ├─ type: DAILY | MAIN | SIDE | PENALTY | EMERGENCY
 ├─ difficulty: E → D → C → B → A → S
 ├─ xp_reward  (full amount, awarded only on parent completion)
 ├─ gold_reward (awarded only on parent completion)
 └─ Sub-Tasks[]
      ├─ Each sub-task checked → awards HP (Hunter Points)
      │    HP per subtask = FLOOR(parent_xp_reward × 0.10)
      │    HP is a motivational micro-reward — does NOT count toward leveling
      │    HP shown as "Hunter Momentum" bar on the profile page
      └─ ALL sub-tasks must be checked → parent "Complete" button unlocks
           → Parent completion: full XP + Gold + Stat boost awarded

Habit
 ├─ Check-In → streak++  AND  XP += 20 (base)
 │    Streak milestone bonuses:
 │      7-day  → 30 XP total
 │      14-day → 40 XP total
 │      30-day → 60 XP total
 └─ Penalty → XP deducted + optional stat penalty

Boss  ← see full explanation below
 ├─ Manual damage entry (progress you describe)
 ├─ Auto-damage: completing a quest tagged with boss_id
 │    → deals damage equal to that quest's xp_reward
 └─ HP reaches 0 → Boss Defeated → large XP reward + epic victory screen

Skill Unlock   → Costs mana (MP), one-time per skill
Reward Purchase → Costs gold, purchased flag resets (re-purchasable)
Gym Workout    → Gym Points → XP conversion + STR/VIT stat boosts
```

---

### 💡 What is a Boss?

> A **Boss** is a large, long-term goal too big to be a single quest.
> Inspired by Solo Leveling's dungeon raids — requires sustained effort over days or weeks.

**Real-life Boss examples:**

| Boss Name | What it represents | HP |
|---|---|---|
| "Semester Final" | Complete all final exams | 1000 HP |
| "Fitness Recomp" | Lose 8kg body fat | 2000 HP |
| "Launch MVP" | Ship your side project | 1500 HP |
| "GATE 2026" | Clear GATE competitive exam | 3000 HP |

**How you deal damage to a Boss:**
- **Manual:** You enter a progress amount (e.g. "Studied 4 chapters = 200 damage")
- **Quest-linked (new):** Tag a quest with a boss — completing it auto-deals `xp_reward` as damage

**Why not just a quest?**
- A Boss has a persistent HP bar tracking weeks of work
- Multiple quests can feed damage into one Boss simultaneously
- Defeating a Boss triggers a major milestone celebration (distinct from quest complete)

---

### Difficulty → Default Reward Scale

| Rank | XP   | Gold | Sub-task HP |
|------|------|------|-------------|
| E    | 50   | 25   | 5 HP  |
| D    | 150  | 75   | 15 HP |
| C    | 300  | 150  | 30 HP |
| B    | 600  | 300  | 60 HP |
| A    | 1200 | 600  | 120 HP |
| S    | 3000 | 1500 | 300 HP |

---

## Phase 1 — UX Overhaul & Bug Fixes

### 1.1 Known Bugs to Fix

| Bug | Location | Fix |
|-----|----------|-----|
| Duplicate Logout button | `App.tsx` L706 + L721 | Remove one |
| Boss damage uses `prompt()` | `App.tsx` L976 | Inline input |
| `is_my_day` never resets | Backend | Reset on daily load |
| `Reward.purchased` never resets | `reward.routes.ts` | Reset after purchase |
| No quest delete in UI | Quest card | Delete + confirm dialog |
| No edit UI for any entity | Everywhere | Edit modals |
| `failQuest` — no penalty | `App.tsx` L365 | Add configurable XP penalty |

### 1.2 Sub-Tasks with HP Reward

```sql
CREATE TABLE quest_subtasks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  quest_id UUID NOT NULL REFERENCES quests(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(500) NOT NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE,
  hp_reward INTEGER NOT NULL DEFAULT 5,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE users ADD COLUMN hp INTEGER NOT NULL DEFAULT 0;
```

- `hp_reward` = `FLOOR(parent_quest.xp_reward * 0.10)` — set at quest creation
- Parent "Complete" button disabled until **all** sub-tasks are checked
- XP + Gold awarded **only** on parent completion
- HP shown as "Hunter Momentum" progress bar on profile

### 1.3 Habit Check-In XP

- **Base:** 20 XP per check-in
- **Streak bonus:** 7-day → 30 XP · 14-day → 40 XP · 30-day → 60 XP
- Backend: `habit.routes.ts` checkin endpoint calls `calculateLevelUp()`

### 1.4 Boss — Quest Damage Link

```sql
ALTER TABLE quests ADD COLUMN boss_id UUID REFERENCES bosses(id) ON DELETE SET NULL;
```

- Completing a quest with `boss_id` → auto-deals `xp_reward` damage to the linked Boss
- Boss card shows: "Linked quests: N active"

### 1.5 Quick-Add Bar (MS To-Do Style)

- Sticky bottom input bar visible in all quest/list views
- `Enter` → creates DAILY quest in current selected list
- Chevron button → expands to full quest creation form

---

## Phase 2 — Finance / Wallet Module

> Replaces Money Manager app — track transactions across accounts in one place.

### 2.1 DB Schema

```sql
CREATE TABLE wallets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,          -- "SBI Savings", "GPay", "Cash"
  type VARCHAR(50) NOT NULL DEFAULT 'bank', -- bank | cash | credit | investment
  balance DECIMAL(15,2) NOT NULL DEFAULT 0,
  currency VARCHAR(10) NOT NULL DEFAULT 'INR',
  icon VARCHAR(50),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TYPE transaction_type AS ENUM ('income', 'expense', 'transfer');

CREATE TABLE transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  wallet_id UUID NOT NULL REFERENCES wallets(id) ON DELETE CASCADE,
  to_wallet_id UUID REFERENCES wallets(id) ON DELETE SET NULL, -- transfers
  type transaction_type NOT NULL,
  amount DECIMAL(15,2) NOT NULL,
  category VARCHAR(100) NOT NULL,      -- Food, Transport, Shopping, etc.
  note VARCHAR(500),
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE budget_categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  monthly_limit DECIMAL(15,2),
  icon VARCHAR(50),
  color VARCHAR(20)
);
```

### 2.2 Features

- **Dashboard:** Total balance across all wallets, monthly income vs expense card
- **Accounts:** Wallet cards with recent transaction list
- **Add Transaction:** Income / Expense / Transfer with category picker + notes
- **Budget Tracker:** Per-category monthly limit with % used progress bar
- **Reports:** Monthly bar chart + category pie chart (recharts)
- **Sidebar:** New "💰 Finance" section with Overview · Transactions · Budgets · Accounts

### 2.3 API Routes

```
GET/POST          /api/wallets
GET/PATCH/DELETE  /api/wallets/:id

GET/POST          /api/transactions
GET/PATCH/DELETE  /api/transactions/:id

GET               /api/finance/summary   ← monthly income/expense totals
GET               /api/finance/budget    ← category spend vs limit
```

---

## Phase 3 — Task Manager Upgrade (MS To-Do Parity)

### 3.1 Missing Features vs MS To-Do

| Feature | MS To-Do | Current | Plan |
|---------|----------|---------|------|
| Quick-add | Bottom bar | Modal only | Phase 1.5 |
| Sub-tasks | ✅ | ❌ | Phase 1.2 |
| Date picker | ✅ | Text field | Native date picker |
| Notes per task | ✅ | ❌ | `notes` field |
| List rename/delete | ✅ | ❌ | Context menu |
| Repeat tasks | ✅ | Habits only | `repeat_type` field |
| Completed section | Collapsed | Hidden | Collapsible section |
| Drag-and-drop | ✅ | ❌ | `dnd-kit` |
| Global search | ✅ | ❌ | Cmd+K palette |
| Task suggestions | ✅ AI | ❌ | Category templates |

### 3.2 New Quest Fields

```sql
ALTER TABLE quests ADD COLUMN notes TEXT;
ALTER TABLE quests ADD COLUMN repeat_type VARCHAR(50);  -- daily|weekly|monthly|null
ALTER TABLE quests ADD COLUMN reminder_at TIMESTAMPTZ;
ALTER TABLE quests ADD COLUMN boss_id UUID REFERENCES bosses(id) ON DELETE SET NULL;
```

### 3.3 Task Suggestions by Category

```
FITNESS:    Morning Run 5km · 100 Push-ups · Stretch 15min · Log calories
STUDY:      Read 30 pages · Solve Leetcode · Watch lecture · Flashcards
WORK:       Check emails · Team standup · Code review · Update docs
HEALTH:     Drink 2L water · Sleep by 11pm · Meditate 10min · No junk food
SOCIAL:     Call a friend · Reply messages · Plan weekend outing
CREATIVITY: Sketch idea · Write journal · Practice instrument · Side project 30min
```

---

## Phase 4 — Anime Motivational System

> Make the app feel alive with quotes and visual flair from favorite anime.

### 4.1 Quote Trigger Map

| Event | Anime Used | Example Quote |
|---|---|---|
| App open — daily | Rotating | Any from library |
| Quest complete | Solo Leveling | "You worked harder than anyone else." |
| Level up | Solo Leveling | "I alone am the exception." |
| Boss defeated | One Piece | "A man's dream never dies!" — Whitebeard |
| Habit streak 7d+ | Naruto | "A dropout will beat a genius through hard work." |
| Fail quest | Naruto | "I'm not gonna run away. I never go back on my word!" |
| S-rank quest created | COTE | "True effort goes unnoticed because it happens when no one is watching." |
| 30-day streak | COTE | "In the end, what matters is not how hard you try, but the results." |

### 4.2 Full Quote Library

**Solo Leveling**
- "I alone am the exception."
- "The moment you feel weak is the moment you begin to get stronger."
- "You worked harder than anyone else."
- "No one starts at the top. You have to earn it."
- "Even if I'm scared, I still move forward."
- "The shadows grow stronger with each battle."

**One Piece**
- "If you don't take risks, you can't create a future!" — Luffy
- "I don't want to conquer anything. I just think the guy with the most freedom is the Pirate King!" — Luffy
- "A man's dream never dies!" — Whitebeard
- "Only those who have suffered know true strength." — Rayleigh
- "People's dreams never end!" — Blackbeard
- "When do you think people die? When they are forgotten." — Dr. Hiriluk

**Naruto**
- "Hard work is worthless for those that don't believe in themselves." — Naruto
- "I'm not gonna run away. I never go back on my word!" — Naruto
- "A dropout will beat a genius through hard work." — Rock Lee
- "Those who break the rules are trash, but those who abandon their comrades are worse than trash." — Kakashi
- "Youth is not a time of life, it is a state of mind." — Might Guy
- "The next generation will always surpass the previous one." — Jiraiya

**Classroom of the Elite (COTE)**
- "Emotion is the enemy of rational thought."
- "People are creatures that change their values based on convenience."
- "The weak live by following the strong. That is the law of nature."
- "True effort goes unnoticed because it happens when no one is watching."
- "You can't win unless you stay calm under pressure."
- "In the end, what matters is not how hard you try, but the results you produce."

### 4.3 Frontend Components

```typescript
interface AnimeQuote {
  text: string;
  character: string;
  anime: 'SOLO_LEVELING' | 'ONE_PIECE' | 'NARUTO' | 'COTE';
  trigger: 'daily' | 'quest_complete' | 'level_up' | 'boss_defeat' | 'streak' | 'fail';
}
```

| Component | Purpose |
|---|---|
| `QuoteBanner` | Dashboard header — daily rotating quote with glow |
| `VictoryModal` | Level up — full-screen flash + anime quote |
| `BossDefeatScreen` | Boss killed — epic particle animation + quote |
| `ToastQuote` | Quest complete — small toast with character name |
| `StreakBadge` | Streak milestone popup with Naruto orange theme |

### 4.4 Visual Themes per Anime

| Anime | Colors | Aesthetic |
|---|---|---|
| Solo Leveling | Electric blue + purple | "System" portal UI |
| One Piece | Gold + warm navy | Adventure |
| Naruto | Orange + red | Energy burst |
| COTE | Cold silver + white | Calculated precision |

### 4.5 Avatar Silhouettes (to Generate)

Four stylized character avatars for profile/loading screens:
- Shadow Monarch (Solo Leveling)
- Pirate Captain (One Piece)
- Ninja (Naruto)
- Elite Student (COTE)

---

## Phase 5 — Gym Logger Module (Hevy-Inspired)

> Replace Hevy. Full workout tracking with muscle heatmap, live session analysis, and XP rewards.

### 5.1 User Flow

```
Open Gym Tab
  → Start Workout (name it: "Push Day")
    → Search + Add Exercises from library
      → Log sets: reps × weight (or time/distance for cardio)
        → Live: volume counter, muscle badges, PR alerts, XP preview
    → Finish Workout
      → XP + Gym Points calculated → awarded to hunter
      → STR/VIT stats boosted
      → Personal records saved
```

### 5.2 Full DB Schema

```sql
-- Muscle group catalogue
CREATE TABLE muscle_groups (
  id VARCHAR(50) PRIMARY KEY,          -- 'chest', 'back', 'biceps', etc.
  name VARCHAR(100) NOT NULL,
  region VARCHAR(50) NOT NULL          -- 'upper' | 'lower' | 'core' | 'cardio'
);

-- Exercise library (pre-seeded + custom)
CREATE TABLE exercises (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(255) NOT NULL,
  category VARCHAR(100) NOT NULL,      -- Barbell | Dumbbell | Cable | Machine | Bodyweight | Cardio
  primary_muscle VARCHAR(50) REFERENCES muscle_groups(id),
  secondary_muscles TEXT[],            -- array of muscle_group ids
  equipment VARCHAR(100),
  difficulty difficulty_rank NOT NULL DEFAULT 'D',
  instructions TEXT,
  is_custom BOOLEAN NOT NULL DEFAULT FALSE,
  created_by UUID REFERENCES users(id) ON DELETE SET NULL
);

-- Workout sessions
CREATE TABLE workout_sessions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255),                   -- "Push Day", "Leg Day"
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  finished_at TIMESTAMPTZ,
  duration_minutes INTEGER,
  total_volume_kg DECIMAL(10,2),       -- Σ (sets × reps × weight)
  gym_points INTEGER NOT NULL DEFAULT 0,
  xp_awarded INTEGER NOT NULL DEFAULT 0,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Exercises within a session
CREATE TABLE workout_exercises (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  session_id UUID NOT NULL REFERENCES workout_sessions(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id),
  exercise_order INTEGER NOT NULL DEFAULT 0,
  notes TEXT
);

-- Individual sets
CREATE TABLE workout_sets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  workout_exercise_id UUID NOT NULL REFERENCES workout_exercises(id) ON DELETE CASCADE,
  set_number INTEGER NOT NULL,
  reps INTEGER,
  weight_kg DECIMAL(6,2),
  duration_seconds INTEGER,            -- timed exercises
  distance_km DECIMAL(6,2),           -- cardio
  is_warmup BOOLEAN NOT NULL DEFAULT FALSE,
  is_personal_record BOOLEAN NOT NULL DEFAULT FALSE,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

-- Personal records
CREATE TABLE personal_records (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id),
  record_type VARCHAR(50) NOT NULL,    -- max_weight | max_reps | max_volume
  value DECIMAL(10,2) NOT NULL,
  achieved_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  session_id UUID REFERENCES workout_sessions(id)
);
```

### 5.3 Muscle Group Seed Data

```
Upper Body: chest, lats, back, traps, shoulders, biceps, triceps, forearms
Lower Body: quads, hamstrings, glutes, calves, hip_flexors
Core:       abs, obliques, lower_back, erector_spinae
Full/Cardio: full_body, cardio
```

### 5.4 Exercise Library (sample — seed 200+ total)

| Exercise | Category | Primary Muscle | Secondary |
|---|---|---|---|
| Bench Press | Barbell | chest | triceps, shoulders |
| Incline DB Press | Dumbbell | chest | shoulders |
| Deadlift | Barbell | lats, back | glutes, hamstrings, core |
| Barbell Row | Barbell | back | biceps |
| Pull-up | Bodyweight | lats | biceps |
| Lat Pulldown | Cable | lats | biceps |
| Overhead Press | Barbell | shoulders | triceps |
| Face Pull | Cable | shoulders | traps |
| Squat | Barbell | quads | glutes, hamstrings |
| Leg Press | Machine | quads | glutes |
| Romanian Deadlift | Barbell | hamstrings | glutes |
| Hip Thrust | Barbell | glutes | hamstrings |
| Dumbbell Curl | Dumbbell | biceps | forearms |
| Hammer Curl | Dumbbell | biceps | forearms |
| Tricep Pushdown | Cable | triceps | — |
| Skull Crushers | Barbell | triceps | — |
| Running | Cardio | cardio | full_body |
| Cycling | Cardio | cardio | quads |
| Plank | Bodyweight | abs | lower_back |
| Crunches | Bodyweight | abs | obliques |

### 5.5 XP & Gym Points Scoring Formula

```
Strength workouts:
  Total Volume (kg) = Σ (reps × weight_kg) across all non-warmup sets
  Gym Points = FLOOR(Total Volume / 50)

Cardio workouts:
  Gym Points = FLOOR((distance_km × 100 + duration_minutes × 10) / 5)

XP Conversion (difficulty bracket by Gym Points):
  < 100 GP   → × 1.0  (E-rank session)
  100–300 GP → × 1.5  (D-rank session)
  300–700 GP → × 2.0  (C-rank session)
  700+ GP    → × 3.0  (B-rank session)

Stat Boosts:
  Per strength exercise in session → STR += FLOOR(completed_sets / 3)
  Per cardio exercise in session   → VIT += 1
  Personal Record beaten           → +50 bonus XP + relevant stat +2
```

### 5.6 Muscle Group Heatmap

SVG front + back body diagram. Muscle regions color-coded:

| Color | Meaning |
|---|---|
| ⬜ Gray | Not worked in 7+ days |
| 🔵 Blue | Worked 3–7 days ago |
| 🟢 Green | Worked 1–2 days ago |
| 🟠 Orange | Worked today |
| 🔴 Red | Overworked — 3+ consecutive days (shows recovery warning) |

- Hover tooltip: last worked date, this-week frequency, weekly volume
- **Weekly Balance Score:** % of major muscle groups hit (encourages full-body coverage)

### 5.7 Live Workout Session UI

| Element | Behaviour |
|---|---|
| Volume counter | Updates on every set logged |
| Muscle badges | Lights up primary + secondary muscles per added exercise |
| Session compare | Shows vs. last session with same name (volume delta) |
| PR flash | Animated alert when a personal record is beaten |
| XP preview | Running estimate of XP you'll earn when you finish |

### 5.8 Analytics & History

- **Volume over time:** Line chart per muscle group (recharts)
- **Workout calendar:** GitHub-style activity heatmap
- **PR progression:** Charts for Bench / Squat / Deadlift over time
- **Weekly muscle coverage:** Radar chart of muscle groups hit this week

### 5.9 API Routes

```
GET/POST              /api/exercises
GET                   /api/exercises/:id

GET/POST              /api/workouts
GET/PATCH/DELETE      /api/workouts/:id

POST                  /api/workouts/:id/exercises
DELETE                /api/workouts/:id/exercises/:exId

POST                  /api/workouts/:id/exercises/:exId/sets
PATCH/DELETE          /api/sets/:id

GET                   /api/gym/muscle-heatmap    ← frequency per muscle (7d/30d)
GET                   /api/gym/records           ← all personal records
GET                   /api/gym/analytics         ← volume trends
GET                   /api/gym/weekly-summary    ← this week overview
```

---

## Phase 6 — Flutter Android Setup (NixOS)

> See [android_setup.md](file:///home/yuvaraj/.gemini/antigravity/brain/ee241a61-d1cd-4fc7-ae3e-d38bc331001e/android_setup.md) for full step-by-step guide.

**Current State:**

| Item | Status |
|---|---|
| Flutter 3.38.3 | ✅ Installed via Nix |
| Genymotion | ✅ Installed — Google Pixel 7 Pro VM deployed |
| `adb` | ✅ `/nix/store/.../android-tools-35.0.2/bin/adb` |
| Physical phone | ✅ Connected, developer options on |
| `ANDROID_SDK_ROOT` | ❌ Not set — Flutter can't build Android |
| Android build-tools | ❌ Not installed |

**Fix:** Install via NixOS `androidenv` → set `ANDROID_SDK_ROOT` → `flutter config --android-sdk` → accept licenses → `flutter run`

---

## All New API Routes Summary

```
# Phase 1 — Sub-tasks
POST/GET              /api/quests/:id/subtasks
PATCH/DELETE          /api/subtasks/:id

# Phase 2 — Finance
GET/POST              /api/wallets
GET/PATCH/DELETE      /api/wallets/:id
GET/POST              /api/transactions
GET/PATCH/DELETE      /api/transactions/:id
GET                   /api/finance/summary
GET                   /api/finance/budget

# Phase 5 — Gym Logger
GET/POST              /api/exercises
GET                   /api/exercises/:id
GET/POST              /api/workouts
GET/PATCH/DELETE      /api/workouts/:id
POST                  /api/workouts/:id/exercises
DELETE                /api/workouts/:id/exercises/:exId
POST                  /api/workouts/:id/exercises/:exId/sets
PATCH/DELETE          /api/sets/:id
GET                   /api/gym/muscle-heatmap
GET                   /api/gym/records
GET                   /api/gym/analytics
GET                   /api/gym/weekly-summary
```

---

## Delivery Order

| Priority | Feature | Effort |
|----------|---------|--------|
| 🔥 Critical | Bug fixes (dupe logout, boss prompt, reward reset) | 0.5 day |
| 🔥 Critical | Habit check-in XP (base 20 + streak bonus) | 0.5 day |
| 🔥 Critical | Sub-task HP award + HP momentum bar | 1 day |
| 🔥 Critical | Flutter Android SDK setup on NixOS | 2–4 hrs |
| ⚡ High | Anime quotes + themed visual system | 1 day |
| ⚡ High | Boss UI overhaul + linked quest damage | 1 day |
| ⚡ High | Finance / Wallet module — full stack | 3–4 days |
| 📌 Medium | Gym Logger: DB migrations + API + 200+ exercise seed | 2–3 days |
| 📌 Medium | Gym Logger: workout session UI (live logging) | 2 days |
| 📌 Medium | Muscle heatmap + live analysis + analytics charts | 1–2 days |
| 📌 Medium | Quick-add bar + quest edit + list rename/delete | 1 day |
| 🌀 Later | Mobile Flutter: Finance + Gym views | 2–3 days |
| 🌀 Later | Drag-and-drop reorder + global Cmd+K search | 1 day |
