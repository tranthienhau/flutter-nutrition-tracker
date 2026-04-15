import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../models/food_item.dart';

const _uuid = Uuid();

/// Service for food database lookups using Open Food Facts and USDA FoodData Central APIs.
class NutritionDatabaseService {
  static const String _openFoodFactsBaseUrl =
      'https://world.openfoodfacts.org/api/v2';
  static const String _usdaBaseUrl = 'https://api.nal.usda.gov/fdc/v1';
  static const String _usdaApiKey = 'DEMO_KEY'; // Replace with real key

  /// Search foods by name query. Queries Open Food Facts first, falls back to USDA.
  static Future<List<FoodItem>> searchFood(String query,
      {int pageSize = 20}) async {
    final results = <FoodItem>[];

    // Try Open Food Facts first
    try {
      final offResults = await _searchOpenFoodFacts(query, pageSize: pageSize);
      results.addAll(offResults);
    } catch (_) {}

    // Supplement with USDA if we have fewer results
    if (results.length < pageSize) {
      try {
        final usdaResults = await _searchUSDA(query,
            pageSize: pageSize - results.length);
        results.addAll(usdaResults);
      } catch (_) {}
    }

    return results;
  }

  /// Look up a food item by barcode using Open Food Facts.
  static Future<FoodItem?> lookupBarcode(String barcode) async {
    try {
      final url = Uri.parse('$_openFoodFactsBaseUrl/product/$barcode.json');
      final response = await http.get(url, headers: {
        'User-Agent': 'NutritionTracker/1.0',
      });

      if (response.statusCode != 200) return null;

      final data = json.decode(response.body);
      if (data['status'] != 1) return null;

      final product = data['product'];
      return _parseOpenFoodFactsProduct(product);
    } catch (_) {
      return null;
    }
  }

  static Future<List<FoodItem>> _searchOpenFoodFacts(String query,
      {int pageSize = 20}) async {
    final url = Uri.parse(
      '$_openFoodFactsBaseUrl/search?search_terms=$query'
      '&search_simple=1&json=1&page_size=$pageSize'
      '&fields=product_name,brands,serving_quantity,nutriments,code,image_front_small_url',
    );

    final response = await http.get(url, headers: {
      'User-Agent': 'NutritionTracker/1.0',
    });

    if (response.statusCode != 200) return [];

    final data = json.decode(response.body);
    final products = data['products'] as List? ?? [];

    return products
        .map((p) => _parseOpenFoodFactsProduct(p))
        .whereType<FoodItem>()
        .toList();
  }

  static FoodItem? _parseOpenFoodFactsProduct(Map<String, dynamic> product) {
    final name = product['product_name'] as String?;
    if (name == null || name.isEmpty) return null;

    final nutriments = product['nutriments'] as Map<String, dynamic>? ?? {};

    return FoodItem(
      id: _uuid.v4(),
      name: name,
      brand: (product['brands'] as String?) ?? '',
      servingSize: (product['serving_quantity'] as num?)?.toDouble() ?? 100.0,
      servingUnit: 'g',
      barcode: product['code'] as String?,
      imageUrl: product['image_front_small_url'] as String?,
      source: 'openfoodfacts',
      nutrition: NutritionInfo(
        calories:
            (nutriments['energy-kcal_100g'] as num?)?.toDouble() ?? 0,
        protein: (nutriments['proteins_100g'] as num?)?.toDouble() ?? 0,
        carbs:
            (nutriments['carbohydrates_100g'] as num?)?.toDouble() ?? 0,
        fat: (nutriments['fat_100g'] as num?)?.toDouble() ?? 0,
        fiber: (nutriments['fiber_100g'] as num?)?.toDouble() ?? 0,
        sugar: (nutriments['sugars_100g'] as num?)?.toDouble() ?? 0,
        saturatedFat:
            (nutriments['saturated-fat_100g'] as num?)?.toDouble() ?? 0,
        sodium: (nutriments['sodium_100g'] as num?)?.toDouble() ?? 0,
      ),
    );
  }

  static Future<List<FoodItem>> _searchUSDA(String query,
      {int pageSize = 10}) async {
    final url = Uri.parse(
      '$_usdaBaseUrl/foods/search?api_key=$_usdaApiKey'
      '&query=$query&pageSize=$pageSize&dataType=Foundation,SR Legacy',
    );

    final response = await http.get(url);
    if (response.statusCode != 200) return [];

    final data = json.decode(response.body);
    final foods = data['foods'] as List? ?? [];

    return foods.map((food) => _parseUSDAFood(food)).toList();
  }

  static FoodItem _parseUSDAFood(Map<String, dynamic> food) {
    final nutrients = <String, double>{};
    for (final n in (food['foodNutrients'] as List? ?? [])) {
      final name = n['nutrientName'] as String? ?? '';
      final value = (n['value'] as num?)?.toDouble() ?? 0;
      nutrients[name] = value;
    }

    return FoodItem(
      id: _uuid.v4(),
      name: food['description'] ?? 'Unknown',
      brand: food['brandOwner'] ?? '',
      servingSize: 100.0,
      servingUnit: 'g',
      source: 'usda',
      nutrition: NutritionInfo(
        calories: nutrients['Energy'] ?? 0,
        protein: nutrients['Protein'] ?? 0,
        carbs: nutrients['Carbohydrate, by difference'] ?? 0,
        fat: nutrients['Total lipid (fat)'] ?? 0,
        fiber: nutrients['Fiber, total dietary'] ?? 0,
        sugar: nutrients['Sugars, total including NLEA'] ?? 0,
        saturatedFat: nutrients['Fatty acids, total saturated'] ?? 0,
        sodium: nutrients['Sodium, Na'] ?? 0,
        cholesterol: nutrients['Cholesterol'] ?? 0,
        potassium: nutrients['Potassium, K'] ?? 0,
        calcium: nutrients['Calcium, Ca'] ?? 0,
        iron: nutrients['Iron, Fe'] ?? 0,
        vitaminA: nutrients['Vitamin A, RAE'] ?? 0,
        vitaminC: nutrients['Vitamin C, total ascorbic acid'] ?? 0,
      ),
    );
  }
}
