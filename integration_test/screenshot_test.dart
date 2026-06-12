import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_nutrition_tracker/screens/dashboard_screen.dart';
import 'package:flutter_nutrition_tracker/screens/food_log_screen.dart';
import 'package:flutter_nutrition_tracker/screens/progress_screen.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> shoot(WidgetTester tester, String name) async {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot(name);
  }

  Map<String, dynamic> food(
    String id,
    String name,
    String brand,
    double cal,
    double pro,
    double carb,
    double fat, {
    double fiber = 0,
  }) {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'servingSize': 100.0,
      'servingUnit': 'g',
      'source': 'seed',
      'tags': <String>[],
      'nutrition': {
        'calories': cal,
        'protein': pro,
        'carbs': carb,
        'fat': fat,
        'fiber': fiber,
        'sugar': 0,
        'saturatedFat': 0,
        'sodium': 0,
        'cholesterol': 0,
        'potassium': 0,
        'vitaminA': 0,
        'vitaminC': 0,
        'calcium': 0,
        'iron': 0,
      },
    };
  }

  Map<String, dynamic> logEntry(
    String id,
    Map<String, dynamic> foodItem,
    double quantity,
    String mealType,
    DateTime loggedAt,
  ) {
    return {
      'id': id,
      'foodItem': foodItem,
      'quantity': quantity,
      'mealType': mealType,
      'loggedAt': loggedAt.toIso8601String(),
    };
  }

  setUpAll(() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/hive_shots');

    final foodLog = await Hive.openBox('food_log');
    final mealPlans = await Hive.openBox('meal_plans');
    final weightLogs = await Hive.openBox('weight_logs');
    final favorites = await Hive.openBox('favorites');
    final settings = await Hive.openBox('settings');

    await foodLog.clear();
    await weightLogs.clear();
    await favorites.clear();

    final now = DateTime.now();
    DateTime today(int h, int m) =>
        DateTime(now.year, now.month, now.day, h, m);

    // Seed today's food log so the dashboard shows real macro progress.
    final entries = [
      logEntry(
        'e1',
        food('f1', 'Greek Yogurt with Berries', 'Chobani', 180, 18, 22, 4,
            fiber: 3),
        1.0,
        'breakfast',
        today(8, 15),
      ),
      logEntry(
        'e2',
        food('f2', 'Grilled Chicken Salad', 'Sweetgreen', 420, 38, 24, 18,
            fiber: 6),
        1.0,
        'lunch',
        today(12, 40),
      ),
      logEntry(
        'e3',
        food('f3', 'Almonds', 'Blue Diamond', 164, 6, 6, 14, fiber: 4),
        1.0,
        'snack',
        today(15, 30),
      ),
      logEntry(
        'e4',
        food('f4', 'Salmon with Quinoa', 'Homemade', 560, 42, 40, 26, fiber: 5),
        1.0,
        'dinner',
        today(19, 10),
      ),
    ];
    for (final e in entries) {
      await foodLog.put(e['id'], e);
    }

    // Seed favorites for the Food Log favorites tab.
    await favorites.put('f1', food('f1', 'Greek Yogurt with Berries',
        'Chobani', 180, 18, 22, 4, fiber: 3));
    await favorites.put('f2', food('f2', 'Grilled Chicken Salad', 'Sweetgreen',
        420, 38, 24, 18, fiber: 6));

    // Seed a multi-week weight log so the Progress chart renders a trend.
    final weights = [
      [0, 82.4, 24.5, 88.0, 102.0],
      [7, 81.8, 24.1, 87.2, 101.5],
      [14, 81.1, 23.6, 86.5, 101.0],
      [21, 80.5, 23.0, 85.8, 100.6],
      [28, 79.9, 22.5, 85.0, 100.2],
      [35, 79.3, 22.1, 84.3, 99.8],
    ];
    for (var i = 0; i < weights.length; i++) {
      final w = weights[i];
      final date = now.subtract(Duration(days: 35 - (w[0] as int)));
      await weightLogs.put('w$i', {
        'id': 'w$i',
        'date': date.toIso8601String(),
        'weight': w[1],
        'bodyFat': w[2],
        'waist': w[3],
        'chest': w[4],
        'arms': null,
        'notes': i == weights.length - 1 ? 'Feeling strong this week' : null,
      });
    }

    // ignore: unused_local_variable
    final _ = [mealPlans, settings];
  });

  testWidgets('capture nutrition tracker flow', (tester) async {
    // Dashboard: calorie ring + macro rings + recent entries.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: DashboardScreen()),
      ),
    );
    await tester.pumpAndSettle();
    await shoot(tester, '01-dashboard');

    // Food Log: populated Today tab with logged meals.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: FoodLogScreen()),
      ),
    );
    await tester.pumpAndSettle();
    // Switch to the "Today" tab which lists today's entries.
    await tester.tap(find.text('Today'));
    await tester.pumpAndSettle();
    await shoot(tester, '02-food-log');

    // Progress: weight trend line chart + stats + log.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: ProgressScreen()),
      ),
    );
    await tester.pumpAndSettle();
    await shoot(tester, '03-progress');
  });
}
