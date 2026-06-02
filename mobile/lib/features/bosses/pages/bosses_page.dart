import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/widgets/hunter_progress_bar.dart';

class BossesPage extends StatelessWidget {
  final List<Map<String, dynamic>> bosses;
  final VoidCallback onRefresh;

  const BossesPage({super.key, required this.bosses, required this.onRefresh});

  Future<void> _dealDamage(BuildContext context, String bossId, int damage) async {
    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      final boss = bosses.firstWhere((b) => b['id'] == bossId, orElse: () => {});
      final currentHP = (boss['current_hp'] as num?)?.toInt() ?? 0;
      final newHP = (currentHP - damage).clamp(0, 999999);
      final defeated = newHP <= 0;

      await SupabaseService.client
          .from('bosses')
          .update({'current_hp': newHP, 'defeated': defeated})
          .eq('id', bossId)
          .eq('user_id', user.id);

      if (defeated) {
        final xpReward = (boss['xp_reward'] as num?)?.toInt() ?? 0;
        if (xpReward > 0) {
          final profile = await SupabaseService.client
              .from('users')
              .select('xp, gold, level')
              .eq('id', user.id)
              .single();
          int newXp = ((profile['xp'] as num?)?.toInt() ?? 0) + xpReward;
          int level = (profile['level'] as num?)?.toInt() ?? 1;
          int xpNeeded = level * 200;
          while (newXp >= xpNeeded) {
            newXp -= xpNeeded;
            level++;
            xpNeeded = level * 200;
          }
          await SupabaseService.client
              .from('users')
              .update({'xp': newXp, 'level': level})
              .eq('id', user.id);
        }
      }

      onRefresh();

      if (context.mounted && defeated) {
        _showAriseDialog(context, boss);
      }
    } catch (e) {
      debugPrint('Error dealing damage: $e');
    }
  }

  void _showAriseDialog(BuildContext context, Map<String, dynamic> boss) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _AriseDialog(boss: boss, onRefresh: onRefresh);
      },
    );
  }

  void _showCreateBossDialog(BuildContext context) {
    final nameController = TextEditingController();
    final hpController = TextEditingController(text: '100');
    String selectedDifficulty = 'D';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) {
          return Container(
            padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(ctx).viewInsets.bottom + 24),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              border: Border(top: BorderSide(color: AppTheme.dangerRed.withOpacity(0.3))),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(2))),
                  ),
                  const SizedBox(height: 20),
                  Text('NEW BOSS', style: GoogleFonts.spaceGrotesk(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2, color: AppTheme.dangerRed)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    style: GoogleFonts.outfit(color: Colors.white),
                    decoration: const InputDecoration(labelText: 'BOSS NAME', hintText: 'Igris, the Bloodred'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: hpController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.outfit(color: Colors.white),
                    decoration: const InputDecoration(labelText: 'TOTAL HP', hintText: '100'),
                  ),
                  const SizedBox(height: 16),
                  Text('DIFFICULTY', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 2, color: Colors.white30)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['E', 'D', 'C', 'B', 'A', 'S'].map((d) {
                      final isSelected = selectedDifficulty == d;
                      final color = AppTheme.difficultyColor(d);
                      return GestureDetector(
                        onTap: () => setModalState(() => selectedDifficulty = d),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? color.withOpacity(0.2) : Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: isSelected ? color : Colors.white10),
                          ),
                          child: Text(d, style: GoogleFonts.spaceGrotesk(fontSize: 12, fontWeight: FontWeight.w700, color: isSelected ? color : Colors.white38)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.dangerRed),
                      onPressed: () async {
                        if (nameController.text.trim().isEmpty) return;
                        final user = SupabaseService.client.auth.currentUser;
                        if (user == null) return;
                        final hp = int.tryParse(hpController.text) ?? 100;
                        final mult = {'E': 1, 'D': 2, 'C': 3, 'B': 4, 'A': 5, 'S': 8}[selectedDifficulty] ?? 1;
                        try {
                          await SupabaseService.client.from('bosses').insert({
                            'user_id': user.id,
                            'name': nameController.text.trim(),
                            'category': 'WORK',
                            'total_hp': hp,
                            'current_hp': hp,
                            'xp_reward': 100 * mult,
                            'difficulty': selectedDifficulty,
                            'defeated': false,
                          });
                          onRefresh();
                          if (ctx.mounted) Navigator.pop(ctx);
                        } catch (e) {
                          debugPrint('Error creating boss: $e');
                        }
                      },
                      child: Text('SUMMON BOSS', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w800, letterSpacing: 2)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeBosses = bosses.where((b) => b['defeated'] != true).toList();
    final defeatedBosses = bosses.where((b) => b['defeated'] == true).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('BOSS RAIDS', style: GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
                GestureDetector(
                  onTap: () => _showCreateBossDialog(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.dangerRed.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.dangerRed.withOpacity(0.3)),
                    ),
                    child: const Icon(LucideIcons.plus, size: 20, color: AppTheme.dangerRed),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: bosses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.shield, size: 48, color: Colors.white.withOpacity(0.1)),
                        const SizedBox(height: 16),
                        Text('No bosses yet', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white30)),
                        const SizedBox(height: 6),
                        Text('Summon a boss to start raiding!', style: GoogleFonts.outfit(fontSize: 12, color: Colors.white12)),
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    children: [
                      if (activeBosses.isNotEmpty) ...[
                        ...activeBosses.asMap().entries.map((entry) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildBossCard(context, entry.value)
                                .animate()
                                .fadeIn(delay: Duration(milliseconds: 100 * entry.key), duration: 400.ms)
                                .slideY(begin: 0.05),
                          ),
                        ),
                      ],
                      if (defeatedBosses.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text('DEFEATED', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3, color: Colors.white24)),
                        const SizedBox(height: 12),
                        ...defeatedBosses.map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _buildDefeatedBossCard(b),
                        )),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBossCard(BuildContext context, Map<String, dynamic> boss) {
    final totalHP = (boss['total_hp'] as num?)?.toInt() ?? 100;
    final currentHP = (boss['current_hp'] as num?)?.toInt() ?? totalHP;
    final hpPercent = totalHP > 0 ? currentHP / totalHP : 0.0;
    final difficulty = (boss['difficulty'] ?? 'E').toString();
    final diffColor = AppTheme.difficultyColor(difficulty);
    final xpReward = (boss['xp_reward'] as num?)?.toInt() ?? 0;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.dangerRed.withOpacity(0.08),
            AppTheme.cardDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.dangerRed.withOpacity(0.15)),
        boxShadow: [
          BoxShadow(color: AppTheme.dangerRed.withOpacity(0.05), blurRadius: 20, spreadRadius: -5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.dangerRed.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(LucideIcons.skull, size: 22, color: AppTheme.dangerRed),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      boss['name'] ?? 'Unknown Boss',
                      style: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: diffColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('$difficulty-RANK', style: GoogleFonts.spaceGrotesk(fontSize: 9, fontWeight: FontWeight.w700, color: diffColor, letterSpacing: 1)),
                        ),
                        const SizedBox(width: 8),
                        Icon(LucideIcons.zap, size: 10, color: AppTheme.primaryBlue.withOpacity(0.5)),
                        const SizedBox(width: 2),
                        Text('$xpReward XP', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.primaryBlue.withOpacity(0.5))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          HunterProgressBar(
            value: hpPercent,
            color: hpPercent > 0.5 ? AppTheme.sRankGreen : hpPercent > 0.25 ? AppTheme.goldAccent : AppTheme.dangerRed,
            height: 10,
            label: 'HP',
            trailingText: '$currentHP / $totalHP',
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              for (final dmg in [1, 5, 10, 25])
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: dmg == 25 ? 0 : 6),
                    child: GestureDetector(
                      onTap: () => _dealDamage(context, boss['id'], dmg),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: AppTheme.dangerRed.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.dangerRed.withOpacity(0.2)),
                        ),
                        child: Center(
                          child: Text(
                            '-$dmg',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.dangerRed,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefeatedBossCard(Map<String, dynamic> boss) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.skull, size: 18, color: Colors.white.withOpacity(0.15)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              boss['name'] ?? 'Unknown',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.white30, decoration: TextDecoration.lineThrough),
            ),
          ),
          const Icon(LucideIcons.checkCircle2, size: 18, color: AppTheme.sRankGreen),
        ],
      ),
    );
  }
}

