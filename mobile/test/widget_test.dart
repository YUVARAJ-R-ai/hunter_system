import 'package:flutter_test/flutter_test.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';
import 'package:hunter_system_mobile/providers/hunter_provider.dart';

void main() {
  group('HunterData cache serialization', () {
    HunterData sample() => HunterData(
          uid: 'user-123',
          username: 'Sung',
          level: 12,
          xp: 340,
          gold: 999,
          mana: 80,
          maxMana: 120,
          statPoints: 3,
          hp: 95,
          stats: const {'STR': 20, 'INT': 15, 'AGI': 12, 'VIT': 11, 'END': 10, 'SEN': 9},
          quests: [
            {'id': 'q1', 'title': 'Push-ups', 'completed': false, 'xp_reward': 50},
          ],
          bosses: const [],
          skills: const [],
          inventory: const [],
          achievements: const [],
          habits: const [],
          rewards: const [],
          shadows: const [],
          loginStreak: 7,
          lastLoginAt: DateTime.utc(2026, 7, 20, 9, 30),
          streakShields: 2,
          restDaysRemaining: 1,
          isOnRestDay: false,
          streakRecoveryDeadline: null,
        );

    test('round-trips through toJson/fromJson without data loss', () {
      final original = sample();
      final restored = HunterData.fromJson(original.toJson());

      expect(restored.uid, original.uid);
      expect(restored.username, original.username);
      expect(restored.level, original.level);
      expect(restored.xp, original.xp);
      expect(restored.gold, original.gold);
      expect(restored.statPoints, original.statPoints);
      expect(restored.stats, original.stats);
      expect(restored.quests, original.quests);
      expect(restored.loginStreak, original.loginStreak);
      expect(restored.lastLoginAt, original.lastLoginAt);
      expect(restored.streakShields, original.streakShields);
      expect(restored.restDaysRemaining, original.restDaysRemaining);
      expect(restored.isOnRestDay, original.isOnRestDay);
      expect(restored.streakRecoveryDeadline, original.streakRecoveryDeadline);
    });

    test('tolerates a missing/empty payload with safe defaults', () {
      final restored = HunterData.fromJson({'uid': 'u'});
      expect(restored.uid, 'u');
      expect(restored.username, 'Hunter');
      expect(restored.level, 1);
      expect(restored.quests, isEmpty);
      expect(restored.restDaysRemaining, 1);
    });
  });

  group('ActiveWorkoutSet Tests', () {
    test('should initialize with default values', () {
      final set = ActiveWorkoutSet();
      expect(set.weight, 0.0);
      expect(set.reps, 0);
      expect(set.rpe, isNull);
      expect(set.isWarmup, isFalse);
      expect(set.isCompleted, isFalse);
    });

    test('should serialize to JSON correctly', () {
      final set = ActiveWorkoutSet(
        weight: 80.5,
        reps: 10,
        rpe: 9,
        isWarmup: true,
        isCompleted: true,
      );

      final json = set.toJson();

      expect(json['weight'], 80.5);
      expect(json['reps'], 10);
      expect(json['rpe'], 9);
      expect(json['is_warmup'], isTrue);
      expect(json['is_completed'], isTrue);
    });
  });

  group('ActiveWorkoutNotifier Tests', () {
    test('should rename active workout correctly', () {
      final notifier = ActiveWorkoutNotifier();
      // Initially not active, renaming should not affect anything
      notifier.renameWorkout('Leg Day');
      expect(notifier.state.name, 'Empty Workout');

      // Start workout
      notifier.startWorkout(name: 'Chest Day');
      expect(notifier.state.name, 'Chest Day');

      // Rename active workout
      notifier.renameWorkout('Leg Day');
      expect(notifier.state.name, 'Leg Day');
    });
  });
}
