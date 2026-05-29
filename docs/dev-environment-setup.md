# Hunter System — Dev Environment Setup Guide

Complete walkthrough of how the Flutter + Supabase + Genymotion dev stack was set up on NixOS.
Use this to recreate the environment on any NixOS machine.

---

## System Context

- **OS**: NixOS (declarative, immutable — no `apt install`, no `pip install` globally)
- **Shell**: zsh
- **NixOS config location**: `~/nixos-config/hosts/nixos-y/`
- **Rebuild command**: `update` (alias for `sudo nixos-rebuild switch --flake .#nixos-y` run from `~/nixos-config/`)
- **Flutter version**: 3.38.3
- **Android emulator**: Genymotion (Google Pixel 7 Pro virtual device)
- **Backend**: Supabase (project ref: `frlmjkzyppswcxzdwxgr`)

---

## Part 1: NixOS Packages

### The Problem with NixOS + Android SDK

NixOS stores everything in the immutable Nix store (`/nix/store/...`). Gradle normally downloads and installs missing Android SDK components (NDK, CMake, platform tools) into `$ANDROID_HOME` at build time — but on NixOS that directory is read-only. Every build attempt fails with permission errors.

**The fix**: declare every SDK component you need upfront in `host-packages.nix` using `pkgs.androidenv`, then expose it at a stable symlink path that survives Nix store rebuilds.

### File: `/home/yuvaraj/nixos-config/hosts/nixos-y/host-packages.nix`

Add the following at the top of the file (before the `{` module body), then add `androidSdk` to `environment.systemPackages`, and add the `systemd.tmpfiles.rules` and `environment.sessionVariables` sections:

```nix
{ pkgs, inputs, ... }:
let
  androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
  androidSdk = (androidEnv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "35.0.0" "34.0.0" ];
    # Include ALL platform versions your app targets — Gradle cannot install missing ones at build time
    platformVersions = [ "36" "35" "34" "33" "32" "31" "30" "29" "28" ];
    includeNDK = true;
    ndkVersions = [ "28.2.13676358" ];
    cmakeVersions = [ "3.22.1" ];
  }).androidsdk;
in
{
  # ... existing overlays and config ...

  environment.systemPackages = with pkgs; [
    # ... existing packages ...
    flutter
    jdk17
    gradle
    virtualbox
    genymotion
    android-tools   # adb, fastboot
    androidSdk      # the composed SDK declared above
  ];

  # Stable symlink — Nix store paths change on rebuild, this path never does
  systemd.tmpfiles.rules = [
    "L+ /run/android-sdk - - - - ${androidSdk}/libexec/android-sdk"
  ];

  environment.sessionVariables = {
    ANDROID_HOME = "/run/android-sdk";
    ANDROID_SDK_ROOT = "/run/android-sdk";
    ANDROID_NDK_ROOT = "/run/android-sdk/ndk-bundle";
  };
}
```

**Important notes**:
- `licenseAccepted = true` must go in `pkgs.androidenv.override { ... }`, NOT inside `composeAndroidPackages`
- The symlink at `/run/android-sdk` is created by `systemd-tmpfiles` on boot — it always points to the current Nix store path
- After changing this file, run `update` to apply

---

## Part 2: Flutter App Fixes

### 2a. Dependency Override — `sign_in_with_apple`

**File**: `mobile/pubspec.yaml`

Flutter 3.38+ dropped the V1 Android embedding API. The `sign_in_with_apple` package v5 used it, causing a compile error. Override to v6:

```yaml
dependency_overrides:
  sign_in_with_apple: ^6.0.0
```

### 2b. Android `local.properties`

**File**: `mobile/android/local.properties`

This file tells Gradle exactly where to find everything so it never tries to download anything:

```properties
flutter.sdk=/nix/store/2gf4jinqgbv7w2dpm60n8778b86xq2n1-flutter-wrapped-3.38.3-sdk-links
sdk.dir=/nix/store/709c0rvsabc5451lp23ca2p84hgpvr7m-androidsdk/libexec/android-sdk
ndk.dir=/run/android-sdk/ndk-bundle
cmake.dir=/run/android-sdk/cmake/3.22.1
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
```

**Note on the Nix store paths**: `flutter.sdk` and `sdk.dir` contain hash-based paths that change when the package version changes. If you get "SDK not found" errors after a `nixos-rebuild`, run `flutter doctor` or `flutter build apk` once and Flutter will regenerate `local.properties` with the correct current paths. The `ndk.dir` and `cmake.dir` use the stable `/run/android-sdk` symlink and never need updating.

### 2c. Dart Syntax Fix — `main.dart`

**File**: `mobile/lib/main.dart`

The `HunterSystemApp` class was missing its closing `}`, causing a Dart compile error. The fixed structure is:

```dart
class HunterSystemApp extends StatelessWidget {
  const HunterSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hunter System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const AuthGate(),
    );
  }
}   // <-- this closing brace was missing

class AuthGate extends ConsumerWidget {
  // ...
}
```

