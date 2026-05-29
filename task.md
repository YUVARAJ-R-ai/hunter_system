# Hunter System v2 — Task Tracker

> Last updated: 2026-04-21 | See `docs/implementation_plan.md` for full design spec

---

## 🔴 Phase 1 — UX Overhaul & Bug Fixes

### 1A — Critical Bug Fixes (Frontend)
- [ ] Remove duplicate Logout button in header (`App.tsx` L706-728, keep only one)
- [ ] Replace Boss `prompt()` with inline damage input UI (`App.tsx` L976)
- [ ] Add Quest delete button + confirm dialog in Quest card
- [ ] Add Quest edit modal (title, difficulty, category, deadline, list)
- [ ] Fix `is_my_day` auto-reset: reset flag on load if last updated != today
- [ ] Add "fail penalty" config toggle (optional XP deduction on fail quest)
- [ ] Fix `Reward.purchased` to allow repeat purchase (reset purchased flag after redeem)

### 1B — Sub-Tasks Under Quests
- [ ] DB migration: Create `quest_subtasks` table
- [ ] Backend: Add `subtask.routes.ts` with CRUD under `/api/quests/:id/subtasks`
- [ ] Backend: Register subtask routes in `index.ts`
- [ ] Frontend: Add subtask type to `types.ts`
- [ ] Frontend: Add subtask API methods to `api/client.ts`
- [ ] Frontend: Build `SubTaskList` component inside Quest card (collapsible)
- [ ] Frontend: Disable "Complete Quest" button when subtasks remain unchecked
- [ ] Frontend: Map subtasks in `refreshData()`

### 1C — Quick-Add Bar (MS To-Do Style)
- [ ] Frontend: Build `QuickAddBar` component — sticky at bottom of quest view
- [ ] Frontend: Enter key creates DAILY quest in current selected list
- [ ] Frontend: Chevron expands to show full quest creation fields
- [ ] Mobile: FAB (Floating Action Button) for quick-add on small screens

### 1D — UX Polish
- [ ] Add completed quests collapsible section at bottom of quest view
- [ ] Add quest sorting (Deadline / Difficulty / Created / Importance)
- [ ] Add quest filter controls (Category, Type)
- [ ] Add global search bar (Cmd/Ctrl+K shortcut)
- [ ] Add list rename/delete with context menu
- [ ] Add drag-and-drop reorder for quests within a list (dnd-kit)
- [ ] Mobile: Add bottom tab bar navigation (My Day · All · Lists · Profile)
- [ ] Add proper date picker for deadlines (replace text input)

---

## 🟡 Phase 2 — Finance / Wallet Module

### 2A — Database
- [ ] DB migration: Create `wallets` table
- [ ] DB migration: Create `transactions` table with `transaction_type` enum
- [ ] DB migration: Create `budget_categories` table
- [ ] Add indexes on `transactions(user_id, date)` and `transactions(wallet_id)`

### 2B — Backend
- [ ] Create `wallet.routes.ts` (CRUD)
- [ ] Create `transaction.routes.ts` (CRUD + list with filters)
- [ ] Create `finance.routes.ts` (summary + budget endpoints)
- [ ] Register all finance routes in `index.ts`
- [ ] Build `/api/finance/summary` → monthly income, expense, net per wallet
- [ ] Build `/api/finance/budget` → category spend vs monthly limit

### 2C — Frontend
- [ ] Add `Wallet`, `Transaction`, `BudgetCategory` types to `types.ts`
- [ ] Add finance API methods to `api/client.ts`
- [ ] Add `Finance` tab to sidebar with sub-navigation
- [ ] Build `FinanceDashboard` — total balance, income/expense cards, mini chart
- [ ] Build `WalletCard` component
- [ ] Build `TransactionForm` — add income/expense/transfer with category picker
- [ ] Build `TransactionList` — filterable, paginated transaction log
- [ ] Build `BudgetTracker` — category cards with progress bar (spend/limit)
- [ ] Build `FinanceReports` — monthly bar chart + category pie chart (recharts)
- [ ] Fetch finance data in `refreshData()` or lazy-load on tab switch

---

## 🟢 Phase 3 — Task Manager Upgrade

### 3A — New Quest Fields
- [ ] DB migration: `ALTER TABLE quests ADD COLUMN notes TEXT`
- [ ] DB migration: `ALTER TABLE quests ADD COLUMN repeat_type VARCHAR(50)`
- [ ] DB migration: `ALTER TABLE quests ADD COLUMN reminder_at TIMESTAMPTZ`
- [ ] Backend: Update quest CRUD to handle new fields
- [ ] Frontend: Update Quest type in `types.ts`
- [ ] Frontend: Add notes textarea to quest create/edit modal
- [ ] Frontend: Add repeat selector (none / daily / weekly / monthly)

