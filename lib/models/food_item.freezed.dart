// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
mixin _$FoodItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  double get servingSize => throw _privateConstructorUsedError;
  String get servingUnit => throw _privateConstructorUsedError;
  NutritionInfo get nutrition => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this FoodItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res, FoodItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      String brand,
      double servingSize,
      String servingUnit,
      NutritionInfo nutrition,
      String? barcode,
      String? imageUrl,
      String source,
      List<String> tags});

  $NutritionInfoCopyWith<$Res> get nutrition;
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res, $Val extends FoodItem>
    implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? servingSize = null,
    Object? servingUnit = null,
    Object? nutrition = null,
    Object? barcode = freezed,
    Object? imageUrl = freezed,
    Object? source = null,
    Object? tags = null,
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
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      servingSize: null == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double,
      servingUnit: null == servingUnit
          ? _value.servingUnit
          : servingUnit // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as NutritionInfo,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionInfoCopyWith<$Res> get nutrition {
    return $NutritionInfoCopyWith<$Res>(_value.nutrition, (value) {
      return _then(_value.copyWith(nutrition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodItemImplCopyWith<$Res>
    implements $FoodItemCopyWith<$Res> {
  factory _$$FoodItemImplCopyWith(
          _$FoodItemImpl value, $Res Function(_$FoodItemImpl) then) =
      __$$FoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String brand,
      double servingSize,
      String servingUnit,
      NutritionInfo nutrition,
      String? barcode,
      String? imageUrl,
      String source,
      List<String> tags});

  @override
  $NutritionInfoCopyWith<$Res> get nutrition;
}

/// @nodoc
class __$$FoodItemImplCopyWithImpl<$Res>
    extends _$FoodItemCopyWithImpl<$Res, _$FoodItemImpl>
    implements _$$FoodItemImplCopyWith<$Res> {
  __$$FoodItemImplCopyWithImpl(
      _$FoodItemImpl _value, $Res Function(_$FoodItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? servingSize = null,
    Object? servingUnit = null,
    Object? nutrition = null,
    Object? barcode = freezed,
    Object? imageUrl = freezed,
    Object? source = null,
    Object? tags = null,
  }) {
    return _then(_$FoodItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      servingSize: null == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double,
      servingUnit: null == servingUnit
          ? _value.servingUnit
          : servingUnit // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as NutritionInfo,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodItemImpl implements _FoodItem {
  const _$FoodItemImpl(
      {required this.id,
      required this.name,
      required this.brand,
      required this.servingSize,
      this.servingUnit = 'g',
      required this.nutrition,
      this.barcode,
      this.imageUrl,
      this.source = 'generic',
      final List<String> tags = const []})
      : _tags = tags;

  factory _$FoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String brand;
  @override
  final double servingSize;
  @override
  @JsonKey()
  final String servingUnit;
  @override
  final NutritionInfo nutrition;
  @override
  final String? barcode;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String source;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'FoodItem(id: $id, name: $name, brand: $brand, servingSize: $servingSize, servingUnit: $servingUnit, nutrition: $nutrition, barcode: $barcode, imageUrl: $imageUrl, source: $source, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.servingUnit, servingUnit) ||
                other.servingUnit == servingUnit) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      brand,
      servingSize,
      servingUnit,
      nutrition,
      barcode,
      imageUrl,
      source,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      __$$FoodItemImplCopyWithImpl<_$FoodItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodItemImplToJson(
      this,
    );
  }
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {required final String id,
      required final String name,
      required final String brand,
      required final double servingSize,
      final String servingUnit,
      required final NutritionInfo nutrition,
      final String? barcode,
      final String? imageUrl,
      final String source,
      final List<String> tags}) = _$FoodItemImpl;

  factory _FoodItem.fromJson(Map<String, dynamic> json) =
      _$FoodItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get brand;
  @override
  double get servingSize;
  @override
  String get servingUnit;
  @override
  NutritionInfo get nutrition;
  @override
  String? get barcode;
  @override
  String? get imageUrl;
  @override
  String get source;
  @override
  List<String> get tags;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionInfo _$NutritionInfoFromJson(Map<String, dynamic> json) {
  return _NutritionInfo.fromJson(json);
}

/// @nodoc
mixin _$NutritionInfo {
  double get calories => throw _privateConstructorUsedError;
  double get protein => throw _privateConstructorUsedError;
  double get carbs => throw _privateConstructorUsedError;
  double get fat => throw _privateConstructorUsedError;
  double get fiber => throw _privateConstructorUsedError;
  double get sugar => throw _privateConstructorUsedError;
  double get saturatedFat => throw _privateConstructorUsedError;
  double get sodium => throw _privateConstructorUsedError;
  double get cholesterol => throw _privateConstructorUsedError;
  double get potassium => throw _privateConstructorUsedError;
  double get vitaminA => throw _privateConstructorUsedError;
  double get vitaminC => throw _privateConstructorUsedError;
  double get calcium => throw _privateConstructorUsedError;
  double get iron => throw _privateConstructorUsedError;

  /// Serializes this NutritionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionInfoCopyWith<NutritionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionInfoCopyWith<$Res> {
  factory $NutritionInfoCopyWith(
          NutritionInfo value, $Res Function(NutritionInfo) then) =
      _$NutritionInfoCopyWithImpl<$Res, NutritionInfo>;
  @useResult
  $Res call(
      {double calories,
      double protein,
      double carbs,
      double fat,
      double fiber,
      double sugar,
      double saturatedFat,
      double sodium,
      double cholesterol,
      double potassium,
      double vitaminA,
      double vitaminC,
      double calcium,
      double iron});
}

/// @nodoc
class _$NutritionInfoCopyWithImpl<$Res, $Val extends NutritionInfo>
    implements $NutritionInfoCopyWith<$Res> {
  _$NutritionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? fiber = null,
    Object? sugar = null,
    Object? saturatedFat = null,
    Object? sodium = null,
    Object? cholesterol = null,
    Object? potassium = null,
    Object? vitaminA = null,
    Object? vitaminC = null,
    Object? calcium = null,
    Object? iron = null,
  }) {
    return _then(_value.copyWith(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      sugar: null == sugar
          ? _value.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double,
      saturatedFat: null == saturatedFat
          ? _value.saturatedFat
          : saturatedFat // ignore: cast_nullable_to_non_nullable
              as double,
      sodium: null == sodium
          ? _value.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double,
      cholesterol: null == cholesterol
          ? _value.cholesterol
          : cholesterol // ignore: cast_nullable_to_non_nullable
              as double,
      potassium: null == potassium
          ? _value.potassium
          : potassium // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminA: null == vitaminA
          ? _value.vitaminA
          : vitaminA // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminC: null == vitaminC
          ? _value.vitaminC
          : vitaminC // ignore: cast_nullable_to_non_nullable
              as double,
      calcium: null == calcium
          ? _value.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double,
      iron: null == iron
          ? _value.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionInfoImplCopyWith<$Res>
    implements $NutritionInfoCopyWith<$Res> {
  factory _$$NutritionInfoImplCopyWith(
          _$NutritionInfoImpl value, $Res Function(_$NutritionInfoImpl) then) =
      __$$NutritionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double calories,
      double protein,
      double carbs,
      double fat,
      double fiber,
      double sugar,
      double saturatedFat,
      double sodium,
      double cholesterol,
      double potassium,
      double vitaminA,
      double vitaminC,
      double calcium,
      double iron});
}

/// @nodoc
class __$$NutritionInfoImplCopyWithImpl<$Res>
    extends _$NutritionInfoCopyWithImpl<$Res, _$NutritionInfoImpl>
    implements _$$NutritionInfoImplCopyWith<$Res> {
  __$$NutritionInfoImplCopyWithImpl(
      _$NutritionInfoImpl _value, $Res Function(_$NutritionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? fiber = null,
    Object? sugar = null,
    Object? saturatedFat = null,
    Object? sodium = null,
    Object? cholesterol = null,
    Object? potassium = null,
    Object? vitaminA = null,
    Object? vitaminC = null,
    Object? calcium = null,
    Object? iron = null,
  }) {
    return _then(_$NutritionInfoImpl(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      sugar: null == sugar
          ? _value.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as double,
      saturatedFat: null == saturatedFat
          ? _value.saturatedFat
          : saturatedFat // ignore: cast_nullable_to_non_nullable
              as double,
      sodium: null == sodium
          ? _value.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double,
      cholesterol: null == cholesterol
          ? _value.cholesterol
          : cholesterol // ignore: cast_nullable_to_non_nullable
              as double,
      potassium: null == potassium
          ? _value.potassium
          : potassium // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminA: null == vitaminA
          ? _value.vitaminA
          : vitaminA // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminC: null == vitaminC
          ? _value.vitaminC
          : vitaminC // ignore: cast_nullable_to_non_nullable
              as double,
      calcium: null == calcium
          ? _value.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double,
      iron: null == iron
          ? _value.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionInfoImpl implements _NutritionInfo {
  const _$NutritionInfoImpl(
      {required this.calories,
      required this.protein,
      required this.carbs,
      required this.fat,
      this.fiber = 0,
      this.sugar = 0,
      this.saturatedFat = 0,
      this.sodium = 0,
      this.cholesterol = 0,
      this.potassium = 0,
      this.vitaminA = 0,
      this.vitaminC = 0,
      this.calcium = 0,
      this.iron = 0});

  factory _$NutritionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionInfoImplFromJson(json);

  @override
  final double calories;
  @override
  final double protein;
  @override
  final double carbs;
  @override
  final double fat;
  @override
  @JsonKey()
  final double fiber;
  @override
  @JsonKey()
  final double sugar;
  @override
  @JsonKey()
  final double saturatedFat;
  @override
  @JsonKey()
  final double sodium;
  @override
  @JsonKey()
  final double cholesterol;
  @override
  @JsonKey()
  final double potassium;
  @override
  @JsonKey()
  final double vitaminA;
  @override
  @JsonKey()
  final double vitaminC;
  @override
  @JsonKey()
  final double calcium;
  @override
  @JsonKey()
  final double iron;

  @override
  String toString() {
    return 'NutritionInfo(calories: $calories, protein: $protein, carbs: $carbs, fat: $fat, fiber: $fiber, sugar: $sugar, saturatedFat: $saturatedFat, sodium: $sodium, cholesterol: $cholesterol, potassium: $potassium, vitaminA: $vitaminA, vitaminC: $vitaminC, calcium: $calcium, iron: $iron)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionInfoImpl &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.fiber, fiber) || other.fiber == fiber) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            (identical(other.saturatedFat, saturatedFat) ||
                other.saturatedFat == saturatedFat) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.cholesterol, cholesterol) ||
                other.cholesterol == cholesterol) &&
            (identical(other.potassium, potassium) ||
                other.potassium == potassium) &&
            (identical(other.vitaminA, vitaminA) ||
                other.vitaminA == vitaminA) &&
            (identical(other.vitaminC, vitaminC) ||
                other.vitaminC == vitaminC) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.iron, iron) || other.iron == iron));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      calories,
      protein,
      carbs,
      fat,
      fiber,
      sugar,
      saturatedFat,
      sodium,
      cholesterol,
      potassium,
      vitaminA,
      vitaminC,
      calcium,
      iron);

  /// Create a copy of NutritionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionInfoImplCopyWith<_$NutritionInfoImpl> get copyWith =>
      __$$NutritionInfoImplCopyWithImpl<_$NutritionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionInfoImplToJson(
      this,
    );
  }
}

