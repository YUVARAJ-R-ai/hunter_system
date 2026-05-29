# Graph Report - /mnt/drive1/projects/hunter-system/docs  (2026-05-25)

## Corpus Check
- Corpus is ~7,455 words - fits in a single context window. You may not need a graph.

## Summary
- 658 nodes · 987 edges · 44 communities (37 shown, 7 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 13 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Quest & Task System|Quest & Task System]]
- [[_COMMUNITY_NixOS Dev Environment|NixOS Dev Environment]]
- [[_COMMUNITY_Supabase Auth & Schema|Supabase Auth & Schema]]
- [[_COMMUNITY_Flutter Mobile App|Flutter Mobile App]]
- [[_COMMUNITY_User Stats & Progression|User Stats & Progression]]
- [[_COMMUNITY_Inventory & Items|Inventory & Items]]
- [[_COMMUNITY_Habit & Streak Tracking|Habit & Streak Tracking]]
- [[_COMMUNITY_Boss & Combat System|Boss & Combat System]]
- [[_COMMUNITY_Skills & Abilities|Skills & Abilities]]
- [[_COMMUNITY_Rewards & Achievements|Rewards & Achievements]]
- [[_COMMUNITY_Android SDK Setup|Android SDK Setup]]
- [[_COMMUNITY_Database Migration|Database Migration]]
- [[_COMMUNITY_List & Group Management|List & Group Management]]
- [[_COMMUNITY_Daily Log & Activity|Daily Log & Activity]]
- [[_COMMUNITY_Implementation Phases|Implementation Phases]]
- [[_COMMUNITY_Finance & Wallet System|Finance & Wallet System]]
- [[_COMMUNITY_Focus & Productivity|Focus & Productivity]]
- [[_COMMUNITY_Social & Challenges|Social & Challenges]]
- [[_COMMUNITY_Gym & Fitness Tracking|Gym & Fitness Tracking]]
- [[_COMMUNITY_MCP Integration|MCP Integration]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]
- [[_COMMUNITY_Community 26|Community 26]]
- [[_COMMUNITY_Community 27|Community 27]]
- [[_COMMUNITY_Community 28|Community 28]]
- [[_COMMUNITY_Community 29|Community 29]]
- [[_COMMUNITY_Community 30|Community 30]]
- [[_COMMUNITY_Community 31|Community 31]]
- [[_COMMUNITY_Community 32|Community 32]]
- [[_COMMUNITY_Community 33|Community 33]]
- [[_COMMUNITY_Community 34|Community 34]]
- [[_COMMUNITY_Community 38|Community 38]]

## God Nodes (most connected - your core abstractions)
1. `users Table` - 18 edges
2. `Hunter System Database Schema` - 16 edges
3. `compilerOptions` - 15 edges
4. `compilerOptions` - 15 edges
5. `compilerOptions` - 13 edges
6. `query()` - 13 edges
7. `_MyApplication` - 13 edges
8. `Hunter System v2 Implementation Plan` - 13 edges
9. `entities` - 12 edges
10. `AuthRequest` - 12 edges

## Surprising Connections (you probably didn't know these)
- `supabase/migrations/001_init_schema.sql` --semantically_similar_to--> `backend/sql/init.sql`  [INFERRED] [semantically similar]
  docs/dev-environment-setup.md → docs/database-schema.md
- `main()` --calls--> `_MyApplication`  [INFERRED]
  mobile/linux/runner/main.cc → mobile/linux/runner/my_application.cc
- `my_application_activate()` --calls--> `fl_register_plugins()`  [INFERRED]
  mobile/linux/runner/my_application.cc → mobile/linux/flutter/generated_plugin_registrant.cc
- `OnCreate()` --calls--> `GetClientArea()`  [INFERRED]
  mobile/windows/runner/flutter_window.cpp → mobile/windows/runner/win32_window.cpp
- `OnCreate()` --calls--> `SetChildContent()`  [INFERRED]
  mobile/windows/runner/flutter_window.cpp → mobile/windows/runner/win32_window.cpp

