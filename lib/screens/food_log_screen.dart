import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food_item.dart';
import '../providers/nutrition_provider.dart';
import '../services/barcode_scanner.dart';

class FoodLogScreen extends ConsumerStatefulWidget {
  const FoodLogScreen({super.key});

  @override
  ConsumerState<FoodLogScreen> createState() => _FoodLogScreenState();
}

class _FoodLogScreenState extends ConsumerState<FoodLogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  MealType _selectedMeal = MealType.lunch;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(foodSearchProvider);
    final favorites = ref.watch(favoritesProvider);
    final todayEntries = ref.watch(dailySummaryProvider).entries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Log'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Search'),
            Tab(text: 'Favorites'),
            Tab(text: 'Today'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Search tab
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        controller: _searchController,
                        hintText: 'Search foods...',
                        leading: const Icon(Icons.search),
                        trailing: [
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                ref
                                    .read(foodSearchProvider.notifier)
                                    .search('');
                              },
                            ),
                        ],
                        onSubmitted: (query) {
                          ref
                              .read(foodSearchProvider.notifier)
                              .search(query);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filledTonal(
                      icon: const Icon(Icons.qr_code_scanner),
                      onPressed: _scanBarcode,
                      tooltip: 'Scan barcode',
                    ),
                  ],
                ),
              ),
              // Meal type selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SegmentedButton<MealType>(
                  segments: MealType.values
                      .map((m) => ButtonSegment(
                            value: m,
                            label: Text(m.label),
                          ))
                      .toList(),
                  selected: {_selectedMeal},
                  onSelectionChanged: (sel) =>
                      setState(() => _selectedMeal = sel.first),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: searchResults.when(
                  data: (items) {
                    if (items.isEmpty && _searchController.text.isNotEmpty) {
                      return const Center(child: Text('No results found'));
                    }
                    if (items.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.search,
                                size: 64,
                                color: Theme.of(context).colorScheme.outline),
                            const SizedBox(height: 12),
                            const Text('Search for a food or scan a barcode'),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _FoodItemTile(
                          item: item,
                          onAdd: () => _addFood(item),
                          onFavorite: () =>
                              ref.read(favoritesProvider.notifier).toggle(item),
                          isFavorite:
                              ref.read(favoritesProvider.notifier).isFavorite(item.id),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          ),

          // Favorites tab
          favorites.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final item = favorites[index];
                    return _FoodItemTile(
                      item: item,
                      onAdd: () => _addFood(item),
                      onFavorite: () =>
                          ref.read(favoritesProvider.notifier).toggle(item),
                      isFavorite: true,
                    );
                  },
                ),

          // Today tab
          todayEntries.isEmpty
              ? const Center(child: Text('Nothing logged today'))
              : ListView.builder(
                  itemCount: todayEntries.length,
                  itemBuilder: (context, index) {
                    final entry = todayEntries[index];
                    final cal =
                        (entry.foodItem.nutrition.calories * entry.quantity)
                            .round();
                    return Dismissible(
                      key: Key(entry.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        ref.read(foodLogProvider.notifier).removeEntry(entry.id);
                      },
                      child: ListTile(
                        title: Text(entry.foodItem.name),
                        subtitle: Text(
                            '${entry.mealType.label} - ${entry.quantity}x serving'),
                        trailing: Text('$cal kcal'),
                      ),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showManualEntryDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Manual'),
      ),
    );
  }

  Future<void> _scanBarcode() async {
    final food = await BarcodeScannerService.scanAndLookup(context);
    if (food != null && mounted) {
      _showQuantityDialog(food);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product not found')),
      );
    }
  }

  void _addFood(FoodItem item) {
    _showQuantityDialog(item);
  }

  void _showQuantityDialog(FoodItem item) {
    final qtyCtrl = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${item.nutrition.calories.round()} kcal per ${item.servingSize}${item.servingUnit}'),
            Text(
                'P: ${item.nutrition.protein.round()}g  C: ${item.nutrition.carbs.round()}g  F: ${item.nutrition.fat.round()}g'),
            const SizedBox(height: 16),
            TextField(
              controller: qtyCtrl,
              decoration:
                  const InputDecoration(labelText: 'Number of servings'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final qty = double.tryParse(qtyCtrl.text) ?? 1;
              ref
                  .read(foodLogProvider.notifier)
                  .addEntry(item, qty, _selectedMeal);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added ${item.name}')),
              );
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showManualEntryDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final calCtrl = TextEditingController();
    final proCtrl = TextEditingController();
    final carbCtrl = TextEditingController();
    final fatCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Manual Entry'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Food name')),
              TextField(
                  controller: calCtrl,
                  decoration: const InputDecoration(labelText: 'Calories'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: proCtrl,
                  decoration: const InputDecoration(labelText: 'Protein (g)'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: carbCtrl,
                  decoration: const InputDecoration(labelText: 'Carbs (g)'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: fatCtrl,
                  decoration: const InputDecoration(labelText: 'Fat (g)'),
                  keyboardType: TextInputType.number),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final food = FoodItem(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: nameCtrl.text.isEmpty ? 'Custom food' : nameCtrl.text,
                brand: '',
                servingSize: 1,
                servingUnit: 'serving',
                source: 'manual',
                nutrition: NutritionInfo(
                  calories: double.tryParse(calCtrl.text) ?? 0,
                  protein: double.tryParse(proCtrl.text) ?? 0,
                  carbs: double.tryParse(carbCtrl.text) ?? 0,
                  fat: double.tryParse(fatCtrl.text) ?? 0,
                ),
              );
              ref
                  .read(foodLogProvider.notifier)
                  .addEntry(food, 1, _selectedMeal);
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _FoodItemTile extends StatelessWidget {
  final FoodItem item;
  final VoidCallback onAdd;
  final VoidCallback onFavorite;
  final bool isFavorite;

  const _FoodItemTile({
    required this.item,
    required this.onAdd,
    required this.onFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        '${item.nutrition.calories.round()} kcal | '
        'P:${item.nutrition.protein.round()}g '
        'C:${item.nutrition.carbs.round()}g '
        'F:${item.nutrition.fat.round()}g',
      ),
      leading: item.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(item.imageUrl!, width: 48, height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.fastfood, size: 32)),
            )
          : const CircleAvatar(child: Icon(Icons.fastfood)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: onFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
