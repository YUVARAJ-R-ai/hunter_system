import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hunter_system_mobile/core/theme.dart';
import 'package:hunter_system_mobile/widgets/hunter_card.dart';
import 'package:hunter_system_mobile/features/workout/providers/workout_provider.dart';

class ExerciseListPage extends ConsumerStatefulWidget {
  final bool isSelectionMode;
  
  const ExerciseListPage({super.key, this.isSelectionMode = false});

  @override
  ConsumerState<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends ConsumerState<ExerciseListPage> {
  String _searchQuery = '';
  String _selectedMuscle = 'ALL';

  final List<String> _muscleGroups = [
    'ALL',
    'Chest',
    'Back',
    'Quads',
    'Hamstrings',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Core',
    'Calves'
  ];

  void _showAddCustomExerciseDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    String targetMuscle = 'Chest';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppTheme.cardDark,
              title: Text(
                'CREATE CUSTOM EXERCISE',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'EXERCISE NAME',
                        hintText: 'e.g. Incline Dumbbell Fly',
                      ),
                      style: GoogleFonts.outfit(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'TARGET MUSCLE',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: targetMuscle,
                          dropdownColor: AppTheme.cardDark,
                          isExpanded: true,
                          items: _muscleGroups
                              .where((m) => m != 'ALL')
                              .map((m) => DropdownMenuItem(
                                    value: m,
                                    child: Text(m, style: GoogleFonts.outfit(color: Colors.white)),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => targetMuscle = val);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'DESCRIPTION / INSTRUCTIONS',
                        hintText: 'e.g. Keep chest up and squeeze at the top...',
                      ),
                      style: GoogleFonts.outfit(color: Colors.white),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'CANCEL',
                    style: GoogleFonts.spaceGrotesk(color: Colors.white30, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.trim().isEmpty) return;
                    try {
                      await ref.read(activeWorkoutProvider.notifier).createCustomExercise(
                            nameController.text.trim(),
                            targetMuscle,
                            descriptionController.text.trim(),
                          );
                      ref.invalidate(exercisesListProvider);
                      if (mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Custom exercise created successfully!'),
                            backgroundColor: AppTheme.sRankGreen,
                          ),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: $e'),
                            backgroundColor: AppTheme.dangerRed,
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('CREATE'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final exercisesAsync = ref.watch(exercisesListProvider);

    return Scaffold(
      backgroundColor: AppTheme.deepDark,
      appBar: AppBar(
        title: Text(
          widget.isSelectionMode ? 'SELECT EXERCISE' : 'EXERCISES LIBRARY',
          style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.plus, color: AppTheme.primaryBlue),
            onPressed: _showAddCustomExerciseDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Search exercise...',
                prefixIcon: const Icon(LucideIcons.search, size: 18, color: Colors.white38),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () => setState(() => _searchQuery = ''),
                      )
                    : null,
              ),
              style: GoogleFonts.outfit(color: Colors.white),
            ),
          ),

          // Muscle filters list
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _muscleGroups.length,
              itemBuilder: (context, index) {
                final muscle = _muscleGroups[index];
                final isSel = _selectedMuscle == muscle;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: ChoiceChip(
                    label: Text(
                      muscle.toUpperCase(),
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isSel ? Colors.white : Colors.white54,
                      ),
                    ),
                    selected: isSel,
                    selectedColor: AppTheme.primaryBlue,
                    backgroundColor: Colors.white.withOpacity(0.05),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedMuscle = muscle);
                      }
                    },
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                );
              },
            ),
          ),

          // Exercises List
          Expanded(
            child: exercisesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text('Error: $e', style: GoogleFonts.outfit(color: Colors.white38)),
              ),
              data: (list) {
                final filtered = list.where((item) {
                  final name = (item['name'] ?? '').toString().toLowerCase();
                  final target = (item['target_muscle'] ?? '').toString();
                  final matchesSearch = name.contains(_searchQuery);
                  final matchesMuscle = _selectedMuscle == 'ALL' || target.toUpperCase() == _selectedMuscle.toUpperCase();
                  return matchesSearch && matchesMuscle;
                }).toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Text(
                      'No exercises found.',
                      style: GoogleFonts.outfit(color: Colors.white24),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    final name = item['name'] ?? 'Unknown';
                    final muscle = item['target_muscle'] ?? 'General';
                    final desc = item['description'] ?? 'No description provided.';
                    final isCustom = item['user_id'] != null;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: HunterCard(
                        glowColor: isCustom ? AppTheme.neonPurple : AppTheme.primaryBlue,
                        onTap: widget.isSelectionMode
                            ? () => Navigator.pop(context, item)
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    name.toUpperCase(),
                                    style: GoogleFonts.spaceGrotesk(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: (isCustom ? AppTheme.neonPurple : AppTheme.primaryBlue).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    muscle.toUpperCase(),
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: isCustom ? AppTheme.neonPurple : AppTheme.primaryBlue,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              desc,
                              style: GoogleFonts.outfit(fontSize: 11, color: Colors.white38),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
