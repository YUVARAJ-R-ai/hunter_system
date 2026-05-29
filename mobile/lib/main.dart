import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/features/auth/pages/login_page.dart';
import 'package:hunter_system_mobile/features/dashboard/pages/dashboard_page.dart';
import 'package:hunter_system_mobile/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.initialize();
  
  runApp(
    const ProviderScope(
      child: HunterSystemApp(),
    ),
  );
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