## Hyperedges (group relationships)
- **XP Reward Pipeline: Quests, Habits, and Gym Feed XP to Users** — docs_implementation_plan_xp_gold_flow, docs_database_schema_quests_table, docs_database_schema_habits_table, docs_implementation_plan_gym_xp_formula, docs_database_schema_users_table [INFERRED 0.95]
- **NixOS Flutter Android Dev Stack: NixOS + Android SDK + Genymotion + Flutter** — docs_dev_environment_setup_nixos, docs_dev_environment_setup_android_sdk, docs_dev_environment_setup_flutter, docs_dev_environment_setup_genymotion [EXTRACTED 1.00]
- **Supabase Integration: Auth Trigger + Schema + MCP Config** — docs_dev_environment_setup_auth_trigger, docs_dev_environment_setup_supabase_project, docs_dev_environment_setup_migration_sql, docs_dev_environment_setup_mcp_json [EXTRACTED 1.00]

## Communities (44 total, 7 thin omitted)

### Community 0 - "Quest & Task System"
Cohesion: 0.06
Nodes (79): items, entities, Boss, Habit, HunterData, Item, List, Quest (+71 more)

### Community 1 - "NixOS Dev Environment"
Cohesion: 0.06
Nodes (61): achievements Table, bosses Table, daily_log Table, Hunter System Database Schema, habits Table, hunter_stats Table, backend/sql/init.sql, inventory_items Table (+53 more)

### Community 2 - "Supabase Auth & Schema"
Cohesion: 0.08
Nodes (47): logout(), apiKey, appId, authDomain, firestoreDatabaseId, measurementId, messagingSenderId, projectId (+39 more)

### Community 3 - "Flutter Mobile App"
Cohesion: 0.09
Nodes (37): pool, query(), authenticateToken(), AuthRequest, generateToken(), router, router, token (+29 more)

### Community 4 - "User Stats & Progression"
Cohesion: 0.09
Nodes (24): FlutterWindow(), OnCreate(), wWinMain(), CreateAndAttachConsole(), GetCommandLineArguments(), Utf8FromUtf16(), Create(), Destroy() (+16 more)

### Community 5 - "Inventory & Items"
Cohesion: 0.06
Nodes (33): dependencies, clsx, dotenv, express, firebase, @google/genai, lucide-react, motion (+25 more)

### Community 6 - "Habit & Streak Tracking"
Cohesion: 0.07
Nodes (27): dependencies, clsx, lucide-react, motion, react, react-dom, recharts, @supabase/supabase-js (+19 more)

### Community 7 - "Boss & Combat System"
Cohesion: 0.08
Nodes (25): dependencies, bcryptjs, cors, dotenv, express, jsonwebtoken, pg, uuid (+17 more)

### Community 8 - "Skills & Abilities"
Cohesion: 0.08
Nodes (12): fl_register_plugins(), RegisterGeneratedPlugins(), FlutterAppDelegate, NSWindow, AppDelegate, -registerWithRegistry, main(), MainFlutterWindow (+4 more)

### Community 9 - "Rewards & Achievements"
Cohesion: 0.10
Nodes (20): build, _buildBottomNav, _buildHeader, _buildLevelDisplay, _buildQuestCard, _buildRankCard, _buildRankDisplay, _buildSectionTitle (+12 more)

### Community 10 - "Android SDK Setup"
Cohesion: 0.12
Nodes (10): authAPI, bossAPI, habitAPI, hunterAPI, inventoryAPI, listAPI, questAPI, rewardAPI (+2 more)

### Community 11 - "Database Migration"
Cohesion: 0.12
Nodes (16): compilerOptions, allowImportingTsExtensions, allowJs, experimentalDecorators, isolatedModules, jsx, lib, module (+8 more)

### Community 12 - "List & Group Management"
Cohesion: 0.12
Nodes (16): compilerOptions, allowImportingTsExtensions, allowJs, experimentalDecorators, isolatedModules, jsx, lib, module (+8 more)

### Community 13 - "Daily Log & Activity"
Cohesion: 0.12
Nodes (15): compilerOptions, declaration, esModuleInterop, forceConsistentCasingInFileNames, module, moduleResolution, outDir, resolveJsonModule (+7 more)

### Community 14 - "Implementation Phases"
Cohesion: 0.13
Nodes (12): AppTheme, ThemeData, build, Container, build, Container, main, package:flutter/material.dart (+4 more)

