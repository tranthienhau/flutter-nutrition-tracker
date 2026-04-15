import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    required String brand,
    required double servingSize,
    @Default('g') String servingUnit,
    required NutritionInfo nutrition,
    String? barcode,
    String? imageUrl,
    @Default('generic') String source,
    @Default([]) List<String> tags,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}

@freezed
class NutritionInfo with _$NutritionInfo {
  const factory NutritionInfo({
    required double calories,
    required double protein,
    required double carbs,
    required double fat,
    @Default(0) double fiber,
    @Default(0) double sugar,
    @Default(0) double saturatedFat,
    @Default(0) double sodium,
    @Default(0) double cholesterol,
    @Default(0) double potassium,
    @Default(0) double vitaminA,
    @Default(0) double vitaminC,
    @Default(0) double calcium,
    @Default(0) double iron,
  }) = _NutritionInfo;

  factory NutritionInfo.fromJson(Map<String, dynamic> json) =>
      _$NutritionInfoFromJson(json);
}

@freezed
class FoodLogEntry with _$FoodLogEntry {
  const factory FoodLogEntry({
    required String id,
    required FoodItem foodItem,
    required double quantity,
    required MealType mealType,
    required DateTime loggedAt,
  }) = _FoodLogEntry;

  factory FoodLogEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodLogEntryFromJson(json);
}

enum MealType {
  breakfast('Breakfast'),
  lunch('Lunch'),
  dinner('Dinner'),
  snack('Snack');

  final String label;
  const MealType(this.label);
}

@freezed
class DailyNutritionSummary with _$DailyNutritionSummary {
  const factory DailyNutritionSummary({
    required DateTime date,
    required double totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
    required double totalFiber,
    required int calorieGoal,
    required int proteinGoal,
    required int carbsGoal,
    required int fatGoal,
    required List<FoodLogEntry> entries,
  }) = _DailyNutritionSummary;

  factory DailyNutritionSummary.fromJson(Map<String, dynamic> json) =>
      _$DailyNutritionSummaryFromJson(json);
}

extension DailyNutritionSummaryX on DailyNutritionSummary {
  double get caloriesRemaining => calorieGoal - totalCalories;
  double get proteinProgress => totalProtein / proteinGoal;
  double get carbsProgress => totalCarbs / carbsGoal;
  double get fatProgress => totalFat / fatGoal;

  double get habitScore {
    final calScore = (1.0 - (caloriesRemaining.abs() / calorieGoal)).clamp(0.0, 1.0);
    final proScore = proteinProgress.clamp(0.0, 1.0);
    final carbScore = carbsProgress.clamp(0.0, 1.0);
    final fatScore = fatProgress.clamp(0.0, 1.0);
    return ((calScore + proScore + carbScore + fatScore) / 4 * 100).roundToDouble();
  }
}
