// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealPlanImpl _$$MealPlanImplFromJson(Map<String, dynamic> json) =>
    _$MealPlanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      days: (json['days'] as List<dynamic>)
          .map((e) => DayPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyCalorieTarget: (json['dailyCalorieTarget'] as num?)?.toInt() ?? 2000,
    );

Map<String, dynamic> _$$MealPlanImplToJson(_$MealPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'days': instance.days,
      'dailyCalorieTarget': instance.dailyCalorieTarget,
    };

_$DayPlanImpl _$$DayPlanImplFromJson(Map<String, dynamic> json) =>
    _$DayPlanImpl(
      dayOfWeek: (json['dayOfWeek'] as num).toInt(),
      meals: (json['meals'] as List<dynamic>)
          .map((e) => PlannedMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DayPlanImplToJson(_$DayPlanImpl instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'meals': instance.meals,
    };

_$PlannedMealImpl _$$PlannedMealImplFromJson(Map<String, dynamic> json) =>
    _$PlannedMealImpl(
      id: json['id'] as String,
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PlannedFoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      prepTimeMinutes: (json['prepTimeMinutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PlannedMealImplToJson(_$PlannedMealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'name': instance.name,
      'items': instance.items,
      'notes': instance.notes,
      'prepTimeMinutes': instance.prepTimeMinutes,
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.snack: 'snack',
};

_$PlannedFoodItemImpl _$$PlannedFoodItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PlannedFoodItemImpl(
      foodItem: FoodItem.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlannedFoodItemImplToJson(
        _$PlannedFoodItemImpl instance) =>
    <String, dynamic>{
      'foodItem': instance.foodItem,
      'quantity': instance.quantity,
    };

_$GroceryItemImpl _$$GroceryItemImplFromJson(Map<String, dynamic> json) =>
    _$GroceryItemImpl(
      name: json['name'] as String,
      totalQuantity: (json['totalQuantity'] as num).toDouble(),
      unit: json['unit'] as String,
      purchased: json['purchased'] as bool? ?? false,
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$GroceryItemImplToJson(_$GroceryItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'totalQuantity': instance.totalQuantity,
      'unit': instance.unit,
      'purchased': instance.purchased,
      'category': instance.category,
    };
