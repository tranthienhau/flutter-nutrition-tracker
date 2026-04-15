import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/food_item.dart';
import '../models/meal_plan.dart';
import '../services/nutrition_database.dart';

const _uuid = Uuid();

// ---------- Nutrition Goals ----------

class NutritionGoals {
  final int calories;
  final int protein;
  final int carbs;
  final int fat;

  const NutritionGoals({
    this.calories = 2000,
    this.protein = 150,
    this.carbs = 250,
    this.fat = 65,
  });

  NutritionGoals copyWith({int? calories, int? protein, int? carbs, int? fat}) {
    return NutritionGoals(
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
    );
  }
}

final nutritionGoalsProvider =
    StateNotifierProvider<NutritionGoalsNotifier, NutritionGoals>((ref) {
  return NutritionGoalsNotifier();
});

class NutritionGoalsNotifier extends StateNotifier<NutritionGoals> {
  NutritionGoalsNotifier() : super(const NutritionGoals()) {
    _loadGoals();
  }

  void _loadGoals() {
    final box = Hive.box('settings');
    state = NutritionGoals(
      calories: box.get('calorieGoal', defaultValue: 2000),
      protein: box.get('proteinGoal', defaultValue: 150),
      carbs: box.get('carbsGoal', defaultValue: 250),
      fat: box.get('fatGoal', defaultValue: 65),
    );
  }

  Future<void> updateGoals(NutritionGoals goals) async {
    final box = Hive.box('settings');
    await box.put('calorieGoal', goals.calories);
    await box.put('proteinGoal', goals.protein);
    await box.put('carbsGoal', goals.carbs);
    await box.put('fatGoal', goals.fat);
    state = goals;
  }
}

// ---------- Food Log ----------

final foodLogProvider =
    StateNotifierProvider<FoodLogNotifier, List<FoodLogEntry>>((ref) {
  return FoodLogNotifier();
});

class FoodLogNotifier extends StateNotifier<List<FoodLogEntry>> {
  FoodLogNotifier() : super([]) {
    _loadEntries();
  }

  void _loadEntries() {
    final box = Hive.box('food_log');
    final entries = <FoodLogEntry>[];
    for (final key in box.keys) {
      try {
        final data = Map<String, dynamic>.from(box.get(key));
        entries.add(FoodLogEntry.fromJson(data));
      } catch (_) {}
    }
    entries.sort((a, b) => b.loggedAt.compareTo(a.loggedAt));
    state = entries;
  }

  Future<void> addEntry(FoodItem food, double quantity, MealType meal) async {
    final entry = FoodLogEntry(
      id: _uuid.v4(),
      foodItem: food,
      quantity: quantity,
      mealType: meal,
      loggedAt: DateTime.now(),
    );
    final box = Hive.box('food_log');
    await box.put(entry.id, entry.toJson());
    state = [entry, ...state];
  }

  Future<void> removeEntry(String id) async {
    final box = Hive.box('food_log');
    await box.delete(id);
    state = state.where((e) => e.id != id).toList();
  }

  Future<void> updateEntry(FoodLogEntry updated) async {
    final box = Hive.box('food_log');
    await box.put(updated.id, updated.toJson());
    state = state.map((e) => e.id == updated.id ? updated : e).toList();
  }
}

// ---------- Daily Summary ----------

final dailySummaryProvider = Provider<DailyNutritionSummary>((ref) {
  final entries = ref.watch(foodLogProvider);
  final goals = ref.watch(nutritionGoalsProvider);
  final now = DateTime.now();
  final todayStart = DateTime(now.year, now.month, now.day);

  final todayEntries = entries.where((e) {
    final d = e.loggedAt;
    return d.year == todayStart.year &&
        d.month == todayStart.month &&
        d.day == todayStart.day;
  }).toList();

  double totalCal = 0, totalPro = 0, totalCarb = 0, totalFat = 0, totalFib = 0;

  for (final entry in todayEntries) {
    final multiplier = entry.quantity;
    totalCal += entry.foodItem.nutrition.calories * multiplier;
    totalPro += entry.foodItem.nutrition.protein * multiplier;
    totalCarb += entry.foodItem.nutrition.carbs * multiplier;
    totalFat += entry.foodItem.nutrition.fat * multiplier;
    totalFib += entry.foodItem.nutrition.fiber * multiplier;
  }

  return DailyNutritionSummary(
    date: todayStart,
    totalCalories: totalCal,
    totalProtein: totalPro,
    totalCarbs: totalCarb,
    totalFat: totalFat,
    totalFiber: totalFib,
    calorieGoal: goals.calories,
    proteinGoal: goals.protein,
    carbsGoal: goals.carbs,
    fatGoal: goals.fat,
    entries: todayEntries,
  );
});

