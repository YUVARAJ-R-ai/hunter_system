import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';

class ActiveWorkoutSet {
  double weight;
  int reps;
  int? rpe;
  bool isWarmup;
  bool isCompleted;

  ActiveWorkoutSet({
    this.weight = 0.0,
    this.reps = 0,
    this.rpe,
    this.isWarmup = false,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'reps': reps,
        'rpe': rpe,
        'is_warmup': isWarmup,
        'is_completed': isCompleted,
      };
}

class ActiveWorkoutExercise {
  final Map<String, dynamic> exercise;
  final List<ActiveWorkoutSet> sets;

  ActiveWorkoutExercise({
    required this.exercise,
    required this.sets,
  });
}

class ActiveWorkoutState {
  final String name;
  final DateTime? startedAt;
  final List<ActiveWorkoutExercise> exercises;
  final bool isActive;
  final String? templateId;

  ActiveWorkoutState({
    this.name = 'Empty Workout',
    this.startedAt,
    this.exercises = const [],
    this.isActive = false,
    this.templateId,
  });

  ActiveWorkoutState copyWith({
    String? name,
    DateTime? startedAt,
    List<ActiveWorkoutExercise>? exercises,
    bool? isActive,
    String? templateId,
  }) {
    return ActiveWorkoutState(
      name: name ?? this.name,
      startedAt: startedAt ?? this.startedAt,
      exercises: exercises ?? this.exercises,
      isActive: isActive ?? this.isActive,
      templateId: templateId ?? this.templateId,
    );
  }
}

class ActiveWorkoutNotifier extends StateNotifier<ActiveWorkoutState> {
  ActiveWorkoutNotifier() : super(ActiveWorkoutState());

  void startWorkout({String name = 'Morning Workout', String? templateId, List<ActiveWorkoutExercise> exercises = const []}) {
    state = ActiveWorkoutState(
      name: name,
      startedAt: DateTime.now(),
      exercises: exercises,
      isActive: true,
      templateId: templateId,
    );
  }

  void addExercise(Map<String, dynamic> exercise) {
    if (!state.isActive) return;
    final newExercise = ActiveWorkoutExercise(
      exercise: exercise,
      sets: [ActiveWorkoutSet(weight: 0, reps: 0)],
    );
    state = state.copyWith(
      exercises: [...state.exercises, newExercise],
    );
  }

  void removeExercise(int exerciseIndex) {
    if (!state.isActive) return;
    final newExercises = List<ActiveWorkoutExercise>.from(state.exercises);
    newExercises.removeAt(exerciseIndex);
    state = state.copyWith(exercises: newExercises);
  }

  void addSet(int exerciseIndex) {
    if (!state.isActive) return;
    final exercises = List<ActiveWorkoutExercise>.from(state.exercises);
    final target = exercises[exerciseIndex];
    
    // Copy the last set values as default for the new set
    double lastWeight = 0;
    int lastReps = 0;
    if (target.sets.isNotEmpty) {
      lastWeight = target.sets.last.weight;
      lastReps = target.sets.last.reps;
    }
    
    target.sets.add(ActiveWorkoutSet(
      weight: lastWeight,
      reps: lastReps,
    ));
    state = state.copyWith(exercises: exercises);
  }

  void removeSet(int exerciseIndex, int setIndex) {
    if (!state.isActive) return;
    final exercises = List<ActiveWorkoutExercise>.from(state.exercises);
    final target = exercises[exerciseIndex];
    if (target.sets.length > 1) {
      target.sets.removeAt(setIndex);
    } else {
      exercises.removeAt(exerciseIndex);
    }
    state = state.copyWith(exercises: exercises);
  }

  void updateSet(int exerciseIndex, int setIndex, {double? weight, int? reps, int? rpe, bool? isWarmup, bool? isCompleted}) {
    if (!state.isActive) return;
    final exercises = List<ActiveWorkoutExercise>.from(state.exercises);
    final set = exercises[exerciseIndex].sets[setIndex];
    
    if (weight != null) set.weight = weight;
    if (reps != null) set.reps = reps;
    if (rpe != null) set.rpe = rpe;
    if (isWarmup != null) set.isWarmup = isWarmup;
    if (isCompleted != null) set.isCompleted = isCompleted;

    state = state.copyWith(exercises: exercises);
  }

  void discardWorkout() {
    state = ActiveWorkoutState();
  }

