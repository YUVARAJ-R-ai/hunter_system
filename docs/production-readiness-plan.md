# Hunter System — Bug Fixes, Task Manager & Production-Readiness Plan

## Context

Hunter System is a gamified task/fitness RPG. Current stack in scope: the **Flutter
app in `mobile/`** on **Supabase** (Postgres + Auth + RLS + RPCs). Every other
component in the repo (`backend/` Express API, root `src/` Firebase prototype,
`frontend/` React web) is dead code from earlier iterations.

The user is shipping **only the Flutter app to the Play Store**, but wants the
**task manager (Quests) working perfectly first**, and is **deprioritizing the
workout menu** for now. Two live bugs block daily use, the app is inefficient
(refetches the entire DB on every open), and the task manager is missing
scheduling/recurrence that other task managers have. This plan sequences those
first, then the remaining production-readiness work, **with time estimates**.

Estimates are in **developer-days** for one developer (0.5 d ≈ half a day).
Ranges reflect uncertainty; totals at the end.

> **Blocker:** the Supabase DB is currently **paused**. Un-pause at
> https://supabase.com/dashboard/project/frlmjkzyppswcxzdwxgr before any DB work
> or verification. Free-tier auto-pause (7 idle days) must also be addressed for
> production (Phase F).

---

# TIER 1 — Task Manager Correctness (do first)

## A. Bug: every action redirects to Home  — **0.5–1 d**

**Root cause:** `HunterNotifier.load()` (`mobile/lib/providers/hunter_provider.dart:67`)
sets `state = const AsyncValue.loading()` on *every* call. The dashboard builds all
tabs inside `hunterAsync.when(data:)` as a `PageView`
(`mobile/lib/features/dashboard/pages/dashboard_page.dart:52-131`), so any refresh
(`_refresh` after complete/create/fail, or startup `_runDailyCheckIn`) tears the
`PageView` down to the loading spinner and rebuilds at page 0 (Profile).

**Fix:**
1. Add a **background-refresh path** that does *not* drop to `loading`: keep the
   current `AsyncValue.data` on screen while refetching (e.g. a private
   `_load({bool showLoading = false})`; only the constructor's first load shows the
   spinner). Riverpod's `AsyncValue.guard` / retaining `state.value` is the idiom.
2. Better: **optimistic local updates** for quest complete/create/fail so the list
   updates instantly without any full refetch (sets up Tier 2 caching). Move the
   quest mutations out of `quests_page.dart` into the notifier.
3. Belt-and-suspenders: make the `PageView` survive by hoisting `_currentIndex`
   above the `when()` (or use `AutomaticKeepAlive`), so a rebuild can't reset the tab.

Files: `hunter_provider.dart`, `dashboard_page.dart`,
`mobile/lib/features/quests/pages/quests_page.dart`.

## B. Bug: rest-day toggle → "No rest days remaining"  — **0.5 d**

**Root cause:** `toggle_rest_day()` (`supabase/migrations/002_workout_and_streaks.sql:284`)
decrements `rest_days_remaining` when enabling but **never refunds on disable**
(line 297). The only replenish is the weekly reset inside `daily_check_in()`
(lines 152-159). So after one toggle-on this week, `rest_days_remaining = 0` and
every re-enable raises the exception (line 302).

**Fix:** new migration `003_fix_rest_day_toggle.sql` — in the turn-OFF branch,
refund `rest_days_remaining = rest_days_remaining + 1`. Optionally also run the same
weekly-reset check that `daily_check_in` uses at the top of `toggle_rest_day` so
availability isn't coupled to having checked in. Re-test the enable→disable→enable
cycle. (Streak/mercy feature — kept because it protects the login streak that drives
the task loop; independent of the deprioritized workout menu.)

## C. Surface swallowed quest errors  — **0.5 d** (bundle with A)

`quests_page.dart` `_completeQuest`/`_failQuest`/`_deleteQuest`/create only
`debugPrint` on failure while showing optimistic success. Route through the notifier
and show a real error SnackBar + roll back the optimistic change on failure. Reuse
the `login_page.dart:123-134` error-surface pattern.

**Tier 1 subtotal: ~1.5–2 d**

---

# TIER 2 — Caching & Efficiency  — **3–5 d**

**Problem:** `HunterNotifier.load()` fires ~11 sequential queries for the *entire*
account on every app open and after every mutation (`hunter_provider.dart:73-126`).

