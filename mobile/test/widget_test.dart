import 'package:flutter_test/flutter_test.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';

void main() {
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
}