  Future<void> saveWorkout(WidgetRef ref) async {
    if (!state.isActive || state.startedAt == null) return;
    final user = SupabaseService.client.auth.currentUser;
    if (user == null) return;

    final completedAt = DateTime.now();
    final durationSeconds = completedAt.difference(state.startedAt!).inSeconds;

    // Calculate total volume and verify sets
    double totalVolume = 0;
    for (var ex in state.exercises) {
      for (var set in ex.sets) {
        if (set.isCompleted) {
          totalVolume += set.weight * set.reps;
        }
      }
    }

    // 1. Insert into workout_logs
    final logRes = await SupabaseService.client.from('workout_logs').insert({
      'user_id': user.id,
      'template_id': state.templateId,
      'name': state.name,
      'started_at': state.startedAt!.toIso8601String(),
      'completed_at': completedAt.toIso8601String(),
      'duration_seconds': durationSeconds,
      'total_volume_kg': totalVolume,
    }).select().single();

    final logId = logRes['id'] as String;

    // 2. Insert workout_sets
    for (var ex in state.exercises) {
      final exerciseId = ex.exercise['id'] as String;
      for (int i = 0; i < ex.sets.length; i++) {
        final set = ex.sets[i];
        await SupabaseService.client.from('workout_sets').insert({
          'log_id': logId,
          'exercise_id': exerciseId,
          'set_number': i + 1,
          'weight': set.weight,
          'reps': set.reps,
          'rpe': set.rpe,
          'is_warmup': set.isWarmup,
          'is_completed': set.isCompleted,
        });
      }
    }

    // Award XP/Gold for completing workout
    // 100 XP + 50 Gold base, with +1 XP per 100kg volume (capped at 50 XP bonus)
    final int xpBase = 100;
    final int goldBase = 50;
    final int volumeBonusXp = (totalVolume / 100).floor().clamp(0, 50);
    final int finalXp = xpBase + volumeBonusXp;

    final profile = await SupabaseService.client
        .from('users')
        .select('xp, gold, level')
        .eq('id', user.id)
        .single();

    int newXp = ((profile['xp'] as num?)?.toInt() ?? 0) + finalXp;
    int newGold = ((profile['gold'] as num?)?.toInt() ?? 0) + goldBase;
    int level = (profile['level'] as num?)?.toInt() ?? 1;
    int xpNeeded = level * 200;

    while (newXp >= xpNeeded) {
      newXp -= xpNeeded;
      level++;
      xpNeeded = level * 200;
    }

    await SupabaseService.client
        .from('users')
        .update({'xp': newXp, 'gold': newGold, 'level': level})
        .eq('id', user.id);

    // Reset state
    state = ActiveWorkoutState();
  }

  Future<void> createTemplate(String name, String description, List<Map<String, dynamic>> selectedExercises) async {
    final user = SupabaseService.client.auth.currentUser;
    if (user == null) return;

    final templateRes = await SupabaseService.client.from('workout_templates').insert({
      'user_id': user.id,
      'name': name,
      'description': description,
    }).select().single();

    final templateId = templateRes['id'] as String;

    for (int i = 0; i < selectedExercises.length; i++) {
      final ex = selectedExercises[i];
      await SupabaseService.client.from('workout_template_exercises').insert({
        'template_id': templateId,
        'exercise_id': ex['id'] as String,
        'sets_count': (ex['sets_count'] as num?)?.toInt() ?? 3,
        'reps_target': (ex['reps_target'] as num?)?.toInt() ?? 10,
        'sort_order': i,
      });
    }
  }

  Future<void> createCustomExercise(String name, String targetMuscle, String description) async {
    final user = SupabaseService.client.auth.currentUser;
    if (user == null) return;

    await SupabaseService.client.from('exercises').insert({
      'user_id': user.id,
      'name': name,
      'target_muscle': targetMuscle,
      'description': description.isNotEmpty ? description : null,
    });
  }
}

final activeWorkoutProvider = StateNotifierProvider<ActiveWorkoutNotifier, ActiveWorkoutState>((ref) {
  return ActiveWorkoutNotifier();
});

// exercises lists provider
final exercisesListProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final user = SupabaseService.client.auth.currentUser;
  if (user == null) return [];
  
  final res = await SupabaseService.client
      .from('exercises')
      .select()
      .order('name');
  
  return List<Map<String, dynamic>>.from(res);
});

// workout templates provider
final workoutTemplatesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final user = SupabaseService.client.auth.currentUser;
  if (user == null) return [];

  final templates = await SupabaseService.client
      .from('workout_templates')
      .select()
      .eq('user_id', user.id)
      .order('created_at', ascending: false);

  final List<Map<String, dynamic>> enrichedTemplates = [];

  for (var template in templates) {
    final templateId = template['id'] as String;
    final exercises = await SupabaseService.client
        .from('workout_template_exercises')
        .select('*, exercises(*)')
        .eq('template_id', templateId)
        .order('sort_order');

    enrichedTemplates.add({
      ...template,
      'exercises': List<Map<String, dynamic>>.from(exercises),
    });
  }

  return enrichedTemplates;
});

// workout logs history provider
final workoutLogsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final user = SupabaseService.client.auth.currentUser;
  if (user == null) return [];

  final logs = await SupabaseService.client
      .from('workout_logs')
      .select()
      .eq('user_id', user.id)
      .order('completed_at', ascending: false);

  final List<Map<String, dynamic>> enrichedLogs = [];

  for (var log in logs) {
    final logId = log['id'] as String;
    final sets = await SupabaseService.client
        .from('workout_sets')
        .select('*, exercises(*)')
        .eq('log_id', logId)
        .order('id');

    enrichedLogs.add({
      ...log,
      'sets': List<Map<String, dynamic>>.from(sets),
    });
  }

  return enrichedLogs;
});