### Community 15 - "Finance & Wallet System"
Cohesion: 0.17
Nodes (15): Android SDK via androidenv, Hunter System Dev Environment Setup Guide, Flutter 3.38.3, Genymotion Android Emulator, host-packages.nix, mobile/android/local.properties, mobile/lib/main.dart, .mcp.json Supabase MCP Config (+7 more)

### Community 16 - "Focus & Productivity"
Cohesion: 0.13
Nodes (10): authAPI, authToken, bossAPI, habitAPI, hunterAPI, inventoryAPI, listAPI, questAPI (+2 more)

### Community 17 - "Social & Challenges"
Cohesion: 0.17
Nodes (11): AuthGate, build, DashboardPage, HunterSystemApp, LoginPage, main, MaterialApp, ProviderScope (+3 more)

### Community 18 - "Gym & Fitness Tracking"
Cohesion: 0.18
Nodes (9): ../core/constants.dart, build, LoginPage, _LoginPageState, Scaffold, SizedBox, Text, SupabaseService (+1 more)

### Community 19 - "MCP Integration"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 20 - "Community 20"
Cohesion: 0.22
Nodes (8): AuthNotifier, AuthState, copyWith, package:flutter_riverpod/flutter_riverpod.dart, package:hunter_system_mobile/core/config.dart, package:hunter_system_mobile/models/user_model.dart, package:hunter_system_mobile/services/api_service.dart, package:hunter_system_mobile/services/supabase_service.dart

### Community 21 - "Community 21"
Cohesion: 0.20
Nodes (8): registerPlugins, ApiService, package:app_links/src/app_links_web.dart, package:dio/dio.dart, package:flutter_web_plugins/flutter_web_plugins.dart, package:shared_preferences/shared_preferences.dart, package:sign_in_with_apple_web/sign_in_with_apple_web.dart, package:url_launcher_web/url_launcher_web.dart

### Community 22 - "Community 22"
Cohesion: 0.25
Nodes (7): configVersion, flutterRoot, flutterVersion, generator, generatorVersion, packages, pubCache

### Community 23 - "Community 23"
Cohesion: 0.29
Nodes (6): skills, supabase-postgres-best-practices, computedHash, source, sourceType, version

### Community 24 - "Community 24"
Cohesion: 0.40
Nodes (4): images, info, author, version

### Community 25 - "Community 25"
Cohesion: 0.33
Nodes (4): Quest, HunterStats, User, package:json_annotation/json_annotation.dart

### Community 26 - "Community 26"
Cohesion: 0.40
Nodes (4): images, info, author, version

### Community 29 - "Community 29"
Cohesion: 0.50
Nodes (3): description, name, requestFramePermissions

### Community 30 - "Community 30"
Cohesion: 0.50
Nodes (3): configVersion, packages, roots

## Knowledge Gaps
- **298 isolated node(s):** `projectId`, `appId`, `apiKey`, `authDomain`, `firestoreDatabaseId` (+293 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Achievement` connect `Quest & Task System` to `Focus & Productivity`, `Supabase Auth & Schema`, `Android SDK Setup`?**
  _High betweenness centrality (0.032) - this node is a cross-community bridge._
- **Why does `ListGroup` connect `Quest & Task System` to `Focus & Productivity`, `Supabase Auth & Schema`, `Android SDK Setup`?**
  _High betweenness centrality (0.032) - this node is a cross-community bridge._
- **Why does `dependencies` connect `Inventory & Items` to `Android SDK Setup`?**
  _High betweenness centrality (0.028) - this node is a cross-community bridge._
- **What connects `projectId`, `appId`, `apiKey` to the rest of the system?**
  _301 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Quest & Task System` be split into smaller, more focused modules?**
  _Cohesion score 0.06360759493670887 - nodes in this community are weakly interconnected._
- **Should `NixOS Dev Environment` be split into smaller, more focused modules?**
  _Cohesion score 0.055191256830601096 - nodes in this community are weakly interconnected._
- **Should `Supabase Auth & Schema` be split into smaller, more focused modules?**
  _Cohesion score 0.07540983606557378 - nodes in this community are weakly interconnected._