import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';

class InventoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> inventory;
  final VoidCallback onRefresh;

  const InventoryPage({super.key, required this.inventory, required this.onRefresh});

  Color _rarityColor(String rarity) {
    switch (rarity) {
      case 'Common': return Colors.white54;
      case 'Rare': return const Color(0xFF3B82F6);
      case 'Epic': return AppTheme.neonPurple;
      case 'Legendary': return AppTheme.goldAccent;
      default: return Colors.white54;
    }
  }

  IconData _typeIcon(String type) {
    switch (type) {
      case 'Weapon': return LucideIcons.swords;
      case 'Armor': return LucideIcons.shield;
      case 'Consumable': return LucideIcons.flaskConical;
      case 'Rune': return LucideIcons.sparkles;
      case 'Artifact': return LucideIcons.gem;
      default: return LucideIcons.package;
    }
  }

  Future<void> _toggleEquip(String itemId, bool currentlyEquipped) async {
    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      await SupabaseService.client
          .from('inventory_items')
          .update({'equipped': !currentlyEquipped})
          .eq('id', itemId)
          .eq('user_id', user.id);

      onRefresh();
    } catch (e) {
      debugPrint('Error toggling equip: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final equipped = inventory.where((i) => i['equipped'] == true).toList();
    final unequipped = inventory.where((i) => i['equipped'] != true).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('INVENTORY', style: GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${inventory.length} ITEMS',
                    style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 2, color: Colors.white30),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: inventory.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.backpack, size: 48, color: Colors.white.withOpacity(0.1)),
                        const SizedBox(height: 16),
                        Text('Inventory empty', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white30)),
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    children: [
                      if (equipped.isNotEmpty) ...[
                        Text('EQUIPPED', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3, color: AppTheme.sRankGreen)),
                        const SizedBox(height: 12),
                        ...equipped.asMap().entries.map((entry) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _buildItemCard(entry.value, true)
                                .animate()
                                .fadeIn(delay: Duration(milliseconds: 80 * entry.key), duration: 300.ms),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (unequipped.isNotEmpty) ...[
                        Text('BACKPACK', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3, color: Colors.white24)),
                        const SizedBox(height: 12),
                        ...unequipped.asMap().entries.map((entry) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _buildItemCard(entry.value, false)
                                .animate()
                                .fadeIn(delay: Duration(milliseconds: 80 * entry.key), duration: 300.ms),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item, bool isEquipped) {
    final rarity = (item['rarity'] ?? 'Common').toString();
    final type = (item['type'] ?? 'Artifact').toString();
    final rarityCol = _rarityColor(rarity);

    return GestureDetector(
      onTap: () => _toggleEquip(item['id'], isEquipped),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isEquipped ? AppTheme.sRankGreen.withOpacity(0.3) : rarityCol.withOpacity(0.12),
          ),
          boxShadow: isEquipped
              ? [BoxShadow(color: AppTheme.sRankGreen.withOpacity(0.05), blurRadius: 10)]
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: rarityCol.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(_typeIcon(type), size: 20, color: rarityCol),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] ?? 'Unknown Item',
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: rarityCol.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          rarity.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 1, color: rarityCol),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        type,
                        style: GoogleFonts.outfit(fontSize: 11, color: Colors.white30),
                      ),
                    ],
                  ),
                  if (item['description'] != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item['description'],
                      style: GoogleFonts.outfit(fontSize: 11, color: Colors.white24),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              isEquipped ? LucideIcons.shieldCheck : LucideIcons.shieldOff,
              size: 18,
              color: isEquipped ? AppTheme.sRankGreen : Colors.white12,
            ),
          ],
        ),
      ),
    );
  }
}