---

## Part 3: Connecting Genymotion to Flutter

1. Open Genymotion and start the **Google Pixel 7 Pro** virtual device
2. Verify ADB sees it:
   ```bash
   adb devices
   # Should list: 192.168.x.x:5555   device
   ```
3. If the device isn't listed, connect manually:
   ```bash
   adb connect 192.168.x.x:5555
   ```
4. Run the app:
   ```bash
   cd mobile
   flutter run
   ```

**Genymotion uses a VirtualBox network bridge** — the device IP is typically in the `192.168.56.x` range. Check Genymotion's device info panel for the exact IP.

---

## Part 4: Supabase Database Setup

### Schema Overview

12 tables, all with Row Level Security (RLS) enabled. Every table has a `user_id UUID` FK to `public.users` so RLS policies can restrict each user to their own data.

```
auth.users (Supabase managed)
    └── public.users (1:1, auto-created by trigger)
        └── hunter_stats (1:1)
        └── quests (1:many)
        └── habits, bosses, skills, inventory_items, achievements, rewards, daily_log
```

### Critical: Auth Integration Trigger

Supabase Auth manages passwords — `public.users` must NOT have a `password_hash` column. Instead, a PostgreSQL trigger fires on every `auth.users` INSERT and auto-creates the profile:

```sql
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
  INSERT INTO public.hunter_stats (user_id) VALUES (NEW.id);
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

### Running the Migration

The full schema is at `supabase/migrations/001_init_schema.sql`.

To apply it:
- **Via Supabase Dashboard**: SQL Editor → paste the file contents → Run
- **Via MCP** (if Claude Code MCP is configured): `mcp__supabase__apply_migration`

### Auth Settings for Development

In Supabase Dashboard → **Authentication → Providers → Email**:
- Disable **"Confirm email"** — otherwise every signup sends a verification email and Supabase's free tier has a 4 emails/hour rate limit
- Re-enable this before going to production

### Manually Confirming Unverified Users

If users signed up before email confirmation was disabled, confirm them via SQL:

```sql
UPDATE auth.users
SET email_confirmed_at = NOW()
WHERE email = 'user@example.com';
```

---

## Part 5: Supabase MCP (Claude Code Integration)

The MCP server lets Claude Code interact directly with the Supabase project (run SQL, check schema, apply migrations).

### File: `.mcp.json` (project root)

```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--access-token",
        "YOUR_SUPABASE_PAT",
        "--project-ref",
        "frlmjkzyppswcxzdwxgr"
      ]
    }
  }
}
```

**Getting a Personal Access Token (PAT)**:
1. Go to Supabase Dashboard → Account → Access Tokens
2. Generate a new token
3. Replace `YOUR_SUPABASE_PAT` in `.mcp.json`
4. Restart Claude Code for the new token to take effect

**Note**: PATs expire. If MCP tools return "Unauthorized", generate a new token and update `.mcp.json`.

---

## Part 6: Disk Space (NixOS-specific)

NixOS accumulates old generations and cached store paths. The Android SDK, Flutter, and Gradle caches can consume significant space.

**Check disk usage**:
```bash
df -h /
```

**Clean Nix store** (removes old generations):
```bash
sudo nix-collect-garbage -d
```

**Clear Gradle cache** (can be regenerated):
```bash
rm -rf ~/.gradle/caches
```

**Common large cache directories to check**:
- `~/.cache/pip` — Python packages
- `~/.cache/google-chrome` — Chrome cache
- `~/.cache/mozilla` — Firefox cache
- `~/.config/Spotify/Storage` — Spotify cache

---

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `Permission denied` writing to Android SDK | Nix store is read-only | Add all required SDK components to `host-packages.nix`, run `update` |
| `NDK not found` | Gradle looking in wrong path | Set `ndk.dir` in `local.properties` to `/run/android-sdk/ndk-bundle` |
| `CMake not found` | CMake not in SDK composition | Add `cmakeVersions = [ "3.22.1" ]` to `composeAndroidPackages` |
| `sign_in_with_apple` V1 embedding error | Package v5 uses removed API | Add `dependency_overrides: sign_in_with_apple: ^6.0.0` to `pubspec.yaml` |
| Dart compile error in `main.dart` | Missing closing `}` | Check class boundaries in `main.dart` |
| Supabase signup fails | `public.users` trigger missing or wrong schema | Verify `on_auth_user_created` trigger exists; run migration if not |
| Email rate limit exceeded | Supabase free tier: 4 emails/hour | Disable "Confirm email" in Auth settings for dev |
| MCP "Unauthorized" | PAT expired | Generate new token at Supabase → Account → Access Tokens, update `.mcp.json`, restart Claude Code |
| `adb devices` empty | Genymotion not connected | Run `adb connect <genymotion-ip>:5555` |