abstract class _NutritionInfo implements NutritionInfo {
  const factory _NutritionInfo(
      {required final double calories,
      required final double protein,
      required final double carbs,
      required final double fat,
      final double fiber,
      final double sugar,
      final double saturatedFat,
      final double sodium,
      final double cholesterol,
      final double potassium,
      final double vitaminA,
      final double vitaminC,
      final double calcium,
      final double iron}) = _$NutritionInfoImpl;

  factory _NutritionInfo.fromJson(Map<String, dynamic> json) =
      _$NutritionInfoImpl.fromJson;

  @override
  double get calories;
  @override
  double get protein;
  @override
  double get carbs;
  @override
  double get fat;
  @override
  double get fiber;
  @override
  double get sugar;
  @override
  double get saturatedFat;
  @override
  double get sodium;
  @override
  double get cholesterol;
  @override
  double get potassium;
  @override
  double get vitaminA;
  @override
  double get vitaminC;
  @override
  double get calcium;
  @override
  double get iron;

  /// Create a copy of NutritionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionInfoImplCopyWith<_$NutritionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FoodLogEntry _$FoodLogEntryFromJson(Map<String, dynamic> json) {
  return _FoodLogEntry.fromJson(json);
}

/// @nodoc
mixin _$FoodLogEntry {
  String get id => throw _privateConstructorUsedError;
  FoodItem get foodItem => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  MealType get mealType => throw _privateConstructorUsedError;
  DateTime get loggedAt => throw _privateConstructorUsedError;

  /// Serializes this FoodLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodLogEntryCopyWith<FoodLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodLogEntryCopyWith<$Res> {
  factory $FoodLogEntryCopyWith(
          FoodLogEntry value, $Res Function(FoodLogEntry) then) =
      _$FoodLogEntryCopyWithImpl<$Res, FoodLogEntry>;
  @useResult
  $Res call(
      {String id,
      FoodItem foodItem,
      double quantity,
      MealType mealType,
      DateTime loggedAt});

  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$FoodLogEntryCopyWithImpl<$Res, $Val extends FoodLogEntry>
    implements $FoodLogEntryCopyWith<$Res> {
  _$FoodLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodItem = null,
    Object? quantity = null,
    Object? mealType = null,
    Object? loggedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      loggedAt: null == loggedAt
          ? _value.loggedAt
          : loggedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of FoodLogEntry
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
abstract class _$$FoodLogEntryImplCopyWith<$Res>
    implements $FoodLogEntryCopyWith<$Res> {
  factory _$$FoodLogEntryImplCopyWith(
          _$FoodLogEntryImpl value, $Res Function(_$FoodLogEntryImpl) then) =
      __$$FoodLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FoodItem foodItem,
      double quantity,
      MealType mealType,
      DateTime loggedAt});

  @override
  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$FoodLogEntryImplCopyWithImpl<$Res>
    extends _$FoodLogEntryCopyWithImpl<$Res, _$FoodLogEntryImpl>
    implements _$$FoodLogEntryImplCopyWith<$Res> {
  __$$FoodLogEntryImplCopyWithImpl(
      _$FoodLogEntryImpl _value, $Res Function(_$FoodLogEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodItem = null,
    Object? quantity = null,
    Object? mealType = null,
    Object? loggedAt = null,
  }) {
    return _then(_$FoodLogEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      loggedAt: null == loggedAt
          ? _value.loggedAt
          : loggedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodLogEntryImpl implements _FoodLogEntry {
  const _$FoodLogEntryImpl(
      {required this.id,
      required this.foodItem,
      required this.quantity,
      required this.mealType,
      required this.loggedAt});

  factory _$FoodLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodLogEntryImplFromJson(json);

  @override
  final String id;
  @override
  final FoodItem foodItem;
  @override
  final double quantity;
  @override
  final MealType mealType;
  @override
  final DateTime loggedAt;

  @override
  String toString() {
    return 'FoodLogEntry(id: $id, foodItem: $foodItem, quantity: $quantity, mealType: $mealType, loggedAt: $loggedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodLogEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.foodItem, foodItem) ||
                other.foodItem == foodItem) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.loggedAt, loggedAt) ||
                other.loggedAt == loggedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, foodItem, quantity, mealType, loggedAt);

  /// Create a copy of FoodLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodLogEntryImplCopyWith<_$FoodLogEntryImpl> get copyWith =>
      __$$FoodLogEntryImplCopyWithImpl<_$FoodLogEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodLogEntryImplToJson(
      this,
    );
  }
}

abstract class _FoodLogEntry implements FoodLogEntry {
  const factory _FoodLogEntry(
      {required final String id,
      required final FoodItem foodItem,
      required final double quantity,
      required final MealType mealType,
      required final DateTime loggedAt}) = _$FoodLogEntryImpl;

  factory _FoodLogEntry.fromJson(Map<String, dynamic> json) =
      _$FoodLogEntryImpl.fromJson;

  @override
  String get id;
  @override
  FoodItem get foodItem;
  @override
  double get quantity;
  @override
  MealType get mealType;
  @override
  DateTime get loggedAt;

  /// Create a copy of FoodLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodLogEntryImplCopyWith<_$FoodLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyNutritionSummary _$DailyNutritionSummaryFromJson(
    Map<String, dynamic> json) {
  return _DailyNutritionSummary.fromJson(json);
}

/// @nodoc
mixin _$DailyNutritionSummary {
  DateTime get date => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  double get totalProtein => throw _privateConstructorUsedError;
  double get totalCarbs => throw _privateConstructorUsedError;
  double get totalFat => throw _privateConstructorUsedError;
  double get totalFiber => throw _privateConstructorUsedError;
  int get calorieGoal => throw _privateConstructorUsedError;
  int get proteinGoal => throw _privateConstructorUsedError;
  int get carbsGoal => throw _privateConstructorUsedError;
  int get fatGoal => throw _privateConstructorUsedError;
  List<FoodLogEntry> get entries => throw _privateConstructorUsedError;

  /// Serializes this DailyNutritionSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyNutritionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyNutritionSummaryCopyWith<DailyNutritionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyNutritionSummaryCopyWith<$Res> {
  factory $DailyNutritionSummaryCopyWith(DailyNutritionSummary value,
          $Res Function(DailyNutritionSummary) then) =
      _$DailyNutritionSummaryCopyWithImpl<$Res, DailyNutritionSummary>;
  @useResult
  $Res call(
      {DateTime date,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      double totalFiber,
      int calorieGoal,
      int proteinGoal,
      int carbsGoal,
      int fatGoal,
      List<FoodLogEntry> entries});
}

/// @nodoc
class _$DailyNutritionSummaryCopyWithImpl<$Res,
        $Val extends DailyNutritionSummary>
    implements $DailyNutritionSummaryCopyWith<$Res> {
  _$DailyNutritionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyNutritionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? totalFiber = null,
    Object? calorieGoal = null,
    Object? proteinGoal = null,
    Object? carbsGoal = null,
    Object? fatGoal = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      totalFiber: null == totalFiber
          ? _value.totalFiber
          : totalFiber // ignore: cast_nullable_to_non_nullable
              as double,
      calorieGoal: null == calorieGoal
          ? _value.calorieGoal
          : calorieGoal // ignore: cast_nullable_to_non_nullable
              as int,
      proteinGoal: null == proteinGoal
          ? _value.proteinGoal
          : proteinGoal // ignore: cast_nullable_to_non_nullable
              as int,
      carbsGoal: null == carbsGoal
          ? _value.carbsGoal
          : carbsGoal // ignore: cast_nullable_to_non_nullable
              as int,
      fatGoal: null == fatGoal
          ? _value.fatGoal
          : fatGoal // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodLogEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyNutritionSummaryImplCopyWith<$Res>
    implements $DailyNutritionSummaryCopyWith<$Res> {
  factory _$$DailyNutritionSummaryImplCopyWith(
          _$DailyNutritionSummaryImpl value,
          $Res Function(_$DailyNutritionSummaryImpl) then) =
      __$$DailyNutritionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      double totalFiber,
      int calorieGoal,
      int proteinGoal,
      int carbsGoal,
      int fatGoal,
      List<FoodLogEntry> entries});
}

