import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';

/// Central data state for the hunter system.
class HunterData {
  final String uid;
  final String username;
  final int level;
  final int xp;
  final int gold;
  final int mana;
  final int maxMana;
  final Map<String, int> stats;
  final List<Map<String, dynamic>> quests;
  final List<Map<String, dynamic>> bosses;
  final List<Map<String, dynamic>> skills;
  final List<Map<String, dynamic>> inventory;
  final List<Map<String, dynamic>> achievements;
  final List<Map<String, dynamic>> habits;
  final List<Map<String, dynamic>> rewards;

  HunterData({
    required this.uid,
    required this.username,
    required this.level,
    required this.xp,
    required this.gold,
    required this.mana,
    required this.maxMana,
    required this.stats,
    required this.quests,
    required this.bosses,
    required this.skills,
    required this.inventory,
    required this.achievements,
    required this.habits,
    required this.rewards,
  });
}

class HunterNotifier extends StateNotifier<AsyncValue<HunterData>> {
  HunterNotifier() : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final client = SupabaseService.client;
      final user = client.auth.currentUser;
      if (user == null) throw Exception('Not authenticated');

      final profileRes = await client
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      final statsRes = await client
          .from('hunter_stats')
          .select()
          .eq('user_id', user.id)
          .maybeSingle();

      final questsRes = await client
          .from('quests')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      final bossesRes = await client
          .from('bosses')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      final skillsRes = await client
          .from('skills')
          .select()
          .eq('user_id', user.id);

      final inventoryRes = await client
          .from('inventory_items')
          .select()
          .eq('user_id', user.id);

      final achievementsRes = await client
          .from('achievements')
          .select()
          .eq('user_id', user.id);

      final habitsRes = await client
          .from('habits')
          .select()
          .eq('user_id', user.id);

      final rewardsRes = await client
          .from('rewards')
          .select()
          .eq('user_id', user.id);

      final stats = <String, int>{
        'STR': (statsRes?['str'] as num?)?.toInt() ?? 10,
        'INT': (statsRes?['int'] as num?)?.toInt() ?? 10,
        'AGI': (statsRes?['agi'] as num?)?.toInt() ?? 10,
        'VIT': (statsRes?['vit'] as num?)?.toInt() ?? 10,
        'END': (statsRes?['end'] as num?)?.toInt() ?? 10,
        'SEN': (statsRes?['sen'] as num?)?.toInt() ?? 10,
      };

      state = AsyncValue.data(HunterData(
        uid: user.id,
        username: profileRes['username'] ?? 'Hunter',
        level: (profileRes['level'] as num?)?.toInt() ?? 1,
        xp: (profileRes['xp'] as num?)?.toInt() ?? 0,
        gold: (profileRes['gold'] as num?)?.toInt() ?? 0,
        mana: (profileRes['mana'] as num?)?.toInt() ?? 100,
        maxMana: (profileRes['max_mana'] as num?)?.toInt() ?? 100,
        stats: stats,
        quests: List<Map<String, dynamic>>.from(questsRes),
        bosses: List<Map<String, dynamic>>.from(bossesRes),
        skills: List<Map<String, dynamic>>.from(skillsRes),
        inventory: List<Map<String, dynamic>>.from(inventoryRes),
        achievements: List<Map<String, dynamic>>.from(achievementsRes),
        habits: List<Map<String, dynamic>>.from(habitsRes),
        rewards: List<Map<String, dynamic>>.from(rewardsRes),
      ));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() => load();
}

final hunterDataProvider =
    StateNotifierProvider<HunterNotifier, AsyncValue<HunterData>>((ref) {
  return HunterNotifier();
});