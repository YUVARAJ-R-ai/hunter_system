import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/services/supabase_service.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';

class QuestsPage extends StatefulWidget {
  final List<Map<String, dynamic>> quests;
  final VoidCallback onRefresh;

  const QuestsPage({super.key, required this.quests, required this.onRefresh});

  @override
  State<QuestsPage> createState() => _QuestsPageState();
}

class _QuestsPageState extends State<QuestsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _filterType = 'ALL';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredQuests {
    List<Map<String, dynamic>> quests;
    switch (_tabController.index) {
      case 0: // Active
        quests = widget.quests.where((q) => q['completed'] != true && q['failed'] != true).toList();
        break;
      case 1: // Completed
        quests = widget.quests.where((q) => q['completed'] == true).toList();
        break;
      case 2: // Failed
        quests = widget.quests.where((q) => q['failed'] == true).toList();
        break;
      default:
        quests = widget.quests;
    }

    if (_filterType != 'ALL') {
      quests = quests.where((q) => q['type'] == _filterType).toList();
    }
    return quests;
  }

  Future<void> _completeQuest(String id) async {
    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      // Mark quest completed
      await SupabaseService.client
          .from('quests')
          .update({'completed': true})
          .eq('id', id)
          .eq('user_id', user.id);

      // Get quest for XP reward
      final quest = widget.quests.firstWhere((q) => q['id'] == id, orElse: () => {});
      final xpReward = (quest['xp_reward'] as num?)?.toInt() ?? 0;
      final goldReward = (quest['gold_reward'] as num?)?.toInt() ?? 0;

      if (xpReward > 0 || goldReward > 0) {
        // Update user XP and gold
        final profile = await SupabaseService.client
            .from('users')
            .select('xp, gold, level')
            .eq('id', user.id)
            .single();

        int newXp = ((profile['xp'] as num?)?.toInt() ?? 0) + xpReward;
        int newGold = ((profile['gold'] as num?)?.toInt() ?? 0) + goldReward;
        int level = (profile['level'] as num?)?.toInt() ?? 1;
        int xpNeeded = level * 200;

        while (newXp >= xpNeeded) {
          newXp -= xpNeeded;
          level++;
          xpNeeded = level * 200;
        }

        await SupabaseService.client
            .from('users')
            .update({'xp': newXp, 'gold': newGold, 'level': level})
            .eq('id', user.id);
      }

      widget.onRefresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(LucideIcons.checkCircle, color: AppTheme.sRankGreen, size: 18),
                const SizedBox(width: 12),
                Text('Quest Complete! +${xpReward}XP +${goldReward}G'),
              ],
            ),
            backgroundColor: AppTheme.cardDark,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error completing quest: $e');
    }
  }

  Future<void> _failQuest(String id) async {
    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      await SupabaseService.client
          .from('quests')
          .update({'failed': true})
          .eq('id', id)
          .eq('user_id', user.id);

      widget.onRefresh();
    } catch (e) {
      debugPrint('Error failing quest: $e');
    }
  }

  Future<void> _deleteQuest(String id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        title: Text('Delete Quest?', style: GoogleFonts.spaceGrotesk(color: Colors.white)),
        content: Text('This action cannot be undone.', style: GoogleFonts.outfit(color: Colors.white54)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete', style: TextStyle(color: AppTheme.dangerRed)),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    try {
      final user = SupabaseService.client.auth.currentUser;
      if (user == null) return;

      await SupabaseService.client
          .from('quests')
          .delete()
          .eq('id', id)
          .eq('user_id', user.id);

      widget.onRefresh();
    } catch (e) {
      debugPrint('Error deleting quest: $e');
    }
  }

  void _showCreateQuestDialog() {
    final titleController = TextEditingController();
    String selectedType = 'DAILY';
    String selectedDifficulty = 'E';
    String selectedCategory = 'WORK';

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
              border: Border(top: BorderSide(color: AppTheme.primaryBlue.withOpacity(0.3))),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'NEW QUEST',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  TextField(
                    controller: titleController,
                    style: GoogleFonts.outfit(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'QUEST TITLE',
                      hintText: 'What must be done?',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Type chips
                  Text('TYPE', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 2, color: Colors.white30)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['DAILY', 'MAIN', 'SIDE'].map((t) {
                      final isSelected = selectedType == t;
                      final color = AppTheme.questTypeColor(t);
                      return GestureDetector(
                        onTap: () => setModalState(() => selectedType = t),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? color.withOpacity(0.2) : Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: isSelected ? color : Colors.white10),
                          ),
                          child: Text(
                            t,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: isSelected ? color : Colors.white38,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Difficulty chips
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
                          child: Text(
                            d,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isSelected ? color : Colors.white38,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Category chips
                  Text('CATEGORY', style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 2, color: Colors.white30)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['FITNESS', 'STUDY', 'WORK', 'HEALTH', 'SOCIAL', 'CREATIVITY'].map((c) {
                      final isSelected = selectedCategory == c;
                      final color = AppTheme.categoryColor(c);
                      return GestureDetector(
                        onTap: () => setModalState(() => selectedCategory = c),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? color.withOpacity(0.15) : Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: isSelected ? color.withOpacity(0.5) : Colors.white10),
                          ),
                          child: Text(
                            c,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: isSelected ? color : Colors.white38,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Submit
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (titleController.text.trim().isEmpty) return;
                        final user = SupabaseService.client.auth.currentUser;
                        if (user == null) return;

                        // Calculate rewards based on difficulty
                        final difficultyMultiplier = {'E': 1, 'D': 2, 'C': 3, 'B': 4, 'A': 5, 'S': 8};
                        final mult = difficultyMultiplier[selectedDifficulty] ?? 1;

                        try {
                          await SupabaseService.client.from('quests').insert({
                            'user_id': user.id,
                            'title': titleController.text.trim(),
                            'type': selectedType,
                            'difficulty': selectedDifficulty,
                            'category': selectedCategory,
                            'xp_reward': 50 * mult,
                            'gold_reward': 25 * mult,
                            'stat_boost_stat': 'STR',
                            'stat_boost_amount': mult,
                            'has_deadline': false,
                            'completed': false,
                            'failed': false,
                            'is_important': false,
                            'is_my_day': false,
                          });
                          widget.onRefresh();
                          if (ctx.mounted) Navigator.pop(ctx);
                        } catch (e) {
                          debugPrint('Error creating quest: $e');
                        }
                      },
                      child: Text(
                        'CREATE QUEST',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
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
    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'QUESTS',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: _showCreateQuestDialog,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
                    ),
                    child: const Icon(LucideIcons.plus, size: 20, color: AppTheme.primaryBlue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              onTap: (_) => setState(() {}),
              indicator: BoxDecoration(
                color: AppTheme.primaryBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white38,
              labelStyle: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1),
              unselectedLabelStyle: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w500),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              tabs: [
                Tab(text: 'ACTIVE (${widget.quests.where((q) => q['completed'] != true && q['failed'] != true).length})'),
                Tab(text: 'DONE (${widget.quests.where((q) => q['completed'] == true).length})'),
                Tab(text: 'FAILED (${widget.quests.where((q) => q['failed'] == true).length})'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Filter chips
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: ['ALL', 'DAILY', 'MAIN', 'SIDE', 'PENALTY'].map((type) {
                final isSelected = _filterType == type;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _filterType = type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (type == 'ALL' ? AppTheme.primaryBlue : AppTheme.questTypeColor(type)).withOpacity(0.15)
                            : Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? (type == 'ALL' ? AppTheme.primaryBlue : AppTheme.questTypeColor(type)).withOpacity(0.3)
                              : Colors.white10,
                        ),
                      ),
                      child: Text(
                        type,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: isSelected
                              ? (type == 'ALL' ? AppTheme.primaryBlue : AppTheme.questTypeColor(type))
                              : Colors.white30,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Quest list
          Expanded(
            child: _filteredQuests.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.scroll, size: 48, color: Colors.white.withOpacity(0.1)),
                        const SizedBox(height: 16),
                        Text(
                          'No quests found',
                          style: GoogleFonts.outfit(fontSize: 16, color: Colors.white30),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: _filteredQuests.length,
                    itemBuilder: (context, index) {
                      final quest = _filteredQuests[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _buildQuestItem(quest)
                            .animate()
                            .fadeIn(delay: Duration(milliseconds: 50 * index), duration: 300.ms)
                            .slideX(begin: 0.05),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestItem(Map<String, dynamic> quest) {
    final type = (quest['type'] ?? 'DAILY').toString();
    final difficulty = (quest['difficulty'] ?? 'E').toString();
    final typeColor = AppTheme.questTypeColor(type);
    final diffColor = AppTheme.difficultyColor(difficulty);
    final isCompleted = quest['completed'] == true;
    final isFailed = quest['failed'] == true;
    final xpReward = (quest['xp_reward'] as num?)?.toInt() ?? 0;
    final goldReward = (quest['gold_reward'] as num?)?.toInt() ?? 0;

    return Dismissible(
      key: Key(quest['id'].toString()),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: AppTheme.sRankGreen.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(LucideIcons.check, color: AppTheme.sRankGreen),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppTheme.dangerRed.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(LucideIcons.trash2, color: AppTheme.dangerRed),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd && !isCompleted && !isFailed) {
          await _completeQuest(quest['id']);
          return false;
        } else if (direction == DismissDirection.endToStart) {
          await _deleteQuest(quest['id']);
          return false;
        }
        return false;
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCompleted
                ? AppTheme.sRankGreen.withOpacity(0.2)
                : isFailed
                    ? AppTheme.dangerRed.withOpacity(0.2)
                    : Colors.white.withOpacity(0.06),
          ),
        ),
        child: Row(
          children: [
            // Type indicator
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppTheme.sRankGreen
                    : isFailed
                        ? AppTheme.dangerRed
                        : typeColor,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: (isCompleted ? AppTheme.sRankGreen : isFailed ? AppTheme.dangerRed : typeColor)
                        .withOpacity(0.4),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest['title'] ?? 'Untitled',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isCompleted || isFailed ? Colors.white38 : Colors.white,
                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildTag(type, typeColor),
                      const SizedBox(width: 6),
                      _buildTag('$difficulty-RANK', diffColor),
                      const Spacer(),
                      Icon(LucideIcons.zap, size: 10, color: AppTheme.primaryBlue.withOpacity(0.5)),
                      const SizedBox(width: 2),
                      Text(
                        '$xpReward',
                        style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.primaryBlue.withOpacity(0.5)),
                      ),
                      const SizedBox(width: 8),
                      Icon(LucideIcons.coins, size: 10, color: AppTheme.goldAccent.withOpacity(0.5)),
                      const SizedBox(width: 2),
                      Text(
                        '$goldReward',
                        style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.goldAccent.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Actions
            if (!isCompleted && !isFailed) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _completeQuest(quest['id']),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.sRankGreen.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.sRankGreen.withOpacity(0.3)),
                  ),
                  child: const Icon(LucideIcons.check, size: 14, color: AppTheme.sRankGreen),
                ),
              ),
            ],
            if (isCompleted)
              const Icon(LucideIcons.checkCircle2, size: 20, color: AppTheme.sRankGreen),
            if (isFailed)
              const Icon(LucideIcons.xCircle, size: 20, color: AppTheme.dangerRed),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: color,
        ),
      ),
    );
  }
}
