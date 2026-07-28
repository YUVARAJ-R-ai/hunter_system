import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/services/notification_service.dart';
import 'package:hunter_system_mobile/features/auth/pages/login_page.dart';
import 'package:hunter_system_mobile/features/dashboard/pages/dashboard_page.dart';
import 'package:hunter_system_mobile/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase must be ready before AuthGate uses its client, but a slow/offline
  // session recovery must never block the app on the splash screen forever.
  try {
    await SupabaseService.initialize()
        .timeout(const Duration(seconds: 8));
  } catch (e, st) {
    debugPrint('Supabase init failed or timed out: $e\n$st');
  }

  // Render the UI immediately. Notification setup (which synchronously loads the
  // whole timezone database) runs after the first frame so it never delays paint.
  runApp(
    const ProviderScope(
      child: HunterSystemApp(),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    try {
      await NotificationService.initialize();
    } catch (e, st) {
      debugPrint('Notification init failed: $e\n$st');
    }
  });
}

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
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (AppConfig.useSupabase) {
      return StreamBuilder<AuthState>(
        stream: SupabaseService.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final session = snapshot.data!.session;
            if (session != null) {
              return const DashboardPage();
            }
          }
          return const LoginPage();
        },
      );
    } else {
      // Fallback Node backend logic
      return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          final prefs = snapshot.data;
          final token = prefs?.getString('auth_token');
          if (token != null && token.isNotEmpty) {
            return const DashboardPage();
          }
          return const LoginPage();
        },
      );
    }
  }
}

