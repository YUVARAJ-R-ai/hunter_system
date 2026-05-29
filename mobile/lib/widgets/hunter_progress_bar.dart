import 'package:flutter/material.dart';
import 'package:hunter_system_mobile/core/theme.dart';

/// An animated progress bar with glow effect.
class HunterProgressBar extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final Color color;
  final double height;
  final String? label;
  final String? trailingText;

  const HunterProgressBar({
    super.key,
    required this.value,
    this.color = AppTheme.primaryBlue,
    this.height = 6,
    this.label,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || trailingText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                if (trailingText != null)
                  Text(
                    trailingText!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: color,
                    ),
                  ),
              ],
            ),
          ),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(height / 2),
            child: Stack(
              children: [
                AnimatedFractionallySizedBox(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  widthFactor: clampedValue,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.7)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: -2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedFractionallySizedBox extends ImplicitlyAnimatedWidget {
  final double widthFactor;
  final AlignmentGeometry alignment;
  final Widget child;

  const AnimatedFractionallySizedBox({
    super.key,
    required this.widthFactor,
    required this.alignment,
    required this.child,
    required super.duration,
    super.curve,
  });

  @override
  ImplicitlyAnimatedWidgetState<AnimatedFractionallySizedBox> createState() =>
      _AnimatedFractionallySizedBoxState();
}

class _AnimatedFractionallySizedBoxState
    extends AnimatedWidgetBaseState<AnimatedFractionallySizedBox> {
  Tween<double>? _widthFactor;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _widthFactor = visitor(
      _widthFactor,
      widget.widthFactor,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _widthFactor?.evaluate(animation) ?? widget.widthFactor,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}
