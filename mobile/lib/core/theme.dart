import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Core palette
  static const primaryBlue = Color(0xFF1E90FF);
  static const neonCyan = Color(0xFF00F2FF);
  static const neonPurple = Color(0xFFA855F7);
  static const deepDark = Color(0xFF080810);
  static const darkNavy = Color(0xFF0D0D14);
  static const surfaceDark = Color(0xFF12121C);
  static const cardDark = Color(0xFF16162A);
  static const sRankGreen = Color(0xFF10B981);
  static const dangerRed = Color(0xFFEF4444);
  static const goldAccent = Color(0xFFFFD700);

  // Rank colors
  static const rankE = Color(0xFF6B7280);
  static const rankD = Color(0xFF22C55E);
  static const rankC = Color(0xFF3B82F6);
  static const rankB = Color(0xFFA855F7);
  static const rankA = Color(0xFFF59E0B);
  static const rankS = Color(0xFFEF4444);

  // Difficulty colors  
  static Color difficultyColor(String rank) {
    switch (rank.toUpperCase()) {
      case 'E': return rankE;
      case 'D': return rankD;
      case 'C': return rankC;
      case 'B': return rankB;
      case 'A': return rankA;
      case 'S': return rankS;
      default: return rankE;
    }
  }

  // Category colors
  static Color categoryColor(String category) {
    switch (category.toUpperCase()) {
      case 'FITNESS': return const Color(0xFFEF4444);
      case 'STUDY': return const Color(0xFF3B82F6);
      case 'WORK': return const Color(0xFFF59E0B);
      case 'HEALTH': return const Color(0xFF10B981);
      case 'SOCIAL': return const Color(0xFFA855F7);
      case 'CREATIVITY': return const Color(0xFFEC4899);
      default: return primaryBlue;
    }
  }

  // Quest type colors
  static Color questTypeColor(String type) {
    switch (type.toUpperCase()) {
      case 'DAILY': return primaryBlue;
      case 'MAIN': return neonPurple;
      case 'SIDE': return sRankGreen;
      case 'PENALTY': return dangerRed;
      case 'EMERGENCY': return goldAccent;
      default: return primaryBlue;
    }
  }

  // Glow decoration
  static BoxDecoration glowBox({
    Color color = primaryBlue,
    double radius = 16,
    double glowOpacity = 0.15,
    double borderOpacity = 0.3,
  }) {
    return BoxDecoration(
      color: surfaceDark,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: color.withOpacity(borderOpacity), width: 1),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(glowOpacity),
          blurRadius: 20,
          spreadRadius: -5,
        ),
      ],
    );
  }

  // Gradient card decoration
  static BoxDecoration gradientCard({
    List<Color>? colors,
    double radius = 16,
    double borderOpacity = 0.2,
  }) {
    final gradColors = colors ?? [primaryBlue.withOpacity(0.1), neonPurple.withOpacity(0.05)];
    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: gradColors.first.withOpacity(borderOpacity), width: 1),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primaryBlue,
        secondary: neonPurple,
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white70,
        error: dangerRed,
      ),
      scaffoldBackgroundColor: deepDark,
      cardTheme: CardThemeData(
        color: cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: primaryBlue.withAlpha(20), width: 1),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          letterSpacing: -1,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: primaryBlue,
        ),
        titleMedium: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.outfit(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.outfit(
          fontSize: 14,
          color: Colors.white70,
        ),
        bodySmall: GoogleFonts.outfit(
          fontSize: 12,
          color: Colors.white54,
        ),
        labelLarge: GoogleFonts.spaceGrotesk(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: primaryBlue,
        ),
        labelSmall: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: Colors.white38,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue, width: 1.5),
        ),
        labelStyle: GoogleFonts.spaceGrotesk(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: Colors.white38,
        ),
        hintStyle: GoogleFonts.outfit(
          fontSize: 14,
          color: Colors.white24,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkNavy,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.white24,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cardDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
