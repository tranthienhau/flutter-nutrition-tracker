// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealPlan _$MealPlanFromJson(Map<String, dynamic> json) {
  return _MealPlan.fromJson(json);
}

/// @nodoc
mixin _$MealPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<DayPlan> get days => throw _privateConstructorUsedError;
  int get dailyCalorieTarget => throw _privateConstructorUsedError;

  /// Serializes this MealPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealPlanCopyWith<MealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanCopyWith<$Res> {
  factory $MealPlanCopyWith(MealPlan value, $Res Function(MealPlan) then) =
      _$MealPlanCopyWithImpl<$Res, MealPlan>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime startDate,
      DateTime endDate,
      List<DayPlan> days,
      int dailyCalorieTarget});
}

/// @nodoc
class _$MealPlanCopyWithImpl<$Res, $Val extends MealPlan>
    implements $MealPlanCopyWith<$Res> {
  _$MealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? days = null,
    Object? dailyCalorieTarget = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayPlan>,
      dailyCalorieTarget: null == dailyCalorieTarget
          ? _value.dailyCalorieTarget
          : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealPlanImplCopyWith<$Res>
    implements $MealPlanCopyWith<$Res> {
  factory _$$MealPlanImplCopyWith(
          _$MealPlanImpl value, $Res Function(_$MealPlanImpl) then) =
      __$$MealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime startDate,
      DateTime endDate,
      List<DayPlan> days,
      int dailyCalorieTarget});
}

/// @nodoc
class __$$MealPlanImplCopyWithImpl<$Res>
    extends _$MealPlanCopyWithImpl<$Res, _$MealPlanImpl>
    implements _$$MealPlanImplCopyWith<$Res> {
  __$$MealPlanImplCopyWithImpl(
      _$MealPlanImpl _value, $Res Function(_$MealPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? days = null,
    Object? dailyCalorieTarget = null,
  }) {
    return _then(_$MealPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayPlan>,
      dailyCalorieTarget: null == dailyCalorieTarget
          ? _value.dailyCalorieTarget
          : dailyCalorieTarget // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPlanImpl implements _MealPlan {
  const _$MealPlanImpl(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required final List<DayPlan> days,
      this.dailyCalorieTarget = 2000})
      : _days = days;

  factory _$MealPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<DayPlan> _days;
  @override
  List<DayPlan> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  final int dailyCalorieTarget;

  @override
  String toString() {
    return 'MealPlan(id: $id, name: $name, startDate: $startDate, endDate: $endDate, days: $days, dailyCalorieTarget: $dailyCalorieTarget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.dailyCalorieTarget, dailyCalorieTarget) ||
                other.dailyCalorieTarget == dailyCalorieTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startDate, endDate,
      const DeepCollectionEquality().hash(_days), dailyCalorieTarget);

  /// Create a copy of MealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      __$$MealPlanImplCopyWithImpl<_$MealPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPlanImplToJson(
      this,
    );
  }
}

abstract class _MealPlan implements MealPlan {
  const factory _MealPlan(
      {required final String id,
      required final String name,
      required final DateTime startDate,
      required final DateTime endDate,
      required final List<DayPlan> days,
      final int dailyCalorieTarget}) = _$MealPlanImpl;

  factory _MealPlan.fromJson(Map<String, dynamic> json) =
      _$MealPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<DayPlan> get days;
  @override
  int get dailyCalorieTarget;

  /// Create a copy of MealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayPlan _$DayPlanFromJson(Map<String, dynamic> json) {
  return _DayPlan.fromJson(json);
}

/// @nodoc
mixin _$DayPlan {
  int get dayOfWeek => throw _privateConstructorUsedError;
  List<PlannedMeal> get meals => throw _privateConstructorUsedError;

  /// Serializes this DayPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayPlanCopyWith<DayPlan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayPlanCopyWith<$Res> {
  factory $DayPlanCopyWith(DayPlan value, $Res Function(DayPlan) then) =
      _$DayPlanCopyWithImpl<$Res, DayPlan>;
  @useResult
  $Res call({int dayOfWeek, List<PlannedMeal> meals});
}