**Fix (stale-while-revalidate + granular state):**
1. **Local persistence:** cache the last `HunterData` to disk (recommend **Hive** —
   lightweight, no codegen; `shared_preferences` JSON is a lighter alt). On launch,
   hydrate from cache and render instantly, then revalidate in the background.
2. **Parallelize** the remaining network load with `Future.wait` instead of 11
   sequential awaits.
3. **Split the monolith:** break `HunterData` into per-domain slices (profile,
   quests, streak, …) so a quest change doesn't refetch bosses/inventory/etc.
   Invalidate narrowly.
4. **Optimistic mutations** (from Tier 1-A) become the default: local update →
   fire-and-confirm → reconcile, so the UI never waits on the network for edits.
5. Add a cache TTL + pull-to-refresh (the `RefreshIndicator` already exists on the
   profile tab) for explicit revalidation.

Files: `hunter_provider.dart` (split), new `mobile/lib/data/` cache layer,
`pubspec.yaml` (+`hive`/`hive_flutter`).

---

# TIER 3 — Recurring & Scheduled Quests (new feature)  — **4–7 d**

**Goal:** support, like mainstream task managers:
- One-off quest on a **specific date**.
- **Day-of-week** recurrence (e.g. only Tuesdays; or Mon + Thu — multiple days).
- **Custom interval** recurrence (every N days).
- A **"Today"/scheduled** view driven by these rules.

**Schema** (new migration `004_quest_scheduling.sql`) — extend `public.quests`:
- `due_date DATE` (one-off / next occurrence)
- `recurrence_type TEXT` enum-like: `none | daily | weekly_days | interval`
- `recurrence_days SMALLINT[]` (0–6) for `weekly_days`
- `recurrence_interval INT` (+ `recurrence_anchor DATE`) for `interval`
- `last_completed_on DATE` to drive per-day reset
Add an index on `(user_id, due_date)`.

**Generation / reset logic** — recommend an RPC `roll_over_quests()` that, per
user, resets a recurring quest's `completed`/`failed` to false and advances
`due_date` when its schedule says it's due again. Call it client-side on app open
(cheap, deterministic) and/or via **pg_cron** nightly. (Alternative: a
template→instances model — cleaner history but ~2 d more; the reset-in-place model
is recommended for effort.) Decide before build.

**UI** — extend the create/edit sheet (`quests_page.dart:173` `_showCreateQuestDialog`):
- date picker (one-off), weekday multi-select chips (weekly), interval stepper.
- A **"Today"** filter/tab showing quests due today (reuse the existing tab/filter
  chrome at `quests_page.dart:420-490`).
- Optional: wire due dates into the existing `NotificationService` for reminders.

Files: new `supabase/migrations/004_quest_scheduling.sql`, `quests_page.dart`,
`hunter_provider.dart`, `mobile/lib/services/notification_service.dart`.

**Tiers 1–3 subtotal: ~8.5–14 d** — this is the "task manager perfectly running"
milestone the user asked to prioritize.

---

# TIER 4 — Production Readiness (mobile-only, workout deferred)

## D. Security cleanup  — **1 d + user actions**
Three secrets are in pushed git history (GitHub PAT `ghp_kbm2…`, Supabase PATs
`sbp_af2681…`, `sbp_295a4f…`). **User must revoke first**
(github.com/settings/tokens; Supabase → Access Tokens). Then scrub history with
`git filter-repo` + force-push (**0.5 d**, coordinate), `git rm -r --cached
graphify-out/` (committed despite `.gitignore`), and add a `gitleaks`/`git-secrets`
pre-commit hook (**0.5 d**).

## E. Release build for Play Store  — **1.5–2 d**
`mobile/android/app/build.gradle.kts` signs release with the **debug key**
(lines 34-39) — not shippable. Generate an upload keystore + gitignored
`key.properties`, wire `signingConfigs.release`; enable R8 (`isMinifyEnabled`,
`isShrinkResources`, `proguard-rules.pro` with keeps for supabase/notifications/
riverpod); set a real `applicationId` + `android:label` + `version`; pin
`compile/min/targetSdk`; reassess the Impeller-disabled meta-data; prepare Play
assets + privacy policy (required — auth + user data).

