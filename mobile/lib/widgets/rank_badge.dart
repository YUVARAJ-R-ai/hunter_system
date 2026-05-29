import 'package:flutter/material.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:google_fonts/google_fonts.dart';

/// A rank badge with glow.
class RankBadge extends StatelessWidget {
  final String rank;
  final double fontSize;

  const RankBadge({super.key, required this.rank, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.difficultyColor(rank);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Text(
        '$rank-RANK',
        style: GoogleFonts.spaceGrotesk(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
          color: color,
        ),
      ),
    );
  }
}