/// @nodoc
class _$DayPlanCopyWithImpl<$Res, $Val extends DayPlan>
    implements $DayPlanCopyWith<$Res> {
  _$DayPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? meals = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<PlannedMeal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayPlanImplCopyWith<$Res> implements $DayPlanCopyWith<$Res> {
  factory _$$DayPlanImplCopyWith(
          _$DayPlanImpl value, $Res Function(_$DayPlanImpl) then) =
      __$$DayPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dayOfWeek, List<PlannedMeal> meals});
}

/// @nodoc
class __$$DayPlanImplCopyWithImpl<$Res>
    extends _$DayPlanCopyWithImpl<$Res, _$DayPlanImpl>
    implements _$$DayPlanImplCopyWith<$Res> {
  __$$DayPlanImplCopyWithImpl(
      _$DayPlanImpl _value, $Res Function(_$DayPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? meals = null,
  }) {
    return _then(_$DayPlanImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<PlannedMeal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayPlanImpl implements _DayPlan {
  const _$DayPlanImpl(
      {required this.dayOfWeek, required final List<PlannedMeal> meals})
      : _meals = meals;

  factory _$DayPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayPlanImplFromJson(json);

  @override
  final int dayOfWeek;
  final List<PlannedMeal> _meals;
  @override
  List<PlannedMeal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'DayPlan(dayOfWeek: $dayOfWeek, meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayPlanImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dayOfWeek, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of DayPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayPlanImplCopyWith<_$DayPlanImpl> get copyWith =>
      __$$DayPlanImplCopyWithImpl<_$DayPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayPlanImplToJson(
      this,
    );
  }
}

abstract class _DayPlan implements DayPlan {
  const factory _DayPlan(
      {required final int dayOfWeek,
      required final List<PlannedMeal> meals}) = _$DayPlanImpl;

  factory _DayPlan.fromJson(Map<String, dynamic> json) = _$DayPlanImpl.fromJson;

  @override
  int get dayOfWeek;
  @override
  List<PlannedMeal> get meals;

  /// Create a copy of DayPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayPlanImplCopyWith<_$DayPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlannedMeal _$PlannedMealFromJson(Map<String, dynamic> json) {
  return _PlannedMeal.fromJson(json);
}

/// @nodoc
mixin _$PlannedMeal {
  String get id => throw _privateConstructorUsedError;
  MealType get mealType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<PlannedFoodItem> get items => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get prepTimeMinutes => throw _privateConstructorUsedError;

  /// Serializes this PlannedMeal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannedMeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannedMealCopyWith<PlannedMeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannedMealCopyWith<$Res> {
  factory $PlannedMealCopyWith(
          PlannedMeal value, $Res Function(PlannedMeal) then) =
      _$PlannedMealCopyWithImpl<$Res, PlannedMeal>;
  @useResult
  $Res call(
      {String id,
      MealType mealType,
      String name,
      List<PlannedFoodItem> items,
      String? notes,
      int prepTimeMinutes});
}

/// @nodoc
class _$PlannedMealCopyWithImpl<$Res, $Val extends PlannedMeal>
    implements $PlannedMealCopyWith<$Res> {
  _$PlannedMealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannedMeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealType = null,
    Object? name = null,
    Object? items = null,
    Object? notes = freezed,
    Object? prepTimeMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PlannedFoodItem>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      prepTimeMinutes: null == prepTimeMinutes
          ? _value.prepTimeMinutes
          : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannedMealImplCopyWith<$Res>
    implements $PlannedMealCopyWith<$Res> {
  factory _$$PlannedMealImplCopyWith(
          _$PlannedMealImpl value, $Res Function(_$PlannedMealImpl) then) =
      __$$PlannedMealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MealType mealType,
      String name,
      List<PlannedFoodItem> items,
      String? notes,
      int prepTimeMinutes});
}

/// @nodoc
class __$$PlannedMealImplCopyWithImpl<$Res>
    extends _$PlannedMealCopyWithImpl<$Res, _$PlannedMealImpl>
    implements _$$PlannedMealImplCopyWith<$Res> {
  __$$PlannedMealImplCopyWithImpl(
      _$PlannedMealImpl _value, $Res Function(_$PlannedMealImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannedMeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mealType = null,
    Object? name = null,
    Object? items = null,
    Object? notes = freezed,
    Object? prepTimeMinutes = null,
  }) {
    return _then(_$PlannedMealImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PlannedFoodItem>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      prepTimeMinutes: null == prepTimeMinutes
          ? _value.prepTimeMinutes
          : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannedMealImpl implements _PlannedMeal {
  const _$PlannedMealImpl(
      {required this.id,
      required this.mealType,
      required this.name,
      required final List<PlannedFoodItem> items,
      this.notes,
      this.prepTimeMinutes = 0})
      : _items = items;

  factory _$PlannedMealImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannedMealImplFromJson(json);

  @override
  final String id;
  @override
  final MealType mealType;
  @override
  final String name;
  final List<PlannedFoodItem> _items;
  @override
  List<PlannedFoodItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? notes;
  @override
  @JsonKey()
  final int prepTimeMinutes;

  @override
  String toString() {
    return 'PlannedMeal(id: $id, mealType: $mealType, name: $name, items: $items, notes: $notes, prepTimeMinutes: $prepTimeMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannedMealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.prepTimeMinutes, prepTimeMinutes) ||
                other.prepTimeMinutes == prepTimeMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mealType, name,
      const DeepCollectionEquality().hash(_items), notes, prepTimeMinutes);

  /// Create a copy of PlannedMeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannedMealImplCopyWith<_$PlannedMealImpl> get copyWith =>
      __$$PlannedMealImplCopyWithImpl<_$PlannedMealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannedMealImplToJson(
      this,
    );
  }
}

abstract class _PlannedMeal implements PlannedMeal {
  const factory _PlannedMeal(
      {required final String id,
      required final MealType mealType,
      required final String name,
      required final List<PlannedFoodItem> items,
      final String? notes,
      final int prepTimeMinutes}) = _$PlannedMealImpl;

  factory _PlannedMeal.fromJson(Map<String, dynamic> json) =
      _$PlannedMealImpl.fromJson;

  @override
  String get id;
  @override
  MealType get mealType;
  @override
  String get name;
  @override
  List<PlannedFoodItem> get items;
  @override
  String? get notes;
  @override
  int get prepTimeMinutes;

  /// Create a copy of PlannedMeal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannedMealImplCopyWith<_$PlannedMealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlannedFoodItem _$PlannedFoodItemFromJson(Map<String, dynamic> json) {
  return _PlannedFoodItem.fromJson(json);
}

/// @nodoc
mixin _$PlannedFoodItem {
  FoodItem get foodItem => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  /// Serializes this PlannedFoodItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannedFoodItemCopyWith<PlannedFoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannedFoodItemCopyWith<$Res> {
  factory $PlannedFoodItemCopyWith(
          PlannedFoodItem value, $Res Function(PlannedFoodItem) then) =
      _$PlannedFoodItemCopyWithImpl<$Res, PlannedFoodItem>;
  @useResult
  $Res call({FoodItem foodItem, double quantity});

  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$PlannedFoodItemCopyWithImpl<$Res, $Val extends PlannedFoodItem>
    implements $PlannedFoodItemCopyWith<$Res> {
  _$PlannedFoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodItem = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodItemCopyWith<$Res> get foodItem {
    return $FoodItemCopyWith<$Res>(_value.foodItem, (value) {
      return _then(_value.copyWith(foodItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlannedFoodItemImplCopyWith<$Res>
    implements $PlannedFoodItemCopyWith<$Res> {
  factory _$$PlannedFoodItemImplCopyWith(_$PlannedFoodItemImpl value,
          $Res Function(_$PlannedFoodItemImpl) then) =
      __$$PlannedFoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodItem foodItem, double quantity});

  @override
  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$PlannedFoodItemImplCopyWithImpl<$Res>
    extends _$PlannedFoodItemCopyWithImpl<$Res, _$PlannedFoodItemImpl>
    implements _$$PlannedFoodItemImplCopyWith<$Res> {
  __$$PlannedFoodItemImplCopyWithImpl(
      _$PlannedFoodItemImpl _value, $Res Function(_$PlannedFoodItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodItem = null,
    Object? quantity = null,
  }) {
    return _then(_$PlannedFoodItemImpl(
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannedFoodItemImpl implements _PlannedFoodItem {
  const _$PlannedFoodItemImpl({required this.foodItem, required this.quantity});

  factory _$PlannedFoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannedFoodItemImplFromJson(json);

  @override
  final FoodItem foodItem;
  @override
  final double quantity;

  @override
  String toString() {
    return 'PlannedFoodItem(foodItem: $foodItem, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannedFoodItemImpl &&
            (identical(other.foodItem, foodItem) ||
                other.foodItem == foodItem) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, foodItem, quantity);

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannedFoodItemImplCopyWith<_$PlannedFoodItemImpl> get copyWith =>
      __$$PlannedFoodItemImplCopyWithImpl<_$PlannedFoodItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannedFoodItemImplToJson(
      this,
    );
  }
}

abstract class _PlannedFoodItem implements PlannedFoodItem {
  const factory _PlannedFoodItem(
      {required final FoodItem foodItem,
      required final double quantity}) = _$PlannedFoodItemImpl;

  factory _PlannedFoodItem.fromJson(Map<String, dynamic> json) =
      _$PlannedFoodItemImpl.fromJson;

  @override
  FoodItem get foodItem;
  @override
  double get quantity;

  /// Create a copy of PlannedFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannedFoodItemImplCopyWith<_$PlannedFoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroceryItem _$GroceryItemFromJson(Map<String, dynamic> json) {
  return _GroceryItem.fromJson(json);
}

/// @nodoc
mixin _$GroceryItem {
  String get name => throw _privateConstructorUsedError;
  double get totalQuantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  bool get purchased => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Serializes this GroceryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroceryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroceryItemCopyWith<GroceryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryItemCopyWith<$Res> {
  factory $GroceryItemCopyWith(
          GroceryItem value, $Res Function(GroceryItem) then) =
      _$GroceryItemCopyWithImpl<$Res, GroceryItem>;
  @useResult
  $Res call(
      {String name,
      double totalQuantity,
      String unit,
      bool purchased,
      String category});
}

/// @nodoc
class _$GroceryItemCopyWithImpl<$Res, $Val extends GroceryItem>
    implements $GroceryItemCopyWith<$Res> {
  _$GroceryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroceryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalQuantity = null,
    Object? unit = null,
    Object? purchased = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      purchased: null == purchased
          ? _value.purchased
          : purchased // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroceryItemImplCopyWith<$Res>
    implements $GroceryItemCopyWith<$Res> {
  factory _$$GroceryItemImplCopyWith(
          _$GroceryItemImpl value, $Res Function(_$GroceryItemImpl) then) =
      __$$GroceryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double totalQuantity,
      String unit,
      bool purchased,
      String category});
}

/// @nodoc
class __$$GroceryItemImplCopyWithImpl<$Res>
    extends _$GroceryItemCopyWithImpl<$Res, _$GroceryItemImpl>
    implements _$$GroceryItemImplCopyWith<$Res> {
  __$$GroceryItemImplCopyWithImpl(
      _$GroceryItemImpl _value, $Res Function(_$GroceryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroceryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? totalQuantity = null,
    Object? unit = null,
    Object? purchased = null,
    Object? category = null,
  }) {
    return _then(_$GroceryItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      purchased: null == purchased
          ? _value.purchased
          : purchased // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroceryItemImpl implements _GroceryItem {
  const _$GroceryItemImpl(
      {required this.name,
      required this.totalQuantity,
      required this.unit,
      this.purchased = false,
      this.category = ''});

  factory _$GroceryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroceryItemImplFromJson(json);

  @override
  final String name;
  @override
  final double totalQuantity;
  @override
  final String unit;
  @override
  @JsonKey()
  final bool purchased;
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'GroceryItem(name: $name, totalQuantity: $totalQuantity, unit: $unit, purchased: $purchased, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceryItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.purchased, purchased) ||
                other.purchased == purchased) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, totalQuantity, unit, purchased, category);

  /// Create a copy of GroceryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceryItemImplCopyWith<_$GroceryItemImpl> get copyWith =>
      __$$GroceryItemImplCopyWithImpl<_$GroceryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroceryItemImplToJson(
      this,
    );
  }
}

abstract class _GroceryItem implements GroceryItem {
  const factory _GroceryItem(
      {required final String name,
      required final double totalQuantity,
      required final String unit,
      final bool purchased,
      final String category}) = _$GroceryItemImpl;

  factory _GroceryItem.fromJson(Map<String, dynamic> json) =
      _$GroceryItemImpl.fromJson;

  @override
  String get name;
  @override
  double get totalQuantity;
  @override
  String get unit;
  @override
  bool get purchased;
  @override
  String get category;

  /// Create a copy of GroceryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroceryItemImplCopyWith<_$GroceryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
