import 'dart:convert';
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
  String _selectedEquipment = 'ALL';

  final List<String> _muscleGroups = [
    'ALL',
    'Chest',
    'Back',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Core',
    'Quads',
    'Hamstrings',
    'Calves',
    'Waist',
    'Cardio'
  ];

  final List<String> _equipments = [
    'ALL',
    'Body Weight',
    'Barbell',
    'Dumbbell',
    'Cable',
    'Band',
    'Kettlebell',
    'Machine',
    'Plate'
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

          // Equipment filters list
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _equipments.length,
              itemBuilder: (context, index) {
                final equip = _equipments[index];
                final isSel = _selectedEquipment == equip;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: ChoiceChip(
                    label: Text(
                      equip.toUpperCase(),
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isSel ? Colors.white : Colors.white54,
                      ),
                    ),
                    selected: isSel,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.white.withOpacity(0.05),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedEquipment = equip);
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
                  final target = (item['target_muscle'] ?? '').toString().toLowerCase();
                  final bodyPart = (item['body_part'] ?? '').toString().toLowerCase();
                  final equipment = (item['equipment'] ?? '').toString().toLowerCase();

                  final matchesSearch = name.contains(_searchQuery);

                  final matchesMuscle = _selectedMuscle == 'ALL' ||
                      target == _selectedMuscle.toLowerCase() ||
                      bodyPart == _selectedMuscle.toLowerCase();

                  final matchesEquip = _selectedEquipment == 'ALL' ||
                      equipment == _selectedEquipment.toLowerCase();

                  return matchesSearch && matchesMuscle && matchesEquip;
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
                        onTap: () {
                          if (widget.isSelectionMode) {
                            Navigator.pop(context, item);
                          } else {
                            _showExerciseDetails(item);
                          }
                        },
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

  void _showExerciseDetails(Map<String, dynamic> item) {
    final name = (item['name'] ?? 'Unknown').toString().toUpperCase();
    final target = (item['target_muscle'] ?? 'General').toString().toUpperCase();
    final bodyPart = (item['body_part'] ?? '').toString().toUpperCase();
    final equipment = (item['equipment'] ?? '').toString().toUpperCase();
    final gifUrl = (item['gif_url'] ?? '').toString();
    final desc = (item['description'] ?? '').toString();

    List<String> instructions = [];
    if (item['instructions'] is List) {
      instructions = List<String>.from(item['instructions']);
    } else if (item['instructions'] is String && item['instructions'].toString().isNotEmpty) {
      try {
        final parsed = jsonDecode(item['instructions']);
        if (parsed is List) {
          instructions = List<String>.from(parsed);
        } else {
          instructions = [item['instructions']];
        }
      } catch (_) {
        instructions = [item['instructions']];
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: AppTheme.deepDark,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(color: AppTheme.primaryBlue, width: 2),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            if (target.isNotEmpty)
                              _buildBadge(target, AppTheme.primaryBlue),
                            if (bodyPart.isNotEmpty && bodyPart != target)
                              _buildBadge(bodyPart, AppTheme.neonPurple),
                            if (equipment.isNotEmpty)
                              _buildBadge(equipment, Colors.orange),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (gifUrl.isNotEmpty)
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              color: Colors.white.withOpacity(0.02),
                              width: double.infinity,
                              height: 240,
                              child: Image.network(
                                gifUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.image_not_supported, color: Colors.white24, size: 48),
                                      const SizedBox(height: 8),
                                      Text(
                                        'NO DEMO AVAILABLE',
                                        style: GoogleFonts.spaceGrotesk(fontSize: 12, color: Colors.white24),
                                      ),
                                    ],
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      if (desc.isNotEmpty && desc != 'No description provided.') ...[
                        Text(
                          'DESCRIPTION',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          desc,
                          style: GoogleFonts.outfit(fontSize: 14, color: Colors.white70, height: 1.4),
                        ),
                        const SizedBox(height: 20),
                      ],
                      if (instructions.isNotEmpty) ...[
                        Text(
                          'INSTRUCTIONS',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...instructions.asMap().entries.map((entry) {
                          final idx = entry.key + 1;
                          final step = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryBlue.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$idx',
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryBlue,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    step,
                                    style: GoogleFonts.outfit(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.85),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
