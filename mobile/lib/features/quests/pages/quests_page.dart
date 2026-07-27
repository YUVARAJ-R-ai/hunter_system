import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/providers/hunter_provider.dart';

class QuestsPage extends ConsumerStatefulWidget {
  final List<Map<String, dynamic>> quests;

  const QuestsPage({super.key, required this.quests});

  @override
  ConsumerState<QuestsPage> createState() => _QuestsPageState();
}

class _QuestsPageState extends ConsumerState<QuestsPage> with SingleTickerProviderStateMixin {
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
      final reward =
          await ref.read(hunterDataProvider.notifier).completeQuest(id);
      if (mounted && ((reward['xp'] ?? 0) > 0 || (reward['gold'] ?? 0) > 0)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(LucideIcons.checkCircle, color: AppTheme.sRankGreen, size: 18),
                const SizedBox(width: 12),
                Text('Quest Complete! +${reward['xp']}XP +${reward['gold']}G'),
              ],
            ),
            backgroundColor: AppTheme.cardDark,
          ),
        );
      }
    } catch (e) {
      _showError('Could not complete quest', e);
    }
  }

  void _showError(String message, Object error) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message: $error'),
        backgroundColor: AppTheme.dangerRed,
      ),
    );
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
      await ref.read(hunterDataProvider.notifier).deleteQuest(id);
    } catch (e) {
      _showError('Could not delete quest', e);
    }
  }

  Widget _pickerChip({
    required String label,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
    double fontSize = 11,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? color : Colors.white10),
        ),
        child: Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: isSelected ? color : Colors.white38,
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: Colors.white30,
        ),
      );

  /// Unified create/edit sheet. Pass [existing] to edit a quest, or null to
  /// create a new one. Tapping a quest in the list opens this in edit mode.
  void _showQuestSheet({Map<String, dynamic>? existing}) {
    final isEditing = existing != null;
    final titleController =
        TextEditingController(text: (existing?['title'] ?? '').toString());
    String selectedType = (existing?['type'] ?? 'DAILY').toString();
    String selectedDifficulty = (existing?['difficulty'] ?? 'E').toString();
    String selectedCategory = (existing?['category'] ?? 'WORK').toString();
    bool isImportant = existing?['is_important'] == true;

    final isCompleted = existing?['completed'] == true;
    final isFailed = existing?['failed'] == true;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEditing ? 'EDIT QUEST' : 'NEW QUEST',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                      // Important toggle (star)
                      GestureDetector(
                        onTap: () => setModalState(() => isImportant = !isImportant),
                        child: Icon(
                          LucideIcons.star,
                          size: 22,
                          color: isImportant ? AppTheme.goldAccent : Colors.white24,
                        ),
                      ),
                    ],
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
                  _sectionLabel('TYPE'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['DAILY', 'MAIN', 'SIDE'].map((t) {
                      return _pickerChip(
                        label: t,
                        isSelected: selectedType == t,
                        color: AppTheme.questTypeColor(t),
                        onTap: () => setModalState(() => selectedType = t),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Difficulty chips
                  _sectionLabel('DIFFICULTY'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['E', 'D', 'C', 'B', 'A', 'S'].map((d) {
                      return _pickerChip(
                        label: d,
                        isSelected: selectedDifficulty == d,
                        color: AppTheme.difficultyColor(d),
                        fontSize: 12,
                        onTap: () => setModalState(() => selectedDifficulty = d),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Category chips
                  _sectionLabel('CATEGORY'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['FITNESS', 'STUDY', 'WORK', 'HEALTH', 'SOCIAL', 'CREATIVITY'].map((c) {
                      return _pickerChip(
                        label: c,
                        isSelected: selectedCategory == c,
                        color: AppTheme.categoryColor(c),
                        fontSize: 10,
                        onTap: () => setModalState(() => selectedCategory = c),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Save / Create
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (titleController.text.trim().isEmpty) return;

                        // Calculate rewards based on difficulty
                        final difficultyMultiplier = {'E': 1, 'D': 2, 'C': 3, 'B': 4, 'A': 5, 'S': 8};
                        final mult = difficultyMultiplier[selectedDifficulty] ?? 1;

                        try {
                          final notifier = ref.read(hunterDataProvider.notifier);
                          if (isEditing) {
                            await notifier.updateQuest(existing['id'] as String, {
                              'title': titleController.text.trim(),
                              'type': selectedType,
                              'difficulty': selectedDifficulty,
                              'category': selectedCategory,
                              'xp_reward': 50 * mult,
                              'gold_reward': 25 * mult,
                              'stat_boost_amount': mult,
                              'is_important': isImportant,
                            });
                          } else {
                            await notifier.createQuest({
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
                              'is_important': isImportant,
                              'is_my_day': false,
                            });
                          }
                          if (ctx.mounted) Navigator.pop(ctx);
                        } catch (e) {
                          _showError(
                              isEditing ? 'Could not save quest' : 'Could not create quest', e);
                        }
                      },
                      child: Text(
                        isEditing ? 'SAVE CHANGES' : 'CREATE QUEST',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),

                  // Edit-mode status actions + delete
                  if (isEditing) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        // Complete / Undo / Reopen depending on status
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: isCompleted || isFailed
                                  ? AppTheme.primaryBlue
                                  : AppTheme.sRankGreen,
                              side: BorderSide(
                                color: (isCompleted || isFailed
                                        ? AppTheme.primaryBlue
                                        : AppTheme.sRankGreen)
                                    .withOpacity(0.4),
                              ),
                            ),
                            icon: Icon(
                              isCompleted
                                  ? LucideIcons.rotateCcw
                                  : isFailed
                                      ? LucideIcons.rotateCcw
                                      : LucideIcons.check,
                              size: 16,
                            ),
                            label: Text(
                              isCompleted
                                  ? 'UNDO'
                                  : isFailed
                                      ? 'REOPEN'
                                      : 'COMPLETE',
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ),
                            onPressed: () async {
                              final id = existing['id'] as String;
                              Navigator.pop(ctx);
                              try {
                                final notifier =
                                    ref.read(hunterDataProvider.notifier);
                                if (isCompleted) {
                                  await notifier.uncompleteQuest(id);
                                } else if (isFailed) {
                                  await notifier.updateQuest(id, {'failed': false});
                                } else {
                                  await _completeQuest(id);
                                }
                              } catch (e) {
                                _showError('Could not update quest', e);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Delete
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.dangerRed,
                              side: BorderSide(color: AppTheme.dangerRed.withOpacity(0.4)),
                            ),
                            icon: const Icon(LucideIcons.trash2, size: 16),
                            label: Text(
                              'DELETE',
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ),
                            onPressed: () async {
                              Navigator.pop(ctx);
                              await _deleteQuest(existing['id'] as String);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  onTap: () => _showQuestSheet(),
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
      child: GestureDetector(
        onTap: () => _showQuestSheet(existing: quest),
        behavior: HitTestBehavior.opaque,
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
                  Row(
                    children: [
                      if (quest['is_important'] == true) ...[
                        const Icon(LucideIcons.star, size: 12, color: AppTheme.goldAccent),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
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
                      ),
                    ],
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
