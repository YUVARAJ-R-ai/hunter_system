import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';
import 'package:hunter_system_mobile/features/workout/pages/active_workout_page.dart';
import 'package:hunter_system_mobile/features/workout/pages/exercise_list_page.dart';
import 'package:hunter_system_mobile/features/workout/pages/workout_history_page.dart';

class WorkoutTrackerPage extends ConsumerStatefulWidget {
  const WorkoutTrackerPage({super.key});

  @override
  ConsumerState<WorkoutTrackerPage> createState() => _WorkoutTrackerPageState();
}

class _WorkoutTrackerPageState extends ConsumerState<WorkoutTrackerPage> {
  
  void _startEmptyWorkout() {
    final active = ref.read(activeWorkoutProvider).isActive;
    if (active) {
      _showActiveWorkoutAlert();
      return;
    }
    
    ref.read(activeWorkoutProvider.notifier).startWorkout(name: 'Empty Workout');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActiveWorkoutPage()),
    );
  }

  void _startTemplateWorkout(Map<String, dynamic> template) {
    final active = ref.read(activeWorkoutProvider).isActive;
    if (active) {
      _showActiveWorkoutAlert();
      return;
    }

    final List<ActiveWorkoutExercise> activeEx = [];
    final templateEx = template['exercises'] as List<dynamic>? ?? [];
    
    for (var te in templateEx) {
      final exData = te['exercises'] as Map<String, dynamic>?;
      if (exData == null) continue;
      
      final setsCount = (te['sets_count'] as num?)?.toInt() ?? 3;
      final repsTarget = (te['reps_target'] as num?)?.toInt() ?? 10;
      
      final List<ActiveWorkoutSet> sets = List.generate(
        setsCount,
        (index) => ActiveWorkoutSet(weight: 0, reps: repsTarget),
      );
      activeEx.add(ActiveWorkoutExercise(exercise: exData, sets: sets));
    }

    ref.read(activeWorkoutProvider.notifier).startWorkout(
          name: template['name'] ?? 'Routine',
          templateId: template['id'],
          exercises: activeEx,
        );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActiveWorkoutPage()),
    );
  }

  void _showActiveWorkoutAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        title: Text('ACTIVE WORKOUT RUNNING', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold)),
        content: Text('You already have a training session in progress. Please complete or discard it first.', style: GoogleFonts.outfit(color: Colors.white70)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ActiveWorkoutPage()),
              );
            },
            child: const Text('RESUME CURRENT'),
          ),
        ],
      ),
    );
  }

  void _showCreateTemplateModal() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final List<Map<String, dynamic>> selectedExercises = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.deepDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.85,
              maxChildSize: 0.95,
              minChildSize: 0.5,
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Text(
                        'CREATE ROUTINE TEMPLATE',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'ROUTINE NAME',
                          hintText: 'e.g. Pull Day Focus',
                        ),
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: descController,
                        decoration: const InputDecoration(
                          labelText: 'DESCRIPTION',
                          hintText: 'e.g. Back and Bicep targeting',
                        ),
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'EXERCISES IN ROUTINE',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 8),

                      if (selectedExercises.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'No exercises added yet.',
                              style: GoogleFonts.outfit(color: Colors.white30, fontSize: 13),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: selectedExercises.length,
                          itemBuilder: (context, idx) {
                            final ex = selectedExercises[idx];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                (ex['name'] ?? 'Exercise').toString().toUpperCase(),
                                style: GoogleFonts.spaceGrotesk(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              subtitle: Text(
                                '${ex['sets_count'] ?? 3} sets • ${ex['reps_target'] ?? 10} reps',
                                style: GoogleFonts.outfit(fontSize: 11, color: Colors.white38),
                              ),
                              trailing: IconButton(
                                icon: const Icon(LucideIcons.minusCircle, color: AppTheme.dangerRed, size: 18),
                                onPressed: () {
                                  setModalState(() {
                                    selectedExercises.removeAt(idx);
                                  });
                                },
                              ),
                            );
                          },
                        ),

                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.primaryBlue),
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        onPressed: () async {
                          final result = await Navigator.push<Map<String, dynamic>>(
                            context,
                            MaterialPageRoute(builder: (context) => const ExerciseListPage(isSelectionMode: true)),
                          );
                          if (result != null) {
                            setModalState(() {
                              selectedExercises.add({
                                ...result,
                                'sets_count': 3,
                                'reps_target': 10,
                              });
                            });
                          }
                        },
                        icon: const Icon(LucideIcons.plus, size: 14, color: AppTheme.primaryBlue),
                        label: Text('ADD EXERCISE', style: GoogleFonts.spaceGrotesk(color: AppTheme.primaryBlue, fontSize: 12)),
                      ),
                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.sRankGreen),
                              onPressed: () async {
                                final name = nameController.text.trim();
                                if (name.isEmpty || selectedExercises.isEmpty) return;
                                
                                try {
                                  await ref.read(activeWorkoutProvider.notifier).createTemplate(
                                    name,
                                    descController.text.trim(),
                                    selectedExercises,
                                  );
                                  ref.invalidate(workoutTemplatesProvider);
                                  if (mounted) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Routine template created successfully!'),
                                        backgroundColor: AppTheme.sRankGreen,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error creating template: $e'),
                                        backgroundColor: AppTheme.dangerRed,
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text('SAVE ROUTINE'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final templatesAsync = ref.watch(workoutTemplatesProvider);
    final activeWorkout = ref.watch(activeWorkoutProvider);

    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      body: SafeArea(
        child: Column(
          children: [
            // Top Analytics/Tools Row
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: HunterCard(
                      glowColor: AppTheme.primaryBlue,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WorkoutHistoryPage()),
                        );
                      },
                      child: Column(
                        children: [
                          const Icon(LucideIcons.history, color: AppTheme.primaryBlue, size: 20),
                          const SizedBox(height: 6),
                          Text(
                            'HISTORY',
                            style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: HunterCard(
                      glowColor: AppTheme.neonPurple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ExerciseListPage()),
                        );
                      },
                      child: Column(
                        children: [
                          const Icon(LucideIcons.bookOpen, color: AppTheme.neonPurple, size: 20),
                          const SizedBox(height: 6),
                          Text(
                            'EXERCISES',
                            style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Active workout bar (resumable)
            if (activeWorkout.isActive)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(LucideIcons.dumbbell, color: AppTheme.primaryBlue, size: 18),
                          const SizedBox(width: 10),
                          Text(
                            'WORKOUT IN PROGRESS...',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ActiveWorkoutPage()),
                          );
                        },
                        child: Text(
                          'RESUME',
                          style: GoogleFonts.spaceGrotesk(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Quick launch buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: _startEmptyWorkout,
                      icon: const Icon(LucideIcons.play, size: 16),
                      label: const Text('START EMPTY WORKOUT'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            
            // Routines Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MY ROUTINES',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                      color: Colors.white54,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.plusSquare, color: AppTheme.primaryBlue, size: 20),
                    onPressed: _showCreateTemplateModal,
                  ),
                ],
              ),
            ),

            // Templates list
            Expanded(
              child: templatesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text('Error loading templates: $e', style: GoogleFonts.outfit(color: Colors.white38)),
                ),
                data: (templates) {
                  if (templates.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(LucideIcons.copy, size: 36, color: Colors.white12),
                            const SizedBox(height: 12),
                            Text(
                              'No routines templates yet.',
                              style: GoogleFonts.spaceGrotesk(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white38),
                            ),
                            Text(
                              'Click the "+" to build a routine template.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(fontSize: 11, color: Colors.white24),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: templates.length,
                    itemBuilder: (context, index) {
                      final template = templates[index];
                      final name = template['name'] ?? 'Routine';
                      final desc = template['description'] ?? 'No description.';
                      final exList = template['exercises'] as List<dynamic>? ?? [];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: HunterCard(
                          glowColor: AppTheme.primaryBlue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.toUpperCase(),
                                style: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              if (desc.isNotEmpty)
                                Text(
                                  desc,
                                  style: GoogleFonts.outfit(fontSize: 12, color: Colors.white38),
                                ),
                              const SizedBox(height: 10),
                              
                              // Exercises preview list
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: exList.map((te) {
                                  final exName = te['exercises']?['name'] ?? 'Exercise';
                                  final sets = te['sets_count'] ?? 3;
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.04),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '$exName x$sets',
                                      style: GoogleFonts.outfit(fontSize: 9, color: Colors.white54),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Divider(color: Colors.white12, height: 24),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      minimumSize: const Size(0, 32),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () => _startTemplateWorkout(template),
                                    icon: const Icon(LucideIcons.play, size: 12),
                                    label: const Text('START ROUTINE'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
