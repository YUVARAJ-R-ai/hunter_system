import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';
import 'package:hunter_system_mobile/features/workout/pages/exercise_list_page.dart';
import 'package:hunter_system_mobile/providers/hunter_provider.dart';
import 'package:hunter_system_mobile/services/notification_service.dart';

class ActiveWorkoutPage extends ConsumerStatefulWidget {
  const ActiveWorkoutPage({super.key});

  @override
  ConsumerState<ActiveWorkoutPage> createState() => _ActiveWorkoutPageState();
}

class _ActiveWorkoutPageState extends ConsumerState<ActiveWorkoutPage> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;

  // Rest Timer State
  Timer? _restTimer;
  int _restRemainingSeconds = 0;
  bool _isRestActive = false;
  int _totalRestSeconds = 90; // Default 90s

  // Workout Naming State
  late TextEditingController _nameController;
  bool _isEditingName = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _startDurationTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _restTimer?.cancel();
    _nameController.dispose();
    super.dispose();
  }

  void _startDurationTimer() {
    final startedAt = ref.read(activeWorkoutProvider).startedAt;
    if (startedAt != null) {
      _elapsed = DateTime.now().difference(startedAt);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        final start = ref.read(activeWorkoutProvider).startedAt;
        if (start != null) {
          setState(() {
            _elapsed = DateTime.now().difference(start);
          });
        }
      }
    });
  }

  void _startRestTimer(int seconds) {
    _restTimer?.cancel();
    setState(() {
      _totalRestSeconds = seconds;
      _restRemainingSeconds = seconds;
      _isRestActive = true;
    });

    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_restRemainingSeconds <= 1) {
        _restTimer?.cancel();
        setState(() {
          _isRestActive = false;
          _restRemainingSeconds = 0;
        });
        // Rest completed alert!
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Rest time over! Arise for the next set!'),
            backgroundColor: AppTheme.primaryBlue,
            duration: Duration(seconds: 3),
          ),
        );
        // Local Notification
        NotificationService.showInstantNotification(
          title: 'REST TIME OVER',
          body: 'Arise for the next set!',
        );
      } else {
        setState(() {
          _restRemainingSeconds--;
        });
      }
    });
  }

  void _addRestTime(int seconds) {
    if (!_isRestActive) return;
    setState(() {
      _restRemainingSeconds += seconds;
      _totalRestSeconds += seconds;
    });
  }

  void _skipRest() {
    _restTimer?.cancel();
    setState(() {
      _isRestActive = false;
      _restRemainingSeconds = 0;
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hrs = d.inHours;
    final mins = d.inMinutes.remainder(60);
    final secs = d.inSeconds.remainder(60);
    if (hrs > 0) {
      return '${twoDigits(hrs)}:${twoDigits(mins)}:${twoDigits(secs)}';
    }
    return '${twoDigits(mins)}:${twoDigits(secs)}';
  }

  Future<void> _finishWorkout() async {
    final state = ref.read(activeWorkoutProvider);
    if (state.exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add at least one exercise to complete the workout!'),
          backgroundColor: AppTheme.dangerRed,
        ),
      );
      return;
    }

    // Confirm
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        title: Text('COMPLETE WORKOUT', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold)),
        content: Text('Are you finished with this training session?', style: GoogleFonts.outfit(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('NO', style: GoogleFonts.spaceGrotesk(color: Colors.white30)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('YES, FINISH'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );
        
        await ref.read(activeWorkoutProvider.notifier).saveWorkout(ref);
        
        if (mounted) {
          Navigator.pop(context); // Dismiss loading dialog
          Navigator.pop(context); // Close active workout screen
          
          // Refresh user data (gold, level, quests, etc.)
          ref.invalidate(hunterDataProvider);
          ref.invalidate(workoutLogsProvider);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Workout logged successfully! +100 XP +50 Gold.'),
              backgroundColor: AppTheme.sRankGreen,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          Navigator.pop(context); // Dismiss loading
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error saving workout: $e'),
              backgroundColor: AppTheme.dangerRed,
            ),
          );
        }
      }
    }
  }

  Future<void> _discardWorkout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        title: Text('DISCARD WORKOUT', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: AppTheme.dangerRed)),
        content: Text('Are you sure you want to discard this workout? All progress will be lost.', style: GoogleFonts.outfit(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('CANCEL', style: GoogleFonts.spaceGrotesk(color: Colors.white30)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.dangerRed),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('DISCARD'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      ref.read(activeWorkoutProvider.notifier).discardWorkout();
      Navigator.pop(context);
    }
  }

  Map<String, String> _getPrevSessionData(List<Map<String, dynamic>> logs, String exerciseId, int setIndex) {
    for (var log in logs) {
      final logSets = log['sets'] as List<dynamic>? ?? [];
      final matchingSets = logSets.where((s) => s['exercise_id'] == exerciseId).toList();
      if (matchingSets.isNotEmpty) {
        matchingSets.sort((a, b) {
          final int aNum = (a['set_number'] as num?)?.toInt() ?? 0;
          final int bNum = (b['set_number'] as num?)?.toInt() ?? 0;
          return aNum.compareTo(bNum);
        });

        if (setIndex < matchingSets.length) {
          final prevSet = matchingSets[setIndex];
          final double? w = (prevSet['weight'] as num?)?.toDouble();
          final prevWeight = w != null ? (w % 1 == 0 ? w.toInt().toString() : w.toString()) : '-';
          final prevReps = prevSet['reps']?.toString() ?? '-';
          return {'weight': prevWeight, 'reps': prevReps};
        }
        break;
      }
    }
    return {'weight': '-', 'reps': '-'};
  }

  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(activeWorkoutProvider);
    final logsAsync = ref.watch(workoutLogsProvider);
    final logs = logsAsync.value ?? [];

    // Calculate dynamic stats
    double totalVolume = 0;
    int completedSets = 0;
    int totalSets = 0;
    for (var ex in workoutState.exercises) {
      for (var set in ex.sets) {
        totalSets++;
        if (set.isCompleted) {
          completedSets++;
          totalVolume += set.weight * set.reps;
        }
      }
    }

    final volumeStr = totalVolume % 1 == 0 ? totalVolume.toInt().toString() : totalVolume.toStringAsFixed(1);

    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditingName = true;
                  _nameController.text = workoutState.name;
                });
              },
              child: _isEditingName
                  ? SizedBox(
                      width: 200,
                      height: 30,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _nameController,
                              autofocus: true,
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onSubmitted: (val) {
                                if (val.trim().isNotEmpty) {
                                  ref.read(activeWorkoutProvider.notifier).renameWorkout(val.trim());
                                }
                                setState(() {
                                  _isEditingName = false;
                                });
                              },
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.check, size: 16, color: AppTheme.sRankGreen),
                            onPressed: () {
                              final val = _nameController.text;
                              if (val.trim().isNotEmpty) {
                                ref.read(activeWorkoutProvider.notifier).renameWorkout(val.trim());
                              }
                              setState(() {
                                _isEditingName = false;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          workoutState.name.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.edit, size: 12, color: Colors.white54),
                      ],
                    ),
            ),
            const SizedBox(height: 3),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    'TIME: ${_formatDuration(_elapsed)}',
                    style: GoogleFonts.outfit(fontSize: 10.5, color: AppTheme.primaryBlue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '|',
                    style: GoogleFonts.outfit(fontSize: 10.5, color: Colors.white24),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'VOLUME: $volumeStr KG',
                    style: GoogleFonts.outfit(fontSize: 10.5, color: AppTheme.sRankGreen, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '|',
                    style: GoogleFonts.outfit(fontSize: 10.5, color: Colors.white24),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'SETS: $completedSets/$totalSets',
                    style: GoogleFonts.outfit(fontSize: 10.5, color: Colors.amber, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.trash, color: AppTheme.dangerRed, size: 20),
            onPressed: _discardWorkout,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: _finishWorkout,
              child: Text(
                'FINISH',
                style: GoogleFonts.spaceGrotesk(color: AppTheme.sRankGreen, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  itemCount: workoutState.exercises.length + 1,
                  itemBuilder: (context, index) {
                    if (index == workoutState.exercises.length) {
                      // Add exercise button at the bottom
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () async {
                            final exercise = await Navigator.push<Map<String, dynamic>>(
                              context,
                              MaterialPageRoute(builder: (context) => const ExerciseListPage(isSelectionMode: true)),
                            );
                            if (exercise != null && mounted) {
                              ref.read(activeWorkoutProvider.notifier).addExercise(exercise);
                            }
                          },
                          icon: const Icon(LucideIcons.plus, size: 16, color: AppTheme.primaryBlue),
                          label: Text(
                            'ADD EXERCISE',
                            style: GoogleFonts.spaceGrotesk(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      );
                    }

                    final ex = workoutState.exercises[index];
                    return _buildExerciseCard(ex, index, logs);
                  },
                ),
              ),
            ],
          ),

          // Floating Rest Timer Overlay
          if (_isRestActive)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: _buildRestTimerOverlay(),
            ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(ActiveWorkoutExercise ex, int exerciseIndex, List<Map<String, dynamic>> logs) {
    final name = ex.exercise['name'] ?? 'Exercise';
    final target = ex.exercise['target_muscle'] ?? 'Muscle';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: HunterCard(
        glowColor: AppTheme.primaryBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        target.toUpperCase(),
                        style: GoogleFonts.outfit(fontSize: 11, color: Colors.white30),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white54),
                  onSelected: (val) {
                    if (val == 'delete') {
                      ref.read(activeWorkoutProvider.notifier).removeExercise(exerciseIndex);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(LucideIcons.trash2, size: 16, color: AppTheme.dangerRed),
                          const SizedBox(width: 8),
                          Text('Remove Exercise', style: GoogleFonts.outfit(color: AppTheme.dangerRed)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.white12, height: 20),

            // Sets column titles
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('SET', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38)),
                ),
                Expanded(
                  flex: 3,
                  child: Text('WEIGHT (KG)', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38)),
                ),
                Expanded(
                  flex: 3,
                  child: Text('REPS', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38)),
                ),
                Expanded(
                  flex: 2,
                  child: Text('RPE', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38)),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(LucideIcons.checkSquare, size: 16, color: Colors.white38),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Sets list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ex.sets.length,
              itemBuilder: (context, setIndex) {
                final set = ex.sets[setIndex];
                final isCompleted = set.isCompleted;
                final exerciseId = ex.exercise['id'] ?? '';
                final prevData = _getPrevSessionData(logs, exerciseId, setIndex);
                final prevWeightStr = prevData['weight'] ?? '-';
                final prevRepsStr = prevData['reps'] ?? '-';

                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: AppTheme.dangerRed.withOpacity(0.2),
                    child: const Icon(LucideIcons.trash, color: AppTheme.dangerRed, size: 16),
                  ),
                  onDismissed: (dir) {
                    ref.read(activeWorkoutProvider.notifier).removeSet(exerciseIndex, setIndex);
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCompleted ? 0.45 : 1.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          // Set number & warmup flag
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ref.read(activeWorkoutProvider.notifier).updateSet(
                                          exerciseIndex,
                                          setIndex,
                                          isWarmup: !set.isWarmup,
                                        );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: set.isWarmup ? AppTheme.neonPurple.withOpacity(0.1) : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: set.isWarmup ? AppTheme.neonPurple : Colors.transparent,
                                      ),
                                    ),
                                    child: Text(
                                      set.isWarmup ? 'W' : '${setIndex + 1}',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: set.isWarmup ? AppTheme.neonPurple : Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Weight input
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: SizedBox(
                                height: 32,
                                child: TextField(
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  decoration: InputDecoration(
                                    hintText: prevWeightStr,
                                    hintStyle: GoogleFonts.outfit(color: Colors.white24, fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                  ),
                                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white),
                                  onChanged: (val) {
                                    final d = double.tryParse(val) ?? 0.0;
                                    ref.read(activeWorkoutProvider.notifier).updateSet(exerciseIndex, setIndex, weight: d);
                                  },
                                  controller: TextEditingController(
                                    text: set.weight == 0 ? '' : (set.weight % 1 == 0 ? set.weight.toInt().toString() : set.weight.toString()),
                                  )..selection = TextSelection.fromPosition(
                                      TextPosition(offset: set.weight == 0 ? 0 : (set.weight % 1 == 0 ? set.weight.toInt().toString() : set.weight.toString()).length),
                                    ),
                                ),
                              ),
                            ),
                          ),

                          // Reps input
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: SizedBox(
                                height: 32,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: prevRepsStr,
                                    hintStyle: GoogleFonts.outfit(color: Colors.white24, fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                  ),
                                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white),
                                  onChanged: (val) {
                                    final r = int.tryParse(val) ?? 0;
                                    ref.read(activeWorkoutProvider.notifier).updateSet(exerciseIndex, setIndex, reps: r);
                                  },
                                  controller: TextEditingController(
                                    text: set.reps == 0 ? '' : set.reps.toString(),
                                  )..selection = TextSelection.fromPosition(
                                      TextPosition(offset: set.reps == 0 ? 0 : set.reps.toString().length),
                                    ),
                                ),
                              ),
                            ),
                          ),

                          // RPE input
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: SizedBox(
                                height: 32,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: '-',
                                    contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                  ),
                                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white),
                                  onChanged: (val) {
                                    final r = int.tryParse(val);
                                    ref.read(activeWorkoutProvider.notifier).updateSet(exerciseIndex, setIndex, rpe: r);
                                  },
                                  controller: TextEditingController(
                                    text: set.rpe == null ? '' : set.rpe.toString(),
                                  )..selection = TextSelection.fromPosition(
                                      TextPosition(offset: set.rpe == null ? 0 : set.rpe.toString().length),
                                    ),
                                ),
                              ),
                            ),
                          ),

                          // Completed check
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  final newVal = !set.isCompleted;
                                  ref.read(activeWorkoutProvider.notifier).updateSet(
                                        exerciseIndex,
                                        setIndex,
                                        isCompleted: newVal,
                                      );
                                  
                                  if (newVal) {
                                    // Trigger 90s rest timer on completing a set
                                    _startRestTimer(90);
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: set.isCompleted ? AppTheme.sRankGreen : Colors.white.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: set.isCompleted ? AppTheme.sRankGreen : Colors.white12,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: set.isCompleted
                                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),

            // Add set button
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 30),
              ),
              onPressed: () {
                ref.read(activeWorkoutProvider.notifier).addSet(exerciseIndex);
              },
              icon: const Icon(LucideIcons.plus, size: 14, color: AppTheme.primaryBlue),
              label: Text(
                'ADD SET',
                style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.primaryBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRestDurationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'SELECT REST DURATION',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const Divider(color: Colors.white12),
              ListTile(
                title: Center(
                  child: Text('30 SECONDS', style: GoogleFonts.outfit(color: Colors.white)),
                ),
                onTap: () {
                  _startRestTimer(30);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Center(
                  child: Text('60 SECONDS', style: GoogleFonts.outfit(color: Colors.white)),
                ),
                onTap: () {
                  _startRestTimer(60);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Center(
                  child: Text('90 SECONDS', style: GoogleFonts.outfit(color: Colors.white)),
                ),
                onTap: () {
                  _startRestTimer(90);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Center(
                  child: Text('2 MINUTES', style: GoogleFonts.outfit(color: Colors.white)),
                ),
                onTap: () {
                  _startRestTimer(120);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Center(
                  child: Text('CUSTOM...', style: GoogleFonts.outfit(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold)),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  _showCustomDurationDialog();
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showCustomDurationDialog() async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        title: Text(
          'CUSTOM REST DURATION',
          style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Duration in seconds',
            hintStyle: GoogleFonts.outfit(color: Colors.white24),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white30),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryBlue),
            ),
          ),
          style: GoogleFonts.outfit(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCEL', style: GoogleFonts.spaceGrotesk(color: Colors.white30)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
            ),
            onPressed: () {
              final seconds = int.tryParse(controller.text);
              if (seconds != null && seconds > 0) {
                _startRestTimer(seconds);
              }
              Navigator.pop(context);
            },
            child: Text('START', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildRestTimerOverlay() {
    final double progress = _totalRestSeconds > 0 ? _restRemainingSeconds / _totalRestSeconds : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _showRestDurationPicker,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  // Circular countdown indicator
                  SizedBox(
                    width: 38,
                    height: 38,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          backgroundColor: Colors.white12,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
                        ),
                        Center(
                          child: Icon(
                            LucideIcons.hourglass,
                            size: 14,
                            color: AppTheme.primaryBlue.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Rest remaining text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'REST TIMER',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Colors.white54,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${_restRemainingSeconds}s',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.edit, size: 12, color: Colors.white30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Actions
          TextButton(
            onPressed: () => _addRestTime(30),
            child: Text(
              '+30s',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              minimumSize: const Size(0, 32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: _skipRest,
            child: Text(
              'SKIP',
              style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
