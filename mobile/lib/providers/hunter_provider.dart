import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/core/helpers.dart';
import 'package:hunter_system_mobile/data/hunter_cache.dart';

/// Central data state for the hunter system.
class HunterData {
  final String uid;
  final String username;
  final int level;
  final int xp;
  final int gold;
  final int mana;
  final int maxMana;
  final int statPoints;
  final int hp;
  final Map<String, int> stats;
  final List<Map<String, dynamic>> quests;
  final List<Map<String, dynamic>> bosses;
  final List<Map<String, dynamic>> skills;
  final List<Map<String, dynamic>> inventory;
  final List<Map<String, dynamic>> achievements;
  final List<Map<String, dynamic>> habits;
  final List<Map<String, dynamic>> rewards;
  final List<Map<String, dynamic>> shadows;
  
  // New Streak & Mercy fields
  final int loginStreak;
  final DateTime? lastLoginAt;
  final int streakShields;
  final int restDaysRemaining;
  final bool isOnRestDay;
  final DateTime? streakRecoveryDeadline;

  HunterData({
    required this.uid,
    required this.username,
    required this.level,
    required this.xp,
    required this.gold,
    required this.mana,
    required this.maxMana,
    required this.statPoints,
    required this.hp,
    required this.stats,
    required this.quests,
    required this.bosses,
    required this.skills,
    required this.inventory,
    required this.achievements,
    required this.habits,
    required this.rewards,
    required this.shadows,
    required this.loginStreak,
    this.lastLoginAt,
    required this.streakShields,
    required this.restDaysRemaining,
    required this.isOnRestDay,
    this.streakRecoveryDeadline,
  });

  HunterData copyWith({
    int? level,
    int? xp,
    int? gold,
    int? statPoints,
    List<Map<String, dynamic>>? quests,
    List<Map<String, dynamic>>? bosses,
    List<Map<String, dynamic>>? inventory,
    List<Map<String, dynamic>>? rewards,
    int? restDaysRemaining,
    bool? isOnRestDay,
  }) {
    return HunterData(
      uid: uid,
      username: username,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      gold: gold ?? this.gold,
      mana: mana,
      maxMana: maxMana,
      statPoints: statPoints ?? this.statPoints,
      hp: hp,
      stats: stats,
      quests: quests ?? this.quests,
      bosses: bosses ?? this.bosses,
      skills: skills,
      inventory: inventory ?? this.inventory,
      achievements: achievements,
      habits: habits,
      rewards: rewards ?? this.rewards,
      shadows: shadows,
      loginStreak: loginStreak,
      lastLoginAt: lastLoginAt,
      streakShields: streakShields,
      restDaysRemaining: restDaysRemaining ?? this.restDaysRemaining,
      isOnRestDay: isOnRestDay ?? this.isOnRestDay,
      streakRecoveryDeadline: streakRecoveryDeadline,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'level': level,
        'xp': xp,
        'gold': gold,
        'mana': mana,
        'maxMana': maxMana,
        'statPoints': statPoints,
        'hp': hp,
        'stats': stats,
        'quests': quests,
        'bosses': bosses,
        'skills': skills,
        'inventory': inventory,
        'achievements': achievements,
        'habits': habits,
        'rewards': rewards,
        'shadows': shadows,
        'loginStreak': loginStreak,
        'lastLoginAt': lastLoginAt?.toIso8601String(),
        'streakShields': streakShields,
        'restDaysRemaining': restDaysRemaining,
        'isOnRestDay': isOnRestDay,
        'streakRecoveryDeadline': streakRecoveryDeadline?.toIso8601String(),
      };

  factory HunterData.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> listOf(String key) =>
        ((json[key] as List?) ?? const [])
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList();
    DateTime? dateOf(String key) =>
        json[key] == null ? null : DateTime.tryParse(json[key] as String);
    return HunterData(
      uid: json['uid'] as String,
      username: json['username'] as String? ?? 'Hunter',
      level: (json['level'] as num?)?.toInt() ?? 1,
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      gold: (json['gold'] as num?)?.toInt() ?? 0,
      mana: (json['mana'] as num?)?.toInt() ?? 100,
      maxMana: (json['maxMana'] as num?)?.toInt() ?? 100,
      statPoints: (json['statPoints'] as num?)?.toInt() ?? 0,
      hp: (json['hp'] as num?)?.toInt() ?? 100,
      stats: (json['stats'] as Map?)
              ?.map((k, v) => MapEntry(k as String, (v as num).toInt())) ??
          <String, int>{},
      quests: listOf('quests'),
      bosses: listOf('bosses'),
      skills: listOf('skills'),
      inventory: listOf('inventory'),
      achievements: listOf('achievements'),
      habits: listOf('habits'),
      rewards: listOf('rewards'),
      shadows: listOf('shadows'),
      loginStreak: (json['loginStreak'] as num?)?.toInt() ?? 0,
      lastLoginAt: dateOf('lastLoginAt'),
      streakShields: (json['streakShields'] as num?)?.toInt() ?? 0,
      restDaysRemaining: (json['restDaysRemaining'] as num?)?.toInt() ?? 1,
      isOnRestDay: json['isOnRestDay'] as bool? ?? false,
      streakRecoveryDeadline: dateOf('streakRecoveryDeadline'),
    );
  }
}

