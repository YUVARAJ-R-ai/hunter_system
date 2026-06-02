import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';

class WorkoutHistoryPage extends ConsumerWidget {
  const WorkoutHistoryPage({super.key});

  String _formatDuration(int seconds) {
    final mins = seconds ~/ 60;
    if (mins == 0) return '1m';
    return '${mins}m';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(workoutLogsProvider);

    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      appBar: AppBar(
        title: Text(
          'WORKOUT HISTORY & ANALYTICS',
          style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w900, fontSize: 16),
        ),
      ),
      body: logsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text('Error loading history: $e', style: GoogleFonts.outfit(color: Colors.white38)),
        ),
        data: (logs) {
          if (logs.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.calendarRange, size: 48, color: Colors.white12),
                    const SizedBox(height: 16),
                    Text(
                      'No workouts logged yet.',
                      style: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white38),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your completed sessions will show up here along with progress metrics.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(fontSize: 12, color: Colors.white24),
                    ),
                  ],
                ),
              ),
            );
          }

          // Generate volume data for chart (reverse chronological order -> convert to chronological for chart)
          final chartData = logs.reversed.toList();
          final volumes = chartData.map((l) => (l['total_volume_kg'] as num).toDouble()).toList();
          final dates = chartData.map((l) {
            final dt = DateTime.parse(l['completed_at'] as String);
            return DateFormat('MM/dd').format(dt);
          }).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Progress Chart Card
              if (volumes.length >= 2) ...[
                Text(
                  'VOLUME PROGRESSION (KG)',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),
                HunterCard(
                  glowColor: AppTheme.primaryBlue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: CustomPaint(
                          painter: VolumeChartPainter(volumes, dates),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Date labels row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          dates.length > 5 ? 5 : dates.length,
                          (idx) {
                            int targetIdx = dates.length > 5
                                ? (idx * (dates.length - 1) ~/ 4)
                                : idx;
                            return Text(
                              dates[targetIdx],
                              style: GoogleFonts.spaceGrotesk(fontSize: 8, color: Colors.white24, fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              Text(
                'LOGS HISTORY',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppTheme.neonPurple,
                ),
              ),
              const SizedBox(height: 12),

              // Logs List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
                  final name = log['name'] ?? 'Workout';
                  final completedAt = DateTime.parse(log['completed_at'] as String).toLocal();
                  final formattedDate = DateFormat('EEEE, MMM d, y - h:mm a').format(completedAt);
                  final duration = log['duration_seconds'] as int;
                  final volume = log['total_volume_kg'] as num;
                  final sets = log['sets'] as List<Map<String, dynamic>>? ?? [];

                  // Group sets by exercise name/id
                  final Map<String, List<Map<String, dynamic>>> exercisesMap = {};
                  for (var s in sets) {
                    final ex = s['exercises'] as Map<String, dynamic>?;
                    final exName = ex != null ? ex['name'] as String : 'Unknown';
                    exercisesMap.putIfAbsent(exName, () => []).add(s);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: HunterCard(
                      glowColor: AppTheme.neonPurple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  name.toUpperCase(),
                                  style: GoogleFonts.spaceGrotesk(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(LucideIcons.clock, size: 12, color: AppTheme.primaryBlue),
                                  const SizedBox(width: 4),
                                  Text(
                                    _formatDuration(duration),
                                    style: GoogleFonts.spaceGrotesk(fontSize: 11, color: AppTheme.primaryBlue, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(LucideIcons.dumbbell, size: 12, color: AppTheme.neonCyan),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${volume.toStringAsFixed(0)} kg',
                                    style: GoogleFonts.spaceGrotesk(fontSize: 11, color: AppTheme.neonCyan, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            formattedDate.toUpperCase(),
                            style: GoogleFonts.spaceGrotesk(fontSize: 9, color: Colors.white30, fontWeight: FontWeight.w600),
                          ),
                          const Divider(color: Colors.white12, height: 24),
                          
                          // Exercises list details
                          ...exercisesMap.entries.map((entry) {
                            final exName = entry.key;
                            final exSets = entry.value;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exName.toUpperCase(),
                                    style: GoogleFonts.spaceGrotesk(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 4,
                                    children: exSets.map((s) {
                                      final isWarmup = s['is_warmup'] as bool? ?? false;
                                      final weight = s['weight'] as num;
                                      final reps = s['reps'] as int;
                                      final rpe = s['rpe'] as int?;

                                      return Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.04),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          '${isWarmup ? 'W' : s['set_number']}: ${weight}kg x $reps${rpe != null ? ' @RPE$rpe' : ''}',
                                          style: GoogleFonts.outfit(fontSize: 10, color: Colors.white54),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class VolumeChartPainter extends CustomPainter {
  final List<double> dataPoints;
  final List<String> dates;

  VolumeChartPainter(this.dataPoints, this.dates);

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final paintLine = Paint()
      ..color = AppTheme.primaryBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintPoint = Paint()
      ..color = AppTheme.neonCyan
      ..style = PaintingStyle.fill;

    final paintGlow = Paint()
      ..color = AppTheme.primaryBlue.withOpacity(0.3)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final maxVal = dataPoints.reduce((a, b) => a > b ? a : b);
    final minVal = dataPoints.reduce((a, b) => a < b ? a : b);
    final range = maxVal - minVal == 0 ? 1.0 : maxVal - minVal;

    final points = <Offset>[];
    final double stepX = size.width / (dataPoints.length > 1 ? dataPoints.length - 1 : 1);

    for (int i = 0; i < dataPoints.length; i++) {
      final double x = i * stepX;
      final double y = size.height - ((dataPoints[i] - minVal) / range) * (size.height - 20) - 10;
      points.add(Offset(x, y));
    }

    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..strokeWidth = 1;
    for (int i = 0; i < 4; i++) {
      final double y = 10 + i * (size.height - 20) / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    if (points.length > 1) {
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      // Draw glow
      canvas.drawPath(path, paintGlow);
      // Draw line
      canvas.drawPath(path, paintLine);
    }

    // Draw points
    for (var pt in points) {
      canvas.drawCircle(pt, 5, paintPoint);
      canvas.drawCircle(pt, 2.5, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
