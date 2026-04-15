import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/food_item.dart';
import '../models/meal_plan.dart';
import '../providers/nutrition_provider.dart';

const _uuid = Uuid();
const _dayNames = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class MealPlanScreen extends ConsumerStatefulWidget {
  const MealPlanScreen({super.key});

  @override
  ConsumerState<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends ConsumerState<MealPlanScreen> {
  int _selectedDay = DateTime.now().weekday - 1;

  @override
  Widget build(BuildContext context) {
    final plan = ref.watch(mealPlanProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan'),
        actions: [
          if (plan != null)
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Grocery List',
              onPressed: () => _showGroceryList(context, plan),
            ),
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            tooltip: 'Auto-generate',
            onPressed: () => _generateSamplePlan(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Day selector
          SizedBox(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: 7,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedDay;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: ChoiceChip(
                    label: Text(_dayNames[index].substring(0, 3)),
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedDay = index),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Meals for selected day
          Expanded(
            child: plan == null || plan.days.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month,
                            size: 64, color: theme.colorScheme.outline),
                        const SizedBox(height: 12),
                        const Text('No meal plan yet'),
                        const SizedBox(height: 8),
                        FilledButton.tonal(
                          onPressed: _generateSamplePlan,
                          child: const Text('Generate Sample Plan'),
                        ),
                      ],
                    ),
                  )
                : _buildDayView(plan, theme),
          ),
        ],
      ),
    );
  }

  Widget _buildDayView(MealPlan plan, ThemeData theme) {
    if (_selectedDay >= plan.days.length) {
      return const Center(child: Text('No plan for this day'));
    }

    final dayPlan = plan.days[_selectedDay];
    final meals = dayPlan.meals;

    if (meals.isEmpty) {
      return const Center(child: Text('No meals planned'));
    }

    double dayCalories = 0;
    for (final meal in meals) {
      for (final item in meal.items) {
        dayCalories += item.foodItem.nutrition.calories * item.quantity;
      }
    }

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Day summary
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_dayNames[_selectedDay],
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Chip(
                  avatar: const Icon(Icons.local_fire_department, size: 18),
                  label: Text('${dayCalories.round()} kcal'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Meal cards
        ...meals.asMap().entries.map((entry) {
          final mealIndex = entry.key;
          final meal = entry.value;

          double mealCal = 0;
          for (final item in meal.items) {
            mealCal += item.foodItem.nutrition.calories * item.quantity;
          }

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ExpansionTile(
              leading: CircleAvatar(
                child: Icon(_mealIcon(meal.mealType)),
              ),
              title: Text(meal.name),
              subtitle: Text(
                  '${meal.mealType.label} - ${mealCal.round()} kcal'
                  '${meal.prepTimeMinutes > 0 ? " - ${meal.prepTimeMinutes} min" : ""}'),
              children: [
                ...meal.items.map((item) => ListTile(
                      dense: true,
                      title: Text(item.foodItem.name),
                      trailing: Text(
                          '${(item.foodItem.nutrition.calories * item.quantity).round()} kcal'),
                    )),
                if (meal.notes != null && meal.notes!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(meal.notes!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontStyle: FontStyle.italic)),
                  ),
                OverflowBar(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.swap_vert, size: 18),
                      label: const Text('Swap'),
                      onPressed: () =>
                          _showSwapDialog(context, _selectedDay, mealIndex, meals),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.delete, size: 18),
                      label: const Text('Remove'),
                      onPressed: () => ref
                          .read(mealPlanProvider.notifier)
                          .removeMeal(_selectedDay, mealIndex),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  void _showSwapDialog(BuildContext context, int dayIndex, int mealIndex,
      List<PlannedMeal> meals) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Swap with'),
        children: meals.asMap().entries
            .where((e) => e.key != mealIndex)
            .map((e) => SimpleDialogOption(
                  onPressed: () {
                    ref
                        .read(mealPlanProvider.notifier)
                        .swapMeals(dayIndex, mealIndex, e.key);
                    Navigator.pop(ctx);
                  },
                  child: Text(e.value.name),
                ))
            .toList(),
      ),
    );
  }

  void _showGroceryList(BuildContext context, MealPlan plan) {
    final groceries = plan.generateGroceryList();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        expand: false,
        builder: (ctx, scrollCtrl) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Grocery List',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollCtrl,
                itemCount: groceries.length,
                itemBuilder: (ctx, index) {
                  final item = groceries[index];
                  return ListTile(
                    leading: Checkbox(
                      value: item.purchased,
                      onChanged: (_) {},
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.category),
                    trailing:
                        Text('${item.totalQuantity.round()} ${item.unit}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generateSamplePlan() {
    final sampleFoods = [
      const FoodItem(
          id: 's1', name: 'Oatmeal', brand: '', servingSize: 40, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 150, protein: 5, carbs: 27, fat: 3, fiber: 4),
          tags: ['grain']),
      const FoodItem(
          id: 's2', name: 'Greek Yogurt', brand: '', servingSize: 170, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 100, protein: 17, carbs: 6, fat: 1),
          tags: ['dairy']),
      const FoodItem(
          id: 's3', name: 'Chicken Breast', brand: '', servingSize: 120, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 165, protein: 31, carbs: 0, fat: 3.6),
          tags: ['meat']),
      const FoodItem(
          id: 's4', name: 'Brown Rice', brand: '', servingSize: 185, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 216, protein: 5, carbs: 45, fat: 1.8, fiber: 3.5),
          tags: ['grain']),
      const FoodItem(
          id: 's5', name: 'Salmon Fillet', brand: '', servingSize: 125, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 208, protein: 20, carbs: 0, fat: 13),
          tags: ['meat']),
      const FoodItem(
          id: 's6', name: 'Mixed Salad', brand: '', servingSize: 100, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 20, protein: 1.5, carbs: 3.5, fat: 0.2, fiber: 2),
          tags: ['produce']),
      const FoodItem(
          id: 's7', name: 'Banana', brand: '', servingSize: 118, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 105, protein: 1.3, carbs: 27, fat: 0.4, fiber: 3),
          tags: ['produce']),
      const FoodItem(
          id: 's8', name: 'Almonds', brand: '', servingSize: 28, servingUnit: 'g',
          nutrition: NutritionInfo(calories: 164, protein: 6, carbs: 6, fat: 14, fiber: 3.5),
          tags: ['other']),
    ];

    final days = List.generate(7, (dayIndex) {
      return DayPlan(
        dayOfWeek: dayIndex + 1,
        meals: [
          PlannedMeal(
            id: _uuid.v4(),
            mealType: MealType.breakfast,
            name: 'Oatmeal & Yogurt Bowl',
            prepTimeMinutes: 10,
            items: [
              PlannedFoodItem(foodItem: sampleFoods[0], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[1], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[6], quantity: 1),
            ],
          ),
          PlannedMeal(
            id: _uuid.v4(),
            mealType: MealType.lunch,
            name: 'Chicken Rice Bowl',
            prepTimeMinutes: 25,
            items: [
              PlannedFoodItem(foodItem: sampleFoods[2], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[3], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[5], quantity: 1),
            ],
          ),
          PlannedMeal(
            id: _uuid.v4(),
            mealType: MealType.dinner,
            name: 'Grilled Salmon Plate',
            prepTimeMinutes: 30,
            items: [
              PlannedFoodItem(foodItem: sampleFoods[4], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[5], quantity: 1.5),
              PlannedFoodItem(foodItem: sampleFoods[3], quantity: 0.5),
            ],
          ),
          PlannedMeal(
            id: _uuid.v4(),
            mealType: MealType.snack,
            name: 'Afternoon Snack',
            prepTimeMinutes: 0,
            items: [
              PlannedFoodItem(foodItem: sampleFoods[7], quantity: 1),
              PlannedFoodItem(foodItem: sampleFoods[6], quantity: 1),
            ],
          ),
        ],
      );
    });

    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));

    ref.read(mealPlanProvider.notifier).savePlan(MealPlan(
          id: _uuid.v4(),
          name: 'Weekly Plan',
          startDate: monday,
          endDate: monday.add(const Duration(days: 6)),
          days: days,
          dailyCalorieTarget: 2000,
        ));
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