## F. Backend durability  — **0.5 d + plan cost**
Un-pause the project; **move off free tier** (auto-pause is fatal for a live app)
or add a keep-alive; verify backups/PITR; complete the pending **password reset for
`yuvaraj28022005@gmail.com`** once reachable; re-run `get_advisors` (security +
performance) — last check was inconclusive (DB unreachable).

## G. App-wide crash-safety  — **1–1.5 d**
No global handler exists. Add `runZonedGuarded` + `FlutterError.onError` +
`PlatformDispatcher.onError` in `main.dart` (init is already defensively guarded).
Make multi-step writes transactional via RPCs where relevant (task-manager writes
first; workout writes deferred with the menu).

## H. Config & data-layer hygiene  — **1–2 d**
Move Supabase URL/anon key out of `mobile/lib/core/constants.dart` into
`--dart-define`. Introduce a thin **repository layer** (`mobile/lib/data/`) so pages
stop calling `SupabaseService.client.from(...)` directly (quests/bosses/rewards/etc.)
— pairs with Tier 2. (Overlaps Tier 2; count once if done together.)

## I. Dependencies  — **2–3 d**
Upgrade `supabase_flutter` **1.10.15 → 2.x** (whole data layer is a major version
behind) behind the new repository layer to contain API churn. Bump `intl`/others;
drop `dio` + the dead Node path once pruned; decide on the unused Riverpod/JSON
codegen deps.

## J. Dead-code removal  — **0.5–1 d**
Delete/archive `backend/`, root `src/` Firebase app + `firebase-*.json` +
`firestore.rules`, `frontend/`, `docker-compose.yml`, and the in-app dead path
(`api_service.dart`, `authProvider`, `useSupabase==false` branches, then
`AppConfig.useSupabase`). Remove committed `firebase-applet-config.json` key and
stale `.env.example` defaults.

## K. Tests & CI  — **3–4 d**
Unit tests for XP/level logic + repositories (mock Supabase); widget tests for
`AuthGate`/`LoginPage`/dashboard `AsyncValue` states; one integration test for
login → create quest → complete → XP update. GitHub Actions: `flutter analyze` +
`flutter test` on PR, signed-bundle release workflow, `gitleaks` in CI.

## L. Observability & docs  — **1.5–2 d**
Add Sentry/Crashlytics wired into the Phase G handlers. Rewrite `README.md` (still
documents the dead Express+Postgres stack; no mention of Supabase/Flutter) and
refresh `docs/database-schema.md`.

**Tier 4 subtotal: ~12–17 d** (excludes deferred workout hardening).

---

## Time summary

| Block | Days |
|---|---|
| Tier 1 — task-manager bug fixes | 1.5–2 |
| Tier 2 — caching/efficiency | 3–5 |
| Tier 3 — recurring/scheduled quests | 4–7 |
| **"Task manager perfect" milestone** | **~8.5–14** |
| Tier 4 D–L — production readiness | 12–17 |
| **Total to Play-Store-ready** | **~20–31 dev-days** |

Deferred (not estimated): workout-menu bug hardening, N+1 fixes in
`workout_provider.dart`, workout transactional RPCs — revisit after the task
manager ships.

## Suggested order
Tier 1 (A → B → C) → Tier 2 → Tier 3 → then Tier 4 starting with **D (secrets,
exploitable now)** and **F (un-pause)**, then E → G → H+I → J → K → L.

## Verification
- **Bug A:** create a quest and complete a quest from the Quests tab → list updates
  in place, tab **stays on Quests** (no jump to Profile); startup check-in doesn't
  reset the tab.
- **Bug B:** toggle rest day on → off → on within the same week → no exception;
  `rest_days_remaining` returns to its prior value after disable
  (verify via `mcp__supabase__execute_sql` once un-paused).
- **Caching:** cold start renders cached data with no spinner, then revalidates;
  a quest edit issues no full-account refetch (inspect via `get_logs`).
- **Scheduling:** create a Tuesday-only quest and an interval quest; confirm they
  appear only on due days in the "Today" view and reset after completion.
- **Release:** `flutter build appbundle --release` yields an upload-key-signed
  `.aab`; install on the moto g96 → correct label/icon, no debug banner, launches
  past the Flutter logo.
- **Security:** `gitleaks detect` clean on rewritten history; revoked tokens 401;
  `git ls-files | grep graphify-out` empty.
- **Regression:** `flutter test` green; CI gates a PR.