class _AriseDialog extends StatefulWidget {
  final Map<String, dynamic> boss;
  final VoidCallback onRefresh;

  const _AriseDialog({required this.boss, required this.onRefresh});

  @override
  State<_AriseDialog> createState() => _AriseDialogState();
}

class _AriseDialogState extends State<_AriseDialog> {
  late TextEditingController _nameController;
  int _attempts = 3;
  String _status = 'idle'; // 'idle', 'extracting', 'success', 'fail'

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.boss['name'] ?? 'Shadow');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _extract() async {
    if (_attempts <= 0) return;
    setState(() {
      _status = 'extracting';
    });

    // Simulate the dramatic extraction delay
    await Future.delayed(const Duration(milliseconds: 1500));

    // 70% success chance
    final isSuccess = (DateTime.now().millisecond % 100) < 70;

    if (isSuccess) {
      try {
        final client = SupabaseService.client;
        final user = client.auth.currentUser;
        if (user != null) {
          await client.rpc('extract_shadow', params: {
            'boss_id': widget.boss['id'],
            'shadow_name': _nameController.text.trim().isNotEmpty
                ? _nameController.text.trim()
                : (widget.boss['name'] ?? 'Shadow'),
          });
        }
        setState(() {
          _status = 'success';
        });
        widget.onRefresh();
      } catch (e) {
        setState(() {
          _status = 'fail';
          _attempts--;
        });
      }
    } else {
      setState(() {
        _status = 'fail';
        _attempts--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w900,
      letterSpacing: 2,
      color: AppTheme.neonPurple,
    );

    return PopScope(
      canPop: _status != 'extracting',
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF0A0518),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.neonPurple.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: AppTheme.neonPurple.withOpacity(0.15),
                blurRadius: 30,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.neonPurple.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.flame, size: 32, color: AppTheme.neonPurple)
                    .animate(onPlay: (c) => c.repeat())
                    .shimmer(duration: 1500.ms),
              ),
              const SizedBox(height: 16),

              Text('SHADOW EXTRACTION', style: titleStyle),
              Text(
                'TARGET: ${(widget.boss['name'] ?? 'Unknown').toString().toUpperCase()}',
                style: GoogleFonts.outfit(fontSize: 11, color: Colors.white30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              if (_status == 'idle') ...[
                Text(
                  '"A shadow presence lingers. Command the shadow to \'Arise\' to bind it to your army."',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white70, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  style: GoogleFonts.outfit(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'NAME YOUR SHADOW',
                    hintText: 'e.g. Igris',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'ATTEMPTS REMAINING: $_attempts / 3',
                  style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.neonPurple),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.neonPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _extract,
                    child: Text('ARISE...', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w900, letterSpacing: 2)),
                  ),
                ),
              ],

              if (_status == 'extracting') ...[
                const SizedBox(height: 20),
                const CircularProgressIndicator(color: AppTheme.neonPurple),
                const SizedBox(height: 20),
                Text(
                  '" A R I S E . . . "',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.neonPurple,
                    letterSpacing: 4,
                  ),
                ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1000.ms),
                const SizedBox(height: 8),
                Text('Extracting shadow, please hold concentration...', style: GoogleFonts.outfit(fontSize: 11, color: Colors.white38)),
              ],

              if (_status == 'success') ...[
                Text(
                  '"The shadow has accepted your call. It is now bound to your Monarch Army."',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white70, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _nameController.text.toUpperCase(),
                        style: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primaryBlue),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Bound to Monarch Army',
                        style: GoogleFonts.spaceGrotesk(fontSize: 9, color: AppTheme.neonPurple, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),
                    onPressed: () => Navigator.pop(context),
                    child: Text('CLOSE GATE', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w800, letterSpacing: 2)),
                  ),
                ),
              ],

              if (_status == 'fail') ...[
                Text(
                  _attempts > 0
                      ? 'The shadow resists your command. Do you wish to try again?'
                      : 'The shadow has dissolved into the darkness. The extraction is lost.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                if (_attempts > 0) ...[
                  Text(
                    'ATTEMPTS REMAINING: $_attempts / 3',
                    style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.neonPurple),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.neonPurple),
                          onPressed: () => setState(() => _status = 'idle'),
                          child: Text('TRY AGAIN', style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('GIVE UP', style: GoogleFonts.spaceGrotesk(fontSize: 11, color: Colors.white38)),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.dangerRed),
                      onPressed: () => Navigator.pop(context),
                      child: Text('CLOSE GATE', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w800, letterSpacing: 2)),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