class HunterNotifier extends StateNotifier<AsyncValue<HunterData>> {
  HunterNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  final HunterCache _cache = HunterCache();

  /// Stale-while-revalidate: on startup, render the cached snapshot instantly
  /// (no spinner) and refresh in the background. Only a cold cache shows the
  /// full-screen loading state.
  Future<void> _init() async {
    final uid = SupabaseService.client.auth.currentUser?.id;
    if (uid != null) {
      final cached = await _cache.readJson(uid);
      if (cached != null) {
        try {
          _setData(HunterData.fromJson(cached));
        } catch (_) {/* ignore corrupt cache */}
      }
    }
    await _load(showLoading: !state.hasValue);
  }

  /// Public entry point. The first load (no data yet) shows the full-screen
  /// spinner; every later call refreshes in the background so the current tab
  /// and scroll position are preserved (fixes the redirect-to-Home bug).
  Future<void> load() => _load(showLoading: !state.hasValue);

  /// Sets data state and persists it to the local cache so the next launch is
  /// instant. Used for both network loads and optimistic mutations.
  void _setData(HunterData data) {
    _setData(data);
    _cache.writeJson(data.uid, data.toJson());
  }

  Future<void> _load({required bool showLoading}) async {
    if (showLoading) state = const AsyncValue.loading();
    try {
      final client = SupabaseService.client;
      final user = client.auth.currentUser;
      if (user == null) throw Exception('Not authenticated');

      // Fire all reads concurrently instead of ~10 sequential round-trips.
      final results = await Future.wait<dynamic>([
        client.from('users').select().eq('id', user.id).single(),
        client.from('hunter_stats').select().eq('user_id', user.id).maybeSingle(),
        client
            .from('quests')
            .select()
            .eq('user_id', user.id)
            .order('created_at', ascending: false),
        client
            .from('bosses')
            .select()
            .eq('user_id', user.id)
            .order('created_at', ascending: false),
        client.from('skills').select().eq('user_id', user.id),
        client.from('inventory_items').select().eq('user_id', user.id),
        client.from('achievements').select().eq('user_id', user.id),
        client.from('habits').select().eq('user_id', user.id),
        client.from('rewards').select().eq('user_id', user.id),
        client
            .from('shadows')
            .select()
            .eq('user_id', user.id)
            .order('extracted_at', ascending: false),
      ]);

      final profileRes = results[0] as Map<String, dynamic>;
      final statsRes = results[1] as Map<String, dynamic>?;
      final questsRes = results[2] as List;
      final bossesRes = results[3] as List;
      final skillsRes = results[4] as List;
      final inventoryRes = results[5] as List;
      final achievementsRes = results[6] as List;
      final habitsRes = results[7] as List;
      final rewardsRes = results[8] as List;
      final shadowsRes = results[9] as List;

      final stats = <String, int>{
        'STR': (statsRes?['str'] as num?)?.toInt() ?? 10,
        'INT': (statsRes?['int'] as num?)?.toInt() ?? 10,
        'AGI': (statsRes?['agi'] as num?)?.toInt() ?? 10,
        'VIT': (statsRes?['vit'] as num?)?.toInt() ?? 10,
        'END': (statsRes?['end'] as num?)?.toInt() ?? 10,
        'SEN': (statsRes?['sen'] as num?)?.toInt() ?? 10,
      };

      _setData(HunterData(
        uid: user.id,
        username: profileRes['username'] ?? 'Hunter',
        level: (profileRes['level'] as num?)?.toInt() ?? 1,
        xp: (profileRes['xp'] as num?)?.toInt() ?? 0,
        gold: (profileRes['gold'] as num?)?.toInt() ?? 0,
        mana: (profileRes['mana'] as num?)?.toInt() ?? 100,
        maxMana: (profileRes['max_mana'] as num?)?.toInt() ?? 100,
        statPoints: (profileRes['stat_points'] as num?)?.toInt() ?? 0,
        hp: (profileRes['hp'] as num?)?.toInt() ?? 100,
        stats: stats,
        quests: List<Map<String, dynamic>>.from(questsRes),
        bosses: List<Map<String, dynamic>>.from(bossesRes),
        skills: List<Map<String, dynamic>>.from(skillsRes),
        inventory: List<Map<String, dynamic>>.from(inventoryRes),
        achievements: List<Map<String, dynamic>>.from(achievementsRes),
        habits: List<Map<String, dynamic>>.from(habitsRes),
        rewards: List<Map<String, dynamic>>.from(rewardsRes),
        shadows: List<Map<String, dynamic>>.from(shadowsRes),
        loginStreak: (profileRes['login_streak'] as num?)?.toInt() ?? 0,
        lastLoginAt: profileRes['last_login_at'] != null ? DateTime.parse(profileRes['last_login_at'] as String) : null,
        streakShields: (profileRes['streak_shields'] as num?)?.toInt() ?? 0,
        restDaysRemaining: (profileRes['rest_days_remaining'] as num?)?.toInt() ?? 1,
        isOnRestDay: profileRes['is_on_rest_day'] as bool? ?? false,
        streakRecoveryDeadline: profileRes['streak_recovery_deadline'] != null ? DateTime.parse(profileRes['streak_recovery_deadline'] as String) : null,
      ));
    } catch (e, st) {
      // Only surface a full-screen error when there's nothing to show. A failed
      // background refresh keeps the last good data on screen.
      if (!state.hasValue) state = AsyncValue.error(e, st);
    }
  }