// ---------- Favorites ----------

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<FoodItem>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<FoodItem>> {
  FavoritesNotifier() : super([]) {
    _load();
  }

  void _load() {
    final box = Hive.box('favorites');
    final items = <FoodItem>[];
    for (final key in box.keys) {
      try {
        items.add(FoodItem.fromJson(Map<String, dynamic>.from(box.get(key))));
      } catch (_) {}
    }
    state = items;
  }

  Future<void> toggle(FoodItem item) async {
    final box = Hive.box('favorites');
    if (box.containsKey(item.id)) {
      await box.delete(item.id);
      state = state.where((f) => f.id != item.id).toList();
    } else {
      await box.put(item.id, item.toJson());
      state = [...state, item];
    }
  }

  bool isFavorite(String id) => state.any((f) => f.id == id);
}

// ---------- Food Search ----------

final foodSearchProvider =
    StateNotifierProvider<FoodSearchNotifier, AsyncValue<List<FoodItem>>>((ref) {
  return FoodSearchNotifier(ref);
});

class FoodSearchNotifier extends StateNotifier<AsyncValue<List<FoodItem>>> {
  final Ref _ref;
  FoodSearchNotifier(this._ref) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }
    state = const AsyncValue.loading();
    try {
      final results = await NutritionDatabaseService.searchFood(query);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> lookupBarcode(String barcode) async {
    state = const AsyncValue.loading();
    try {
      final item = await NutritionDatabaseService.lookupBarcode(barcode);
      state = AsyncValue.data(item != null ? [item] : []);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// ---------- Meal Plan ----------

final mealPlanProvider =
    StateNotifierProvider<MealPlanNotifier, MealPlan?>((ref) {
  return MealPlanNotifier();
});

class MealPlanNotifier extends StateNotifier<MealPlan?> {
  MealPlanNotifier() : super(null) {
    _load();
  }

  void _load() {
    final box = Hive.box('meal_plans');
    final data = box.get('current_plan');
    if (data != null) {
      try {
        state = MealPlan.fromJson(Map<String, dynamic>.from(data));
      } catch (_) {}
    }
  }

  Future<void> savePlan(MealPlan plan) async {
    final box = Hive.box('meal_plans');
    await box.put('current_plan', plan.toJson());
    state = plan;
  }

  Future<void> swapMeals(int dayIndex, int mealIndexA, int mealIndexB) async {
    if (state == null) return;
    final days = List<DayPlan>.from(state!.days);
    final meals = List<PlannedMeal>.from(days[dayIndex].meals);
    final temp = meals[mealIndexA];
    meals[mealIndexA] = meals[mealIndexB];
    meals[mealIndexB] = temp;
    days[dayIndex] = days[dayIndex].copyWith(meals: meals);
    await savePlan(state!.copyWith(days: days));
  }

  Future<void> removeMeal(int dayIndex, int mealIndex) async {
    if (state == null) return;
    final days = List<DayPlan>.from(state!.days);
    final meals = List<PlannedMeal>.from(days[dayIndex].meals);
    meals.removeAt(mealIndex);
    days[dayIndex] = days[dayIndex].copyWith(meals: meals);
    await savePlan(state!.copyWith(days: days));
  }
}

// ---------- Weight Log ----------

class WeightEntry {
  final String id;
  final DateTime date;
  final double weight;
  final double? bodyFat;
  final double? waist;
  final double? chest;
  final double? arms;
  final String? notes;

  const WeightEntry({
    required this.id,
    required this.date,
    required this.weight,
    this.bodyFat,
    this.waist,
    this.chest,
    this.arms,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'weight': weight,
        'bodyFat': bodyFat,
        'waist': waist,
        'chest': chest,
        'arms': arms,
        'notes': notes,
      };

  factory WeightEntry.fromJson(Map<String, dynamic> json) => WeightEntry(
        id: json['id'],
        date: DateTime.parse(json['date']),
        weight: (json['weight'] as num).toDouble(),
        bodyFat: (json['bodyFat'] as num?)?.toDouble(),
        waist: (json['waist'] as num?)?.toDouble(),
        chest: (json['chest'] as num?)?.toDouble(),
        arms: (json['arms'] as num?)?.toDouble(),
        notes: json['notes'],
      );
}

final weightLogProvider =
    StateNotifierProvider<WeightLogNotifier, List<WeightEntry>>((ref) {
  return WeightLogNotifier();
});

class WeightLogNotifier extends StateNotifier<List<WeightEntry>> {
  WeightLogNotifier() : super([]) {
    _load();
  }

  void _load() {
    final box = Hive.box('weight_logs');
    final entries = <WeightEntry>[];
    for (final key in box.keys) {
      try {
        entries.add(
            WeightEntry.fromJson(Map<String, dynamic>.from(box.get(key))));
      } catch (_) {}
    }
    entries.sort((a, b) => b.date.compareTo(a.date));
    state = entries;
  }

  Future<void> add(WeightEntry entry) async {
    final box = Hive.box('weight_logs');
    await box.put(entry.id, entry.toJson());
    state = [entry, ...state]..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> remove(String id) async {
    final box = Hive.box('weight_logs');
    await box.delete(id);
    state = state.where((e) => e.id != id).toList();
  }
}
