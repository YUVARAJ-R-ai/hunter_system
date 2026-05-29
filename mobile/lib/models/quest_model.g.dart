// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quest _$QuestFromJson(Map<String, dynamic> json) => Quest(
  id: json['id'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$QuestTypeEnumMap, json['type']),
  difficulty: $enumDecode(_$DifficultyRankEnumMap, json['difficulty']),
  category: $enumDecode(_$CategoryEnumMap, json['category']),
  xpReward: (json['xpReward'] as num).toInt(),
  goldReward: (json['goldReward'] as num).toInt(),
  statBoostStat: json['statBoostStat'] as String,
  statBoostAmount: (json['statBoostAmount'] as num).toInt(),
  hasDeadline: json['hasDeadline'] as bool,
  deadline: json['deadline'] as String?,
  completed: json['completed'] as bool,
  failed: json['failed'] as bool,
  isImportant: json['isImportant'] as bool,
  isMyDay: json['isMyDay'] as bool,
);

Map<String, dynamic> _$QuestToJson(Quest instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'type': _$QuestTypeEnumMap[instance.type]!,
  'difficulty': _$DifficultyRankEnumMap[instance.difficulty]!,
  'category': _$CategoryEnumMap[instance.category]!,
  'xpReward': instance.xpReward,
  'goldReward': instance.goldReward,
  'statBoostStat': instance.statBoostStat,
  'statBoostAmount': instance.statBoostAmount,
  'hasDeadline': instance.hasDeadline,
  'deadline': instance.deadline,
  'completed': instance.completed,
  'failed': instance.failed,
  'isImportant': instance.isImportant,
  'isMyDay': instance.isMyDay,
};

const _$QuestTypeEnumMap = {
  QuestType.DAILY: 'DAILY',
  QuestType.MAIN: 'MAIN',
  QuestType.SIDE: 'SIDE',
  QuestType.PENALTY: 'PENALTY',
  QuestType.EMERGENCY: 'EMERGENCY',
};

const _$DifficultyRankEnumMap = {
  DifficultyRank.E: 'E',
  DifficultyRank.D: 'D',
  DifficultyRank.C: 'C',
  DifficultyRank.B: 'B',
  DifficultyRank.A: 'A',
  DifficultyRank.S: 'S',
};

const _$CategoryEnumMap = {
  Category.FITNESS: 'FITNESS',
  Category.STUDY: 'STUDY',
  Category.WORK: 'WORK',
  Category.HEALTH: 'HEALTH',
  Category.SOCIAL: 'SOCIAL',
  Category.CREATIVITY: 'CREATIVITY',
};
