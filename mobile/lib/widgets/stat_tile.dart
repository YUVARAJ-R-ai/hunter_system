import 'package:flutter/material.dart';
import 'package:hunter_system_mobile/core/theme.dart';

/// A stat badge — icon + label + value in a compact tile.
class StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color? color;

  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppTheme.primaryBlue;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: effectiveColor.withOpacity(0.12), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: effectiveColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: effectiveColor.withOpacity(0.8)),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
