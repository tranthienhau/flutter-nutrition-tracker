// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodItemImpl _$$FoodItemImplFromJson(Map<String, dynamic> json) =>
    _$FoodItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      servingSize: (json['servingSize'] as num).toDouble(),
      servingUnit: json['servingUnit'] as String? ?? 'g',
      nutrition:
          NutritionInfo.fromJson(json['nutrition'] as Map<String, dynamic>),
      barcode: json['barcode'] as String?,
      imageUrl: json['imageUrl'] as String?,
      source: json['source'] as String? ?? 'generic',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$FoodItemImplToJson(_$FoodItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'servingSize': instance.servingSize,
      'servingUnit': instance.servingUnit,
      'nutrition': instance.nutrition,
      'barcode': instance.barcode,
      'imageUrl': instance.imageUrl,
      'source': instance.source,
      'tags': instance.tags,
    };

_$NutritionInfoImpl _$$NutritionInfoImplFromJson(Map<String, dynamic> json) =>
    _$NutritionInfoImpl(
      calories: (json['calories'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble() ?? 0,
      sugar: (json['sugar'] as num?)?.toDouble() ?? 0,
      saturatedFat: (json['saturatedFat'] as num?)?.toDouble() ?? 0,
      sodium: (json['sodium'] as num?)?.toDouble() ?? 0,
      cholesterol: (json['cholesterol'] as num?)?.toDouble() ?? 0,
      potassium: (json['potassium'] as num?)?.toDouble() ?? 0,
      vitaminA: (json['vitaminA'] as num?)?.toDouble() ?? 0,
      vitaminC: (json['vitaminC'] as num?)?.toDouble() ?? 0,
      calcium: (json['calcium'] as num?)?.toDouble() ?? 0,
      iron: (json['iron'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$NutritionInfoImplToJson(_$NutritionInfoImpl instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fat': instance.fat,
      'fiber': instance.fiber,
      'sugar': instance.sugar,
      'saturatedFat': instance.saturatedFat,
      'sodium': instance.sodium,
      'cholesterol': instance.cholesterol,
      'potassium': instance.potassium,
      'vitaminA': instance.vitaminA,
      'vitaminC': instance.vitaminC,
      'calcium': instance.calcium,
      'iron': instance.iron,
    };

_$FoodLogEntryImpl _$$FoodLogEntryImplFromJson(Map<String, dynamic> json) =>
    _$FoodLogEntryImpl(
      id: json['id'] as String,
      foodItem: FoodItem.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      loggedAt: DateTime.parse(json['loggedAt'] as String),
    );

Map<String, dynamic> _$$FoodLogEntryImplToJson(_$FoodLogEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodItem': instance.foodItem,
      'quantity': instance.quantity,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'loggedAt': instance.loggedAt.toIso8601String(),
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.snack: 'snack',
};

_$DailyNutritionSummaryImpl _$$DailyNutritionSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyNutritionSummaryImpl(
      date: DateTime.parse(json['date'] as String),
      totalCalories: (json['totalCalories'] as num).toDouble(),
      totalProtein: (json['totalProtein'] as num).toDouble(),
      totalCarbs: (json['totalCarbs'] as num).toDouble(),
      totalFat: (json['totalFat'] as num).toDouble(),
      totalFiber: (json['totalFiber'] as num).toDouble(),
      calorieGoal: (json['calorieGoal'] as num).toInt(),
      proteinGoal: (json['proteinGoal'] as num).toInt(),
      carbsGoal: (json['carbsGoal'] as num).toInt(),
      fatGoal: (json['fatGoal'] as num).toInt(),
      entries: (json['entries'] as List<dynamic>)
          .map((e) => FoodLogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DailyNutritionSummaryImplToJson(
        _$DailyNutritionSummaryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'totalFiber': instance.totalFiber,
      'calorieGoal': instance.calorieGoal,
      'proteinGoal': instance.proteinGoal,
      'carbsGoal': instance.carbsGoal,
      'fatGoal': instance.fatGoal,
      'entries': instance.entries,
    };
