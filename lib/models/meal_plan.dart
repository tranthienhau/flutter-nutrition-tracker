import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_item.dart';

part 'meal_plan.freezed.dart';
part 'meal_plan.g.dart';

@freezed
class MealPlan with _$MealPlan {
  const factory MealPlan({
    required String id,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required List<DayPlan> days,
    @Default(2000) int dailyCalorieTarget,
  }) = _MealPlan;

  factory MealPlan.fromJson(Map<String, dynamic> json) =>
      _$MealPlanFromJson(json);
}

@freezed
class DayPlan with _$DayPlan {
  const factory DayPlan({
    required int dayOfWeek,
    required List<PlannedMeal> meals,
  }) = _DayPlan;

  factory DayPlan.fromJson(Map<String, dynamic> json) =>
      _$DayPlanFromJson(json);
}

@freezed
class PlannedMeal with _$PlannedMeal {
  const factory PlannedMeal({
    required String id,
    required MealType mealType,
    required String name,
    required List<PlannedFoodItem> items,
    String? notes,
    @Default(0) int prepTimeMinutes,
  }) = _PlannedMeal;

  factory PlannedMeal.fromJson(Map<String, dynamic> json) =>
      _$PlannedMealFromJson(json);
}

@freezed
class PlannedFoodItem with _$PlannedFoodItem {
  const factory PlannedFoodItem({
    required FoodItem foodItem,
    required double quantity,
  }) = _PlannedFoodItem;

  factory PlannedFoodItem.fromJson(Map<String, dynamic> json) =>
      _$PlannedFoodItemFromJson(json);
}

@freezed
class GroceryItem with _$GroceryItem {
  const factory GroceryItem({
    required String name,
    required double totalQuantity,
    required String unit,
    @Default(false) bool purchased,
    @Default('') String category,
  }) = _GroceryItem;

  factory GroceryItem.fromJson(Map<String, dynamic> json) =>
      _$GroceryItemFromJson(json);
}

extension MealPlanX on MealPlan {
  List<GroceryItem> generateGroceryList() {
    final itemMap = <String, GroceryItem>{};

    for (final day in days) {
      for (final meal in day.meals) {
        for (final item in meal.items) {
          final key = item.foodItem.name.toLowerCase();
          if (itemMap.containsKey(key)) {
            final existing = itemMap[key]!;
            itemMap[key] = existing.copyWith(
              totalQuantity: existing.totalQuantity +
                  (item.quantity * item.foodItem.servingSize),
            );
          } else {
            itemMap[key] = GroceryItem(
              name: item.foodItem.name,
              totalQuantity: item.quantity * item.foodItem.servingSize,
              unit: item.foodItem.servingUnit,
              category: _categorizeFood(item.foodItem),
            );
          }
        }
      }
    }

    final items = itemMap.values.toList()
      ..sort((a, b) => a.category.compareTo(b.category));
    return items;
  }

  static String _categorizeFood(FoodItem food) {
    final name = food.name.toLowerCase();
    final tags = food.tags.map((t) => t.toLowerCase()).toList();

    if (tags.contains('produce') ||
        name.contains('apple') ||
        name.contains('banana') ||
        name.contains('lettuce') ||
        name.contains('tomato')) {
      return 'Produce';
    }
    if (tags.contains('dairy') ||
        name.contains('milk') ||
        name.contains('cheese') ||
        name.contains('yogurt')) {
      return 'Dairy';
    }
    if (tags.contains('meat') ||
        name.contains('chicken') ||
        name.contains('beef') ||
        name.contains('fish') ||
        name.contains('salmon')) {
      return 'Meat & Seafood';
    }
    if (tags.contains('grain') ||
        name.contains('bread') ||
        name.contains('rice') ||
        name.contains('pasta') ||
        name.contains('oat')) {
      return 'Grains & Bakery';
    }
    return 'Other';
  }
}
