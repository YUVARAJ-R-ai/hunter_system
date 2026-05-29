import 'package:json_annotation/json_annotation.dart';

part 'quest_model.g.dart';

enum QuestType { DAILY, MAIN, SIDE, PENALTY, EMERGENCY }
enum DifficultyRank { E, D, C, B, A, S }
enum Category { FITNESS, STUDY, WORK, HEALTH, SOCIAL, CREATIVITY }

@JsonSerializable()
class Quest {
  final String id;
  final String title;
  final QuestType type;
  final DifficultyRank difficulty;
  final Category category;
  final int xpReward;
  final int goldReward;
  final String statBoostStat;
  final int statBoostAmount;
  final bool hasDeadline;
  final String? deadline;
  final bool completed;
  final bool failed;
  final bool isImportant;
  final bool isMyDay;

  Quest({
    required this.id,
    required this.title,
    required this.type,
    required this.difficulty,
    required this.category,
    required this.xpReward,
    required this.goldReward,
    required this.statBoostStat,
    required this.statBoostAmount,
    required this.hasDeadline,
    this.deadline,
    required this.completed,
    required this.failed,
    required this.isImportant,
    required this.isMyDay,
  });

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
  Map<String, dynamic> toJson() => _$QuestToJson(this);
}