### 3B — Task Suggestions
- [ ] Frontend: Build `SuggestionsPanel` component
- [ ] Frontend: Define suggestion templates per category
- [ ] Frontend: Show suggestions when list is empty or on click "Suggest tasks"
- [ ] Frontend: Clicking suggestion pre-fills quick-add bar

---

## 🔵 Phase 4 — Flutter Android Setup (NixOS)

### 4A — Android SDK Configuration
- [ ] Check Genymotion SDK path: `ls /home/yuvaraj/.Genymobile/Genymotion/`
- [ ] Set ANDROID_SDK_ROOT to correct path and run `flutter config --android-sdk $ANDROID_SDK_ROOT`
- [ ] Accept Flutter Android licenses: `cd mobile && flutter doctor --android-licenses`
- [ ] Verify: `flutter doctor` shows Android toolchain checkmark

### 4B — Genymotion Device
- [ ] Start Genymotion → start "Google Pixel 7 Pro" VM
- [ ] Verify ADB: `adb devices` (Genymotion device should appear)
- [ ] If not shown: `adb connect 127.0.0.1:<genymotion-adb-port>`
- [ ] Run: `cd mobile && flutter run -d <device-id>`

### 4C — Physical Android Device
- [ ] Confirm device in `adb devices` as `device` (not `unauthorized`)
- [ ] If `unauthorized`: accept RSA key prompt on phone screen
- [ ] Run: `flutter run -d <physical-device-id>`

### 4D — Mobile App Config
- [ ] Update `mobile/lib/core/config.dart` API base URL to LAN IP (`http://<IP>:3001`)
- [ ] Run `flutter pub get`
- [ ] Hot-reload test on device

---

## 🟣 Phase 5 — Backend API Additions

- [ ] `subtask.routes.ts` — CRUD for quest subtasks
- [ ] `wallet.routes.ts` — wallet management
- [ ] `transaction.routes.ts` — transaction CRUD with filter support
- [ ] `finance.routes.ts` — summary and budget analytics
- [ ] Add `repeat_type` handling: auto-recreate quest on completion if repeat set
- [ ] Add `is_my_day` reset endpoint (or reset on daily GET)

---

## ✅ Already Done

- [x] Docker containerized backend + frontend + PostgreSQL
- [x] JWT Auth (login/register)
- [x] Quest CRUD with XP/Gold award on complete
- [x] Boss raids with HP damage tracking
- [x] Habit check-in + penalty system
- [x] Skill tree with mana-cost unlock
- [x] Inventory with equip/unequip
- [x] Achievements system
- [x] Reward shop
- [x] List groups + lists (MS To-Do structure)
- [x] My Day / Important / Planned views
- [x] Flutter mobile app scaffold (Riverpod + Supabase auth)
- [x] Supabase connection configured in mobile app

---

## 🎌 Phase 4 — Anime Motivational System

### 4A — Quote Engine
- [ ] Create `frontend/src/data/quotes.ts` with full quote library (Solo Leveling, One Piece, Naruto, COTE)
- [ ] Build `QuoteEngine` utility — pick quote by trigger type (daily, quest_complete, level_up, etc.)
- [ ] Build `QuoteBanner` component — dashboard greeting with daily quote + glow animation
- [ ] Build `VictoryModal` — level up full-screen overlay with anime color flash + quote
- [ ] Build `BossDefeatScreen` — epic animated victory overlay
- [ ] Add `ToastQuote` — small notification on quest complete with character/anime attribution
- [ ] Wire triggers: quest complete → toast, level up → modal, boss defeat → epic screen
- [ ] Add `is_my_day` reset trigger on daily app open

### 4B — Visual Theming
- [ ] Define anime CSS theme classes (Solo Leveling: blue/purple, One Piece: gold, Naruto: orange, COTE: silver)
- [ ] Apply themed glow/accent to victory animations based on random anime selection

### 4C — Character Avatars (Generated Images)
- [ ] Generate Shadow Monarch silhouette avatar (Solo Leveling style)
- [ ] Generate Pirate Captain silhouette avatar (One Piece style)
- [ ] Generate Ninja silhouette avatar (Naruto style)
- [ ] Generate Elite Student silhouette avatar (COTE style)
- [ ] Add avatar picker to Profile page
- [ ] Use selected avatar on loading screen and profile card

---

## 🏋️ Phase 5 — Gym Logger Module

### 5A — Database
- [ ] DB migration: Create `muscle_groups` table + seed all muscle groups
- [ ] DB migration: Create `exercises` table + seed 200+ exercises with muscle tags
- [ ] DB migration: Create `workout_sessions` table
- [ ] DB migration: Create `workout_exercises` table
- [ ] DB migration: Create `workout_sets` table
- [ ] DB migration: Create `personal_records` table
- [ ] Add indexes on workout_sessions(user_id), workout_sets(workout_exercise_id)

