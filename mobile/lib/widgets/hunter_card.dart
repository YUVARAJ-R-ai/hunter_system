import 'package:flutter/material.dart';
import 'package:hunter_system_mobile/core/theme.dart';

/// A glowing card container with optional gradient border.
class HunterCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? glowColor;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;
  final double borderRadius;

  const HunterCard({
    super.key,
    required this.child,
    this.padding,
    this.glowColor,
    this.gradientColors,
    this.onTap,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGlow = glowColor ?? AppTheme.primaryBlue;

    Widget card = Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: gradientColors != null
          ? AppTheme.gradientCard(
              colors: gradientColors!.map((c) => c.withOpacity(0.1)).toList(),
              radius: borderRadius,
            )
          : AppTheme.glowBox(
              color: effectiveGlow,
              radius: borderRadius,
              glowOpacity: 0.08,
              borderOpacity: 0.15,
            ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }
    return card;
  }
}
