# Hunter System - Normalized AI Context Map

This document is a normalized, human- and AI-readable summary of the codebase generated from Graphify's AST and semantic analysis. It provides immediate context on the project's architecture, tech stack, and module boundaries.

## 1. System Architecture
The **Hunter System** is a Solo Leveling-themed gamified life/task management application. It is structured as a monorepo containing three primary layers:
- **Backend**: Node.js / Express server connected to a PostgreSQL database (via Supabase). Handles game logic, authentication, and entity management.
- **Frontend**: React web application (Vite + TailwindCSS) providing the browser-based dashboard.
- **Mobile**: Flutter application targeting iOS, Android, and desktop, mirroring the dashboard and quest management features.

## 2. Codebase Communities (Module Boundaries)
Based on graph connectivity and imports, the codebase naturally clusters into the following domains:

### 🧩 Backend Core (Community 2 & 8)
- **Tech Stack**: Node.js, Express, PostgreSQL (`pg`), JWT, bcrypt.
- **Key Files**: 
  - `backend/src/index.ts` (Entry point)
  - `backend/src/utils/gamelogic.ts` (Calculates XP, Level-ups, Penalties, and Rank)
  - `backend/src/config/database.ts` (Database pooling and querying)
- **Routes**: Manages entities like `boss`, `habit`, `hunter`, `inventory`, `list`, `quest`, `reward`, and `skill`.
- **God Nodes**: `query()` (Central DB execution), `authenticateToken()` (Auth middleware).

### 🖥️ Frontend Web (Community 1 & 7)
- **Tech Stack**: React, Vite, TailwindCSS, Firebase (Auth/Legacy DB), Supabase Client.
- **Key Files**:
  - `frontend/src/store.ts` (State management and initial data)
  - `frontend/src/app.tsx` & `main.tsx` (App shell and entry)
- **Types/Models**: Defines `boss`, `quest`, `hunterdata`, `reward`, etc.

### 📱 Mobile App (Community 3, 4 & 5)
- **Tech Stack**: Flutter, Riverpod (State), Supabase Flutter, Google Fonts.
- **Key Modules**:
  - `lib/features/auth` (Login Page)
  - `lib/features/dashboard` (Stats Grid, XP Bar, Quest/Rank Cards)
  - `lib/core/theme` (App theming and UI constants)
  - `lib/services/api_service.dart` & `supabase_service.dart` (Backend integration)

### 🗄️ Database & Schemas (Community 0 & 10)
- **Legacy/Blueprint Schema**: `firebase-blueprint.json` maps out the NoSQL entity structure (Quests, Habits, Bosses, Inventory, Users) which translates into the current relational/Supabase logic.
- **API Clients**: The frontend and mobile apps utilize `api_supabaseclient` and `api_restclient` to communicate securely with the backend.

## 3. High-Traffic "God Nodes" (Crucial Intersections)
When modifying the codebase, pay special attention to these highly referenced components:
1. **`query()` (Backend)**: The main database execution wrapper. Any schema or DB driver changes must pass through here.
2. **`AuthRequest` / `authenticateToken()` (Backend)**: Protects almost all routes. Modifications here impact frontend/mobile authentication workflows.
3. **`compilerOptions` (Root/Frontend/Backend)**: TypeScript configurations governing the build processes across the workspaces.
4. **`entities` & `firestore` (Blueprint)**: The core data models defining the "Hunter" domain (AGI, STR, VIT, Max Mana, XP, Gold).

## 4. Inferred Relationships (Surprises)
- **Platform Runners**: The Flutter cross-platform runners (Linux/Windows C++ wrappers) have deep, implicit connections initializing the app state (`main()` calling `_MyApplication` and `fl_register_plugins()`). Be cautious when modifying native runner files.

---
*Generated via Graphify analysis to provide zero-shot context for AI coding agents.*