### 5B — Backend
- [ ] Create `exercise.routes.ts` — GET (search/filter by muscle/category), POST (custom)
- [ ] Create `workout.routes.ts` — full CRUD for sessions + nested exercises + sets
- [ ] Create `gym.routes.ts` — muscle-heatmap, records, analytics, weekly-summary endpoints
- [ ] Build XP/Gym Points calculation logic in `gameLogic.ts`
- [ ] Build PR detection on set save (compare to personal_records)
- [ ] Build stat award logic: STR per strength, VIT per cardio
- [ ] Register all gym routes in `index.ts`

### 5C — Frontend: Exercise Library
- [ ] Add Gym types to `types.ts`: Exercise, MuscleGroup, WorkoutSession, WorkoutSet, PersonalRecord
- [ ] Add gym API methods to `api/client.ts`
- [ ] Add `Gym` section to sidebar
- [ ] Build `ExerciseLibrary` — searchable, filterable by muscle group and category
- [ ] Build `ExerciseCard` — shows primary/secondary muscles as colored badges

### 5D — Frontend: Workout Session
- [ ] Build `StartWorkoutModal` — name + start session
- [ ] Build `ActiveWorkoutView` — main logging UI during session
- [ ] Build `ExerciseSetRow` — input set number, reps, weight; mark complete
- [ ] Build live volume counter (updates on each set)
- [ ] Build live muscle group activity panel (badges light up per exercise)
- [ ] Build PR alert component (flashes when a record is beaten mid-session)
- [ ] Build XP preview counter (estimated XP at finish)
- [ ] Build `FinishWorkoutModal` — show summary before submitting

### 5E — Frontend: Muscle Heatmap
- [ ] Build SVG body diagram component (front view)
- [ ] Build SVG body diagram component (back view)
- [ ] Color muscle regions by recency (gray → blue → green → orange → red)
- [ ] Add hover tooltip: last worked, frequency, volume this week
- [ ] Add recovery warning for overworked muscle groups (red + banner)
- [ ] Build weekly balance score (% of major muscle groups hit)

### 5F — Frontend: Analytics & History
- [ ] Build `GymHistory` — list of past workout sessions with stats
- [ ] Build `VolumeChart` — line chart per muscle over time (recharts)
- [ ] Build `WorkoutCalendar` — GitHub-style heatmap of workout days
- [ ] Build `PRChart` — progression chart for Bench/Squat/Deadlift
- [ ] Build `WeeklyCoverage` — radar chart of muscles hit this week

### 5G — Mobile (Flutter)
- [ ] Build Gym Logger screens in Flutter (parallel after web is done)
- [ ] Muscle heatmap as interactive Flutter widget


---

## ⏱️ Phase 7 — Time Management System

### 7A — Quest Time Estimates
- [ ] DB migration: `ALTER TABLE quests ADD COLUMN estimated_minutes INTEGER`
- [ ] DB migration: `ALTER TABLE quests ADD COLUMN actual_minutes INTEGER NOT NULL DEFAULT 0`
- [ ] DB migration: Create `focus_sessions` table
- [ ] Backend: `focus.routes.ts` — start/stop focus session, auto-log actual_minutes
- [ ] Frontend: Add `TimeEstimatePicker` to quest create/edit modal (5, 15, 30, 60, 90, 120 min)
- [ ] Frontend: Show estimated time badge on quest cards

### 7B — Daily Load Meter (My Day)
- [ ] Frontend: Build `DailyLoadBar` component — shows total estimated minutes vs 240-min limit
- [ ] Frontend: Color code: green < 240min, yellow 240–360min, red 360+min
- [ ] Frontend: Show warning toast when My Day exceeds 360 min with anime quote

### 7C — Pomodoro Focus Timer
- [ ] Frontend: Build floating `FocusTimer` widget — 25min work / 5min break rounds
- [ ] Frontend: Timer persists across tab changes (React context / localStorage)
- [ ] Frontend: Award +5 XP per completed Pomodoro round (call backend)
- [ ] Frontend: After 4 rounds → long break modal + anime motivational quote
- [ ] Backend: `POST /api/focus/start` and `POST /api/focus/stop` endpoints

### 7D — Morning Planning Modal
- [ ] Frontend: Detect first login of day → show `MorningPlanModal`
- [ ] Frontend: Slider "How many hours do you have today?" (1–8 hrs)
- [ ] Frontend: Auto-suggest tasks fitting time budget, sorted by priority + deadline
- [ ] Frontend: "Start My Day" confirms and adds selected tasks to My Day

---

## 🗂️ Phase 8 — List Organization Enhancements

### 8A — Group Improvements (DB)
- [ ] DB migration: `ALTER TABLE list_groups ADD COLUMN icon VARCHAR(50) DEFAULT 'folder'`
- [ ] DB migration: `ALTER TABLE list_groups ADD COLUMN color VARCHAR(20) DEFAULT '#1e90ff'`
- [ ] DB migration: `ALTER TABLE list_groups ADD COLUMN description TEXT`

### 8B — Frontend Group UI
- [ ] Sidebar: Show group as colored section header with icon + task count badge
- [ ] Sidebar: Clicking group name → opens "Group Overview" (all tasks across its lists)
- [ ] Frontend: Group color dot visible on each quest card (shows which group it belongs to)
- [ ] Frontend: List context label on quest card ("Academics › Computer Networks")
- [ ] Frontend: Group edit modal — change name, icon, color

### 8C — Default Group Seeding
- [ ] Backend: On new user registration → seed 5 default groups: Academics, Fitness, Work, Skills, Personal
- [ ] Backend: Each default group gets one starter list

---

## 🔔 Phase 9 — Daily Login & Retention

### 9A — Login Streak (DB)
- [ ] DB migration: `ALTER TABLE users ADD COLUMN login_streak INTEGER NOT NULL DEFAULT 0`
- [ ] DB migration: `ALTER TABLE users ADD COLUMN last_login_date DATE`
- [ ] DB migration: `ALTER TABLE users ADD COLUMN longest_login_streak INTEGER NOT NULL DEFAULT 0`
- [ ] DB migration: Create `daily_logins` table
- [ ] DB migration: Create `daily_challenges` table

### 9B — Backend
- [ ] `POST /api/auth/daily-login` — awards streak XP, updates streak count
- [ ] `GET /api/daily-challenges` — returns today's 3 auto-generated challenges
- [ ] `POST /api/daily-challenges/:id/complete` — marks challenge done, awards XP
- [ ] `GET /api/activity-calendar` — login + completion history for calendar heatmap
- [ ] Login streak XP table: Day 1=30, Day 3=50, Day 7=100, Day 14=150, Day 30=300 XP

### 9C — Frontend
- [ ] Call `daily-login` on every app load after auth (once per calendar day)
- [ ] Build `SystemMessageOverlay` — dramatic Solo Leveling-style login message
- [ ] Show login streak on sidebar footer and profile page
- [ ] Build `DailyChallengeBanner` — 3 auto-challenges shown at top of My Day
- [ ] Build `ActivityCalendar` — GitHub-style heatmap on profile page
- [ ] Login streak reset warning: show "⚠️ Streak at risk!" if not logged in past 20hrs

### 9D — PWA Notifications
- [ ] Add `manifest.json` to frontend public folder
- [ ] Register service worker in `main.tsx`
- [ ] Implement push notification for streak reminder at 8PM local time
- [ ] Show "Add to Home Screen" banner on first mobile visit

---

## 📱 Phase 10 — Mobile-First Responsive Design

### 10A — Bottom Tab Bar
- [ ] Frontend: Add `useMediaQuery('(max-width: 768px)')` hook
- [ ] Frontend: Build `BottomTabBar` — 5 tabs: My Day, Quests, Profile, Gym, Finance
- [ ] Frontend: Render BottomTabBar instead of sidebar on mobile
- [ ] Frontend: Sidebar accessible via hamburger → `SlideInDrawer` from left
- [ ] Frontend: Active tab has accent glow + label

### 10B — Mobile Modals (Bottom Sheet)
- [ ] Refactor all modals → detect mobile → animate sliding up from bottom (`motion.div y: 100% → 0`)
- [ ] All mobile modals: full-screen height, drag-down to dismiss
- [ ] Quest create/edit: multi-step bottom sheet on mobile (title → details → rewards)

### 10C — Touch Interactions
- [ ] Add swipe right on quest card → complete (green flash animation)
- [ ] Add swipe left on quest card → show delete/fail actions
- [ ] Add long-press on quest → context menu (edit, move, star, my-day toggle)
- [ ] Habit card: large tap area for check-in, swipe for penalty

### 10D — Mobile Layout Fixes
- [ ] Quest cards: `grid-cols-1` on mobile, `grid-cols-2` on md+
- [ ] All buttons: minimum 44px touch target
- [ ] FAB (Floating Action Button): replace quick-add bar with FAB on mobile
- [ ] Muscle heatmap: swipeable carousel (front view / back view) on mobile
- [ ] Charts: horizontally scrollable containers on mobile

### 10E — PWA Setup
- [ ] Create `public/manifest.json` with Hunter System branding
- [ ] Generate PWA icons (192×192, 512×512)
- [ ] Add `<link rel="manifest">` to `index.html`
- [ ] Register service worker for offline support of cached assets
- [ ] Test "Add to Home Screen" on Android Chrome