/// @nodoc
class __$$DailyNutritionSummaryImplCopyWithImpl<$Res>
    extends _$DailyNutritionSummaryCopyWithImpl<$Res,
        _$DailyNutritionSummaryImpl>
    implements _$$DailyNutritionSummaryImplCopyWith<$Res> {
  __$$DailyNutritionSummaryImplCopyWithImpl(_$DailyNutritionSummaryImpl _value,
      $Res Function(_$DailyNutritionSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyNutritionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? totalFiber = null,
    Object? calorieGoal = null,
    Object? proteinGoal = null,
    Object? carbsGoal = null,
    Object? fatGoal = null,
    Object? entries = null,
  }) {
    return _then(_$DailyNutritionSummaryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      totalFiber: null == totalFiber
          ? _value.totalFiber
          : totalFiber // ignore: cast_nullable_to_non_nullable
              as double,
      calorieGoal: null == calorieGoal
          ? _value.calorieGoal
          : calorieGoal // ignore: cast_nullable_to_non_nullable
              as int,
      proteinGoal: null == proteinGoal
          ? _value.proteinGoal
          : proteinGoal // ignore: cast_nullable_to_non_nullable
              as int,
      carbsGoal: null == carbsGoal
          ? _value.carbsGoal
          : carbsGoal // ignore: cast_nullable_to_non_nullable
              as int,
      fatGoal: null == fatGoal
          ? _value.fatGoal
          : fatGoal // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodLogEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyNutritionSummaryImpl implements _DailyNutritionSummary {
  const _$DailyNutritionSummaryImpl(
      {required this.date,
      required this.totalCalories,
      required this.totalProtein,
      required this.totalCarbs,
      required this.totalFat,
      required this.totalFiber,
      required this.calorieGoal,
      required this.proteinGoal,
      required this.carbsGoal,
      required this.fatGoal,
      required final List<FoodLogEntry> entries})
      : _entries = entries;

  factory _$DailyNutritionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyNutritionSummaryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double totalCalories;
  @override
  final double totalProtein;
  @override
  final double totalCarbs;
  @override
  final double totalFat;
  @override
  final double totalFiber;
  @override
  final int calorieGoal;
  @override
  final int proteinGoal;
  @override
  final int carbsGoal;
  @override
  final int fatGoal;
  final List<FoodLogEntry> _entries;
  @override
  List<FoodLogEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'DailyNutritionSummary(date: $date, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, totalFiber: $totalFiber, calorieGoal: $calorieGoal, proteinGoal: $proteinGoal, carbsGoal: $carbsGoal, fatGoal: $fatGoal, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyNutritionSummaryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(other.totalFiber, totalFiber) ||
                other.totalFiber == totalFiber) &&
            (identical(other.calorieGoal, calorieGoal) ||
                other.calorieGoal == calorieGoal) &&
            (identical(other.proteinGoal, proteinGoal) ||
                other.proteinGoal == proteinGoal) &&
            (identical(other.carbsGoal, carbsGoal) ||
                other.carbsGoal == carbsGoal) &&
            (identical(other.fatGoal, fatGoal) || other.fatGoal == fatGoal) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      totalCalories,
      totalProtein,
      totalCarbs,
      totalFat,
      totalFiber,
      calorieGoal,
      proteinGoal,
      carbsGoal,
      fatGoal,
      const DeepCollectionEquality().hash(_entries));

  /// Create a copy of DailyNutritionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyNutritionSummaryImplCopyWith<_$DailyNutritionSummaryImpl>
      get copyWith => __$$DailyNutritionSummaryImplCopyWithImpl<
          _$DailyNutritionSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyNutritionSummaryImplToJson(
      this,
    );
  }
}

abstract class _DailyNutritionSummary implements DailyNutritionSummary {
  const factory _DailyNutritionSummary(
      {required final DateTime date,
      required final double totalCalories,
      required final double totalProtein,
      required final double totalCarbs,
      required final double totalFat,
      required final double totalFiber,
      required final int calorieGoal,
      required final int proteinGoal,
      required final int carbsGoal,
      required final int fatGoal,
      required final List<FoodLogEntry> entries}) = _$DailyNutritionSummaryImpl;

  factory _DailyNutritionSummary.fromJson(Map<String, dynamic> json) =
      _$DailyNutritionSummaryImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get totalCalories;
  @override
  double get totalProtein;
  @override
  double get totalCarbs;
  @override
  double get totalFat;
  @override
  double get totalFiber;
  @override
  int get calorieGoal;
  @override
  int get proteinGoal;
  @override
  int get carbsGoal;
  @override
  int get fatGoal;
  @override
  List<FoodLogEntry> get entries;

  /// Create a copy of DailyNutritionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyNutritionSummaryImplCopyWith<_$DailyNutritionSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
