import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/core/helpers.dart';
import 'package:hunter_system_mobile/providers/hunter_provider.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/widgets/hunter_progress_bar.dart';
import 'package:hunter_system_mobile/widgets/stat_tile.dart';
import 'package:hunter_system_mobile/widgets/rank_badge.dart';
import 'package:hunter_system_mobile/features/quests/pages/quests_page.dart';
import 'package:hunter_system_mobile/features/bosses/pages/bosses_page.dart';
import 'package:hunter_system_mobile/features/inventory/pages/inventory_page.dart';
import 'package:hunter_system_mobile/features/rewards/pages/rewards_page.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hunterAsync = ref.watch(hunterDataProvider);

    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      body: hunterAsync.when(
        loading: () => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.flame, size: 48, color: AppTheme.primaryBlue)
                  .animate(onPlay: (c) => c.repeat())
                  .shimmer(duration: 1500.ms, color: AppTheme.neonCyan.withOpacity(0.3)),
              const SizedBox(height: 16),
              Text(
                'LOADING HUNTER DATA...',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.alertTriangle, size: 48, color: AppTheme.dangerRed),
                const SizedBox(height: 16),
                Text(
                  'Connection Error',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.white38),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => ref.read(hunterDataProvider.notifier).refresh(),
                  icon: const Icon(LucideIcons.refreshCw, size: 16),
                  label: const Text('RETRY'),
                ),
              ],
            ),
          ),
        ),
        data: (data) => _buildContent(data),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildContent(HunterData data) {
    final pages = [
      _buildProfileTab(data),
      QuestsPage(quests: data.quests, onRefresh: _refresh),
      BossesPage(bosses: data.bosses, onRefresh: _refresh),
      InventoryPage(inventory: data.inventory, onRefresh: _refresh),
      RewardsPage(rewards: data.rewards, gold: data.gold, onRefresh: _refresh),
    ];

    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      physics: const BouncingScrollPhysics(),
      children: pages,
    );
  }

  Future<void> _refresh() async {
    await ref.read(hunterDataProvider.notifier).refresh();
  }

  Widget _buildProfileTab(HunterData data) {
    final rank = getRank(data.level);
    final title = getTitle(rank);
    final xpNeeded = getXPNeeded(data.level);
    final xpProgress = xpNeeded > 0 ? data.xp / xpNeeded : 0.0;

    return RefreshIndicator(
      onRefresh: _refresh,
      color: AppTheme.primaryBlue,
      backgroundColor: AppTheme.cardDark,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(data).animate().fadeIn(duration: 400.ms).slideX(begin: -0.05),
              const SizedBox(height: 24),

              // Rank Card
              _buildRankCard(data, rank, xpProgress, xpNeeded)
                  .animate()
                  .fadeIn(delay: 150.ms, duration: 400.ms)
                  .scale(begin: const Offset(0.96, 0.96), curve: Curves.easeOutBack),
              const SizedBox(height: 24),

              // Stats Grid
              _buildStatsGrid(data)
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 400.ms),
              const SizedBox(height: 24),

              // Mana bar
              _buildManaSection(data)
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 400.ms),
              const SizedBox(height: 28),

              // Active Quests Preview
              _buildQuestsPreview(data)
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 400.ms)
                  .slideY(begin: 0.05),
              const SizedBox(height: 28),

              // Quick Stats Row
              _buildQuickStats(data)
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 400.ms),
              const SizedBox(height: 24),

              // Logout
              _buildLogoutButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(HunterData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME BACK,',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                  color: AppTheme.primaryBlue.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                data.username.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.4), width: 2),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withOpacity(0.15),
                blurRadius: 20,
                spreadRadius: -5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
            child: Icon(LucideIcons.user, color: AppTheme.primaryBlue.withOpacity(0.7), size: 22),
          ),
        ),
      ],
    );
  }

  Widget _buildRankCard(HunterData data, String rank, double xpProgress, int xpNeeded) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryBlue.withOpacity(0.12),
            AppTheme.neonPurple.withOpacity(0.08),
            AppTheme.cardDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.08),
            blurRadius: 30,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LEVEL',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  Text(
                    data.level.toString().padLeft(2, '0'),
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
              RankBadge(rank: rank),
            ],
          ),
          const SizedBox(height: 20),
          HunterProgressBar(
            value: xpProgress,
            color: AppTheme.primaryBlue,
            height: 8,
            label: 'XP',
            trailingText: '${data.xp} / $xpNeeded',
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(HunterData data) {
    final stats = data.stats;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.95,
      children: [
        StatTile(icon: LucideIcons.swords, label: 'STR', value: stats['STR'] ?? 0, color: const Color(0xFFEF4444)),
        StatTile(icon: LucideIcons.brain, label: 'INT', value: stats['INT'] ?? 0, color: const Color(0xFF3B82F6)),
        StatTile(icon: LucideIcons.zap, label: 'AGI', value: stats['AGI'] ?? 0, color: const Color(0xFFF59E0B)),
        StatTile(icon: LucideIcons.heart, label: 'VIT', value: stats['VIT'] ?? 0, color: const Color(0xFF10B981)),
        StatTile(icon: LucideIcons.shield, label: 'END', value: stats['END'] ?? 0, color: const Color(0xFF8B5CF6)),
        StatTile(icon: LucideIcons.eye, label: 'SEN', value: stats['SEN'] ?? 0, color: const Color(0xFFEC4899)),
      ],
    );
  }

  Widget _buildManaSection(HunterData data) {
    return HunterCard(
      glowColor: AppTheme.neonPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.neonPurple.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(LucideIcons.sparkles, size: 16, color: AppTheme.neonPurple),
              ),
              const SizedBox(width: 10),
              Text(
                'MANA',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: AppTheme.neonPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          HunterProgressBar(
            value: data.maxMana > 0 ? data.mana / data.maxMana : 0,
            color: AppTheme.neonPurple,
            height: 8,
            trailingText: '${data.mana} / ${data.maxMana}',
          ),
        ],
      ),
    );
  }

  Widget _buildQuestsPreview(HunterData data) {
    final activeQuests = data.quests.where((q) => q['completed'] != true && q['failed'] != true).take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ACTIVE QUESTS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppTheme.primaryBlue,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _currentIndex = 1),
              child: Text(
                'VIEW ALL',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.white30,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        if (activeQuests.isEmpty)
          HunterCard(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(LucideIcons.scroll, size: 32, color: Colors.white.withOpacity(0.15)),
                    const SizedBox(height: 12),
                    Text(
                      'No active quests',
                      style: GoogleFonts.outfit(fontSize: 14, color: Colors.white30),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Create quests to level up!',
                      style: GoogleFonts.outfit(fontSize: 12, color: Colors.white12),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          ...activeQuests.map((quest) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildQuestTile(quest),
              )),
      ],
    );
  }

  Widget _buildQuestTile(Map<String, dynamic> quest) {
    final type = (quest['type'] ?? 'DAILY').toString();
    final typeColor = AppTheme.questTypeColor(type);
    final difficulty = (quest['difficulty'] ?? 'E').toString();
    final diffColor = AppTheme.difficultyColor(difficulty);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: typeColor.withOpacity(0.4),
                  blurRadius: 6,
                  spreadRadius: -1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quest['title'] ?? 'Untitled Quest',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: typeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        type,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: typeColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: diffColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '$difficulty-RANK',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: diffColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(LucideIcons.coins, size: 12, color: AppTheme.goldAccent.withOpacity(0.6)),
                    const SizedBox(width: 3),
                    Text(
                      '${quest['gold_reward'] ?? 0}',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.goldAccent.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(HunterData data) {
    return Row(
      children: [
        Expanded(
          child: _buildQuickStatCard(
            icon: LucideIcons.coins,
            label: 'GOLD',
            value: data.gold.toString(),
            color: AppTheme.goldAccent,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildQuickStatCard(
            icon: LucideIcons.trophy,
            label: 'ACHIEVEMENTS',
            value: data.achievements.where((a) => a['unlocked'] == true).length.toString(),
            color: AppTheme.neonPurple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildQuickStatCard(
            icon: LucideIcons.target,
            label: 'COMPLETED',
            value: data.quests.where((q) => q['completed'] == true).length.toString(),
            color: AppTheme.sRankGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: color.withOpacity(0.7)),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white24,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: TextButton.icon(
        onPressed: () async {
          await SupabaseService.client.auth.signOut();
        },
        icon: const Icon(LucideIcons.logOut, size: 16, color: AppTheme.dangerRed),
        label: Text(
          'SIGN OUT',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: AppTheme.dangerRed.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkNavy,
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.06))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, LucideIcons.layoutGrid, 'Profile'),
              _buildNavItem(1, LucideIcons.scroll, 'Quests'),
              _buildNavItem(2, LucideIcons.shield, 'Bosses'),
              _buildNavItem(3, LucideIcons.backpack, 'Inventory'),
              _buildNavItem(4, LucideIcons.shoppingCart, 'Shop'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryBlue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? AppTheme.primaryBlue : Colors.white24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 9,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.5,
                color: isActive ? AppTheme.primaryBlue : Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
