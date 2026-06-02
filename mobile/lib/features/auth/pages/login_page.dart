import 'dart:math';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hunter_system_mobile/core/config.dart';
import 'package:hunter_system_mobile/services/api_service.dart';
import 'package:hunter_system_mobile/features/dashboard/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isLoading = false;
  bool _isRegister = false;
  bool _obscurePassword = true;

  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
      _showError('Please fill in all fields');
      return;
    }
    setState(() => _isLoading = true);
    try {
      if (AppConfig.useSupabase) {
        if (_isRegister) {
          await SupabaseService.client.auth.signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            data: {
              'username': _usernameController.text.trim().isNotEmpty
                  ? _usernameController.text.trim()
                  : 'Hunter',
            },
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(LucideIcons.checkCircle, color: AppTheme.sRankGreen, size: 18),
                    const SizedBox(width: 12),
                    const Text('Awakening complete! Check your email.'),
                  ],
                ),
                backgroundColor: AppTheme.cardDark,
              ),
            );
            setState(() => _isRegister = false);
          }
        } else {
          await SupabaseService.client.auth.signInWithPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
        }
      } else {
        // Node backend fallback
        final apiService = ApiService();
        if (_isRegister) {
          final response = await apiService.register(
            _emailController.text.trim(),
            _passwordController.text.trim(),
            _usernameController.text.trim().isNotEmpty
                ? _usernameController.text.trim()
                : 'Hunter',
          );
          final token = response.data['token'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          }
        } else {
          final response = await apiService.login(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
          final token = response.data['token'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          }
        }
      }
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data['error'] ?? e.message ?? 'Network error';
        _showError(errorMsg.toString());
      } else {
        _showError(e.toString());
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(LucideIcons.alertCircle, color: AppTheme.dangerRed, size: 18),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: AppTheme.cardDark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      body: Stack(
        children: [
          // Background particles effect
          ..._buildBackgroundParticles(),

          // Main content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo + Title
                  _buildLogo()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(begin: const Offset(0.8, 0.8), duration: 600.ms, curve: Curves.easeOutBack),

                  const SizedBox(height: 40),

                  // Auth Card
                  _buildAuthCard()
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 500.ms)
                      .slideY(begin: 0.1, duration: 500.ms, curve: Curves.easeOut),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundParticles() {
    final random = Random(42);
    return List.generate(8, (i) {
      final left = random.nextDouble() * 400;
      final top = random.nextDouble() * 800;
      final size = random.nextDouble() * 150 + 50;
      return Positioned(
        left: left,
        top: top,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    (i.isEven ? AppTheme.primaryBlue : AppTheme.neonPurple)
                        .withOpacity(0.03 * _pulseController.value),
                    Colors.transparent,
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildLogo() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryBlue.withOpacity(0.08),
                border: Border.all(
                  color: AppTheme.primaryBlue.withOpacity(0.2 + 0.1 * _pulseController.value),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withOpacity(0.15 * _pulseController.value),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                LucideIcons.flame,
                size: 40,
                color: AppTheme.primaryBlue,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          'HUNTER SYSTEM',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'ARISE AND LEVEL UP',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
            color: AppTheme.primaryBlue.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildAuthCard() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: AppTheme.glowBox(
        color: AppTheme.primaryBlue,
        radius: 24,
        glowOpacity: 0.1,
        borderOpacity: 0.2,
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Auth mode toggle
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildAuthToggle('SIGN IN', !_isRegister, () {
                    setState(() => _isRegister = false);
                  }),
                ),
                Expanded(
                  child: _buildAuthToggle('REGISTER', _isRegister, () {
                    setState(() => _isRegister = true);
                  }),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Username field (register only)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isRegister
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildTextField(
                      controller: _usernameController,
                      label: 'HUNTER NAME',
                      hint: 'Sung Jin-Woo',
                      icon: LucideIcons.user,
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          _buildTextField(
            controller: _emailController,
            label: 'EMAIL',
            hint: 'hunter@system.io',
            icon: LucideIcons.mail,
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 16),

          _buildTextField(
            controller: _passwordController,
            label: 'PASSWORD',
            hint: '••••••••',
            icon: LucideIcons.lock,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              icon: Icon(
                _obscurePassword ? LucideIcons.eyeOff : LucideIcons.eye,
                size: 18,
                color: Colors.white38,
              ),
            ),
          ),

          const SizedBox(height: 28),

          // Submit button
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: -5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleAuth,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                disabledBackgroundColor: AppTheme.primaryBlue.withOpacity(0.3),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      _isRegister ? 'AWAKEN' : 'ENTER GATE',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        letterSpacing: 3,
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 16),

          // Footer
          TextButton(
            onPressed: () => setState(() => _isRegister = !_isRegister),
            child: Text(
              _isRegister ? 'Already Awakened? Sign In' : 'New Hunter? Register',
              style: GoogleFonts.outfit(
                fontSize: 13,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthToggle(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppTheme.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: active ? Colors.white : Colors.white38,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: Colors.white30,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: GoogleFonts.outfit(
            fontSize: 14,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 18, color: Colors.white24),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
