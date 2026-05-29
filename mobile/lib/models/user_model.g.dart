// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  email: json['email'] as String,
  username: json['username'] as String,
  level: (json['level'] as num).toInt(),
  xp: (json['xp'] as num).toInt(),
  gold: (json['gold'] as num).toInt(),
  mana: (json['mana'] as num).toInt(),
  maxMana: (json['maxMana'] as num).toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'username': instance.username,
  'level': instance.level,
  'xp': instance.xp,
  'gold': instance.gold,
  'mana': instance.mana,
  'maxMana': instance.maxMana,
};

HunterStats _$HunterStatsFromJson(Map<String, dynamic> json) => HunterStats(
  str: (json['str'] as num).toInt(),
  intStat: (json['intStat'] as num).toInt(),
  agi: (json['agi'] as num).toInt(),
  vit: (json['vit'] as num).toInt(),
  end: (json['end'] as num).toInt(),
  sen: (json['sen'] as num).toInt(),
);

Map<String, dynamic> _$HunterStatsToJson(HunterStats instance) =>
    <String, dynamic>{
      'str': instance.str,
      'intStat': instance.intStat,
      'agi': instance.agi,
      'vit': instance.vit,
      'end': instance.end,
      'sen': instance.sen,
    };
