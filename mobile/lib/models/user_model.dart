import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final String username;
  final int level;
  final int xp;
  final int gold;
  final int mana;
  final int maxMana;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.level,
    required this.xp,
    required this.gold,
    required this.mana,
    required this.maxMana,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class HunterStats {
  final int str;
  final int intStat;
  final int agi;
  final int vit;
  final int end;
  final int sen;

  HunterStats({
    required this.str,
    required this.intStat,
    required this.agi,
    required this.vit,
    required this.end,
    required this.sen,
  });

  factory HunterStats.fromJson(Map<String, dynamic> json) => _$HunterStatsFromJson(json);
  Map<String, dynamic> toJson() => _$HunterStatsToJson(this);
}
