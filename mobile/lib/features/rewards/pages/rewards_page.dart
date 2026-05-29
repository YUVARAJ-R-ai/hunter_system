import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';

class RewardsPage extends StatelessWidget {
  final List<Map<String, dynamic>> rewards;
  final int gold;
  final VoidCallback onRefresh;

  const RewardsPage({
    super.key,
    required this.rewards,
    required this.gold,
    required this.onRefresh,
  });

  Future<void> _purchaseReward(BuildContext context, Map<String, dynamic> reward) async {
    final cost = (reward['cost'] as num?)?.toInt() ?? 0;
    if (gold < cost) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(LucideIcons.alertCircle, color: AppTheme.goldAccent, size: 18),
                const SizedBox(width: 12),
                const Text('Not enough gold!'),
              ],
            ),
            backgroundColor: AppTheme.cardDark,
          ),
        );
      }
      return;
    }

    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      // Deduct gold
      await SupabaseService.client
          .from('users')
          .update({'gold': gold - cost})
          .eq('id', user.id);

      // Mark purchased
      await SupabaseService.client
          .from('rewards')
          .update({'purchased': true})
          .eq('id', reward['id'])
          .eq('user_id', user.id);

      onRefresh();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(LucideIcons.shoppingCart, color: AppTheme.sRankGreen, size: 18),
                const SizedBox(width: 12),
                Text('Purchased: ${reward['name']}!'),
              ],
            ),
            backgroundColor: AppTheme.cardDark,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error purchasing reward: $e');
    }
  }

  void _showCreateRewardDialog(BuildContext context) {
    final nameController = TextEditingController();
    final costController = TextEditingController(text: '100');
    final descController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(ctx).viewInsets.bottom + 24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(top: BorderSide(color: AppTheme.goldAccent.withOpacity(0.3))),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(2)))),
              const SizedBox(height: 20),
              Text('NEW REWARD', style: GoogleFonts.spaceGrotesk(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2, color: AppTheme.goldAccent)),
              const SizedBox(height: 20),
              TextField(controller: nameController, style: GoogleFonts.outfit(color: Colors.white), decoration: const InputDecoration(labelText: 'REWARD NAME', hintText: '1 Hour Gaming')),
              const SizedBox(height: 16),
              TextField(controller: costController, keyboardType: TextInputType.number, style: GoogleFonts.outfit(color: Colors.white), decoration: const InputDecoration(labelText: 'COST (GOLD)', hintText: '100')),
              const SizedBox(height: 16),
              TextField(controller: descController, style: GoogleFonts.outfit(color: Colors.white), decoration: const InputDecoration(labelText: 'DESCRIPTION', hintText: 'A well-deserved reward')),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldAccent, foregroundColor: Colors.black),
                  onPressed: () async {
                    if (nameController.text.trim().isEmpty) return;
                    final user = SupabaseService.client.auth.currentUser;
                    if (user == null) return;
                    try {
                      await SupabaseService.client.from('rewards').insert({
                        'user_id': user.id,
                        'name': nameController.text.trim(),
                        'cost': int.tryParse(costController.text) ?? 100,
                        'description': descController.text.trim(),
                        'purchased': false,
                      });
                      onRefresh();
                      if (ctx.mounted) Navigator.pop(ctx);
                    } catch (e) {
                      debugPrint('Error creating reward: $e');
                    }
                  },
                  child: Text('ADD REWARD', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w800, letterSpacing: 2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final available = rewards.where((r) => r['purchased'] != true).toList();
    final purchased = rewards.where((r) => r['purchased'] == true).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ITEM SHOP', style: GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
                GestureDetector(
                  onTap: () => _showCreateRewardDialog(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.goldAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.goldAccent.withOpacity(0.3)),
                    ),
                    child: const Icon(LucideIcons.plus, size: 20, color: AppTheme.goldAccent),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Gold balance
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.goldAccent.withOpacity(0.08), AppTheme.cardDark],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.goldAccent.withOpacity(0.15)),
              ),
              child: Row(
                children: [
                  Icon(LucideIcons.coins, size: 22, color: AppTheme.goldAccent.withOpacity(0.8)),
                  const SizedBox(width: 10),
                  Text(
                    gold.toString(),
                    style: GoogleFonts.spaceGrotesk(fontSize: 22, fontWeight: FontWeight.w900, color: AppTheme.goldAccent),
                  ),
                  const SizedBox(width: 6),
                  Text('GOLD', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 2, color: AppTheme.goldAccent.withOpacity(0.5))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: rewards.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.shoppingCart, size: 48, color: Colors.white.withOpacity(0.1)),
                        const SizedBox(height: 16),
                        Text('No rewards yet', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white30)),
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    children: [
                      if (available.isNotEmpty) ...[
                        ...available.asMap().entries.map((entry) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _buildRewardCard(context, entry.value)
                                .animate()
                                .fadeIn(delay: Duration(milliseconds: 80 * entry.key), duration: 300.ms),
                          ),
                        ),
                      ],
                      if (purchased.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text('PURCHASED', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3, color: Colors.white24)),
                        const SizedBox(height: 12),
                        ...purchased.map((r) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _buildPurchasedCard(r),
                        )),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
    final cost = (reward['cost'] as num?)?.toInt() ?? 0;
    final canAfford = gold >= cost;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.goldAccent.withOpacity(canAfford ? 0.15 : 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.goldAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(LucideIcons.gift, size: 20, color: AppTheme.goldAccent.withOpacity(0.7)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reward['name'] ?? 'Reward', style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                if (reward['description'] != null) ...[
                  const SizedBox(height: 2),
                  Text(reward['description'], style: GoogleFonts.outfit(fontSize: 11, color: Colors.white24), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(LucideIcons.coins, size: 12, color: AppTheme.goldAccent.withOpacity(0.6)),
                    const SizedBox(width: 4),
                    Text(cost.toString(), style: GoogleFonts.spaceGrotesk(fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.goldAccent)),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: canAfford ? () => _purchaseReward(context, reward) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: canAfford ? AppTheme.goldAccent.withOpacity(0.15) : Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: canAfford ? AppTheme.goldAccent.withOpacity(0.3) : Colors.white10),
              ),
              child: Text(
                'BUY',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: canAfford ? AppTheme.goldAccent : Colors.white12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchasedCard(Map<String, dynamic> reward) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.gift, size: 16, color: Colors.white.withOpacity(0.15)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(reward['name'] ?? 'Reward', style: GoogleFonts.outfit(fontSize: 13, color: Colors.white24)),
          ),
          const Icon(LucideIcons.checkCircle2, size: 16, color: AppTheme.sRankGreen),
        ],
      ),
    );
  }
}