  Future<void> allocateStatPoint(String stat) async {
    try {
      final client = SupabaseService.client;
      await client.rpc('allocate_stat_point', params: {
        'stat_to_boost': stat,
        'amount': 1,
      });
      await _load(showLoading: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> dailyCheckIn() async {
    try {
      final client = SupabaseService.client;
      final res = await client.rpc('daily_check_in');
      await _load(showLoading: false);
      return Map<String, dynamic>.from(res as Map);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> buyStreakShield() async {
    try {
      final client = SupabaseService.client;
      final res = await client.rpc('buy_streak_shield');
      await _load(showLoading: false);
      return Map<String, dynamic>.from(res as Map);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> recoverStreak(int previousStreak) async {
    try {
      final client = SupabaseService.client;
      final res = await client.rpc('recover_streak', params: {
        'previous_streak': previousStreak,
      });
      await _load(showLoading: false);
      return Map<String, dynamic>.from(res as Map);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> toggleRestDay() async {
    try {
      final client = SupabaseService.client;
      final res = await client.rpc('toggle_rest_day');
      await _load(showLoading: false);
      return Map<String, dynamic>.from(res as Map);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() => load();

  // --- Quest mutations (optimistic; revert + rethrow on failure) ------------

  /// Marks a quest completed and awards its XP/gold locally, then persists.
  /// Returns the awarded {xp, gold} so the caller can show feedback.
  Future<Map<String, int>> completeQuest(String id) async {
    final current = state.value;
    if (current == null) return {'xp': 0, 'gold': 0};

    final quest = current.quests.firstWhere(
      (q) => q['id'] == id,
      orElse: () => <String, dynamic>{},
    );
    if (quest.isEmpty || quest['completed'] == true || quest['failed'] == true) {
      return {'xp': 0, 'gold': 0};
    }

    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final xpReward = (quest['xp_reward'] as num?)?.toInt() ?? 0;
    final goldReward = (quest['gold_reward'] as num?)?.toInt() ?? 0;

    // Compute the new XP/level locally (mirrors getXPNeeded == level * 200).
    int newXp = current.xp + xpReward;
    int newGold = current.gold + goldReward;
    int level = current.level;
    int xpNeeded = getXPNeeded(level);
    while (xpNeeded > 0 && newXp >= xpNeeded) {
      newXp -= xpNeeded;
      level++;
      xpNeeded = getXPNeeded(level);
    }

    final updatedQuests = current.quests
        .map((q) => q['id'] == id ? {...q, 'completed': true} : q)
        .toList();

    // Optimistic update.
    _setData(current.copyWith(
      quests: updatedQuests,
      xp: newXp,
      gold: newGold,
      level: level,
    ));

    try {
      await client
          .from('quests')
          .update({'completed': true})
          .eq('id', id)
          .eq('user_id', user.id);

      if (xpReward > 0 || goldReward > 0) {
        await client
            .from('users')
            .update({'xp': newXp, 'gold': newGold, 'level': level})
            .eq('id', user.id);
      }
    } catch (e) {
      _setData(current); // revert
      rethrow;
    }
    return {'xp': xpReward, 'gold': goldReward};
  }

  Future<void> failQuest(String id) async {
    final current = state.value;
    if (current == null) return;

    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final updatedQuests = current.quests
        .map((q) => q['id'] == id ? {...q, 'failed': true} : q)
        .toList();
    _setData(current.copyWith(quests: updatedQuests));

    try {
      await client
          .from('quests')
          .update({'failed': true})
          .eq('id', id)
          .eq('user_id', user.id);
    } catch (e) {
      _setData(current);
      rethrow;
    }
  }

  Future<void> deleteQuest(String id) async {
    final current = state.value;
    if (current == null) return;

    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final updatedQuests =
        current.quests.where((q) => q['id'] != id).toList();
    _setData(current.copyWith(quests: updatedQuests));

    try {
      await client
          .from('quests')
          .delete()
          .eq('id', id)
          .eq('user_id', user.id);
    } catch (e) {
      _setData(current);
      rethrow;
    }
  }

  /// Inserts a quest and prepends the returned row to local state (no full
  /// refetch). Throws on failure so the caller can surface the error.
  Future<void> createQuest(Map<String, dynamic> payload) async {
    final current = state.value;
    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final inserted = await client
        .from('quests')
        .insert({...payload, 'user_id': user.id})
        .select()
        .single();

    if (current != null) {
      _setData(current.copyWith(
        quests: [Map<String, dynamic>.from(inserted), ...current.quests],
      ));
    }
  }

  /// Patches arbitrary editable fields on a quest (title/type/difficulty/
  /// category/is_important/failed, …). Optimistic; reverts + rethrows on error.
  Future<void> updateQuest(String id, Map<String, dynamic> fields) async {
    final current = state.value;
    if (current == null) return;

    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final updatedQuests = current.quests
        .map((q) => q['id'] == id ? {...q, ...fields} : q)
        .toList();
    _setData(current.copyWith(quests: updatedQuests));

    try {
      await client
          .from('quests')
          .update(fields)
          .eq('id', id)
          .eq('user_id', user.id);
    } catch (e) {
      _setData(current);
      rethrow;
    }
  }

  /// Reopens a completed quest, reversing the XP/gold/level it awarded
  /// (mirrors the completeQuest math in reverse, clamped at level 1 / 0).
  Future<void> uncompleteQuest(String id) async {
    final current = state.value;
    if (current == null) return;

    final quest = current.quests.firstWhere(
      (q) => q['id'] == id,
      orElse: () => <String, dynamic>{},
    );
    if (quest.isEmpty || quest['completed'] != true) return;

    final client = SupabaseService.client;
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final xpReward = (quest['xp_reward'] as num?)?.toInt() ?? 0;
    final goldReward = (quest['gold_reward'] as num?)?.toInt() ?? 0;

    int newXp = current.xp - xpReward;
    int level = current.level;
    while (newXp < 0 && level > 1) {
      level--;
      newXp += getXPNeeded(level);
    }
    if (newXp < 0) newXp = 0;
    int newGold = current.gold - goldReward;
    if (newGold < 0) newGold = 0;

    final updatedQuests = current.quests
        .map((q) => q['id'] == id ? {...q, 'completed': false} : q)
        .toList();

    _setData(current.copyWith(
      quests: updatedQuests,
      xp: newXp,
      gold: newGold,
      level: level,
    ));

    try {
      await client
          .from('quests')
          .update({'completed': false})
          .eq('id', id)
          .eq('user_id', user.id);
      if (xpReward > 0 || goldReward > 0) {
        await client
            .from('users')
            .update({'xp': newXp, 'gold': newGold, 'level': level})
            .eq('id', user.id);
      }
    } catch (e) {
      _setData(current);
      rethrow;
    }
  }
}

final hunterDataProvider =
    StateNotifierProvider<HunterNotifier, AsyncValue<HunterData>>((ref) {
  return HunterNotifier();
});