import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food_item.dart';
import '../providers/nutrition_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dailySummaryProvider);
    final theme = Theme.of(context);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Today'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => _showGoalsDialog(context, ref),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Calorie ring card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: CustomPaint(
                            painter: _CalorieRingPainter(
                              consumed: summary.totalCalories,
                              goal: summary.calorieGoal.toDouble(),
                              color: theme.colorScheme.primary,
                              backgroundColor:
                                  theme.colorScheme.surfaceContainerHighest,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${summary.caloriesRemaining.round()}',
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: summary.caloriesRemaining >= 0
                                          ? theme.colorScheme.primary
                                          : theme.colorScheme.error,
                                    ),
                                  ),
                                  Text(
                                    'kcal remaining',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _MacroChip(
                              label: 'Eaten',
                              value: '${summary.totalCalories.round()}',
                              color: theme.colorScheme.primary,
                            ),
                            _MacroChip(
                              label: 'Goal',
                              value: '${summary.calorieGoal}',
                              color: theme.colorScheme.secondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Macro progress rings
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Macros',
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _MacroRing(
                              label: 'Protein',
                              current: summary.totalProtein,
                              goal: summary.proteinGoal.toDouble(),
                              color: const Color(0xFF42A5F5),
                              unit: 'g',
                            ),
                            _MacroRing(
                              label: 'Carbs',
                              current: summary.totalCarbs,
                              goal: summary.carbsGoal.toDouble(),
                              color: const Color(0xFFFFA726),
                              unit: 'g',
                            ),
                            _MacroRing(
                              label: 'Fat',
                              current: summary.totalFat,
                              goal: summary.fatGoal.toDouble(),
                              color: const Color(0xFFEF5350),
                              unit: 'g',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Habit score
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: _habitColor(summary.habitScore),
                          child: Text(
                            '${summary.habitScore.round()}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Habit Score',
                                  style: theme.textTheme.titleMedium),
                              Text(
                                _habitMessage(summary.habitScore),
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Recent meals
                Text('Recent Entries',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                if (summary.entries.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Text(
                          'No food logged today.\nTap Food Log to add your first meal.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.outline),
                        ),
                      ),
                    ),
                  )
                else
                  ...summary.entries.take(5).map(
                        (entry) => _RecentEntryTile(entry: entry),
                      ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Color _habitColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }

  String _habitMessage(double score) {
    if (score >= 80) return 'Excellent! You are on track.';
    if (score >= 50) return 'Good progress, keep going!';
    return 'Room for improvement today.';
  }

  void _showGoalsDialog(BuildContext context, WidgetRef ref) {
    final goals = ref.read(nutritionGoalsProvider);
    final calCtrl = TextEditingController(text: '${goals.calories}');
    final proCtrl = TextEditingController(text: '${goals.protein}');
    final carbCtrl = TextEditingController(text: '${goals.carbs}');
    final fatCtrl = TextEditingController(text: '${goals.fat}');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Daily Goals'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: calCtrl,
                decoration: const InputDecoration(labelText: 'Calories (kcal)'),
                keyboardType: TextInputType.number),
            TextField(
                controller: proCtrl,
                decoration: const InputDecoration(labelText: 'Protein (g)'),
                keyboardType: TextInputType.number),
            TextField(
                controller: carbCtrl,
                decoration: const InputDecoration(labelText: 'Carbs (g)'),
                keyboardType: TextInputType.number),
            TextField(
                controller: fatCtrl,
                decoration: const InputDecoration(labelText: 'Fat (g)'),
                keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(nutritionGoalsProvider.notifier).updateGoals(
                    NutritionGoals(
                      calories: int.tryParse(calCtrl.text) ?? 2000,
                      protein: int.tryParse(proCtrl.text) ?? 150,
                      carbs: int.tryParse(carbCtrl.text) ?? 250,
                      fat: int.tryParse(fatCtrl.text) ?? 65,
                    ),
                  );
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _CalorieRingPainter extends CustomPainter {
  final double consumed;
  final double goal;
  final Color color;
  final Color backgroundColor;

  _CalorieRingPainter({
    required this.consumed,
    required this.goal,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;
    const strokeWidth = 14.0;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    final progress = (consumed / goal).clamp(0.0, 1.0);
    final sweepAngle = 2 * math.pi * progress;

    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CalorieRingPainter oldDelegate) =>
      consumed != oldDelegate.consumed || goal != oldDelegate.goal;
}

class _MacroRing extends StatelessWidget {
  final String label;
  final double current;
  final double goal;
  final Color color;
  final String unit;

  const _MacroRing({
    required this.label,
    required this.current,
    required this.goal,
    required this.color,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = goal > 0 ? (current / goal).clamp(0.0, 1.0) : 0.0;
    return Column(
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(color),
              ),
              Center(
                child: Text(
                  '${current.round()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        Text('/${goal.round()}$unit',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}

class _MacroChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: color)),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _RecentEntryTile extends StatelessWidget {
  final FoodLogEntry entry;
  const _RecentEntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    final cal = (entry.foodItem.nutrition.calories * entry.quantity).round();
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(_mealIcon(entry.mealType)),
        ),
        title: Text(entry.foodItem.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('${entry.mealType.label} - ${entry.quantity}x serving'),
        trailing: Text('$cal kcal',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
      ),
    );
  }

  IconData _mealIcon(MealType type) {
    return switch (type) {
      MealType.breakfast => Icons.free_breakfast,
      MealType.lunch => Icons.lunch_dining,
      MealType.dinner => Icons.dinner_dining,
      MealType.snack => Icons.cookie,
    };
  }
}
