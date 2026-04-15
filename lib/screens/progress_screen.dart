import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../providers/nutrition_provider.dart';

const _uuid = Uuid();

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightEntries = ref.watch(weightLogProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Weight chart
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weight Trend',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: weightEntries.length < 2
                        ? Center(
                            child: Text(
                              'Log at least 2 weigh-ins to see a chart',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: theme.colorScheme.outline),
                            ),
                          )
                        : _WeightChart(entries: weightEntries),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Stats summary
          if (weightEntries.isNotEmpty) ...[
            _StatsRow(entries: weightEntries),
            const SizedBox(height: 16),
          ],

          // Body measurements chart
          if (weightEntries.any((e) => e.waist != null)) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Measurements',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: _MeasurementsChart(entries: weightEntries),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Weight log entries
          Text('Weight Log',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          if (weightEntries.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Text(
                    'No weight entries yet.\nTap + to log your weight.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.outline),
                  ),
                ),
              ),
            )
          else
            ...weightEntries.map((entry) => Card(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${entry.weight.toStringAsFixed(1)}'),
                    ),
                    title: Text(
                        '${entry.weight.toStringAsFixed(1)} kg'
                        '${entry.bodyFat != null ? " - ${entry.bodyFat!.toStringAsFixed(1)}% BF" : ""}'),
                    subtitle: Text(DateFormat.yMMMd().format(entry.date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      onPressed: () =>
                          ref.read(weightLogProvider.notifier).remove(entry.id),
                    ),
                    onTap: () => _showEntryDetails(context, entry),
                  ),
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddWeightDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEntryDetails(BuildContext context, WeightEntry entry) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(DateFormat.yMMMMd().format(entry.date)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weight: ${entry.weight.toStringAsFixed(1)} kg'),
            if (entry.bodyFat != null)
              Text('Body Fat: ${entry.bodyFat!.toStringAsFixed(1)}%'),
            if (entry.waist != null)
              Text('Waist: ${entry.waist!.toStringAsFixed(1)} cm'),
            if (entry.chest != null)
              Text('Chest: ${entry.chest!.toStringAsFixed(1)} cm'),
            if (entry.arms != null)
              Text('Arms: ${entry.arms!.toStringAsFixed(1)} cm'),
            if (entry.notes != null && entry.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Notes: ${entry.notes}',
                    style: const TextStyle(fontStyle: FontStyle.italic)),
              ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
        ],
      ),
    );
  }

  void _showAddWeightDialog(BuildContext context, WidgetRef ref) {
    final weightCtrl = TextEditingController();
    final bfCtrl = TextEditingController();
    final waistCtrl = TextEditingController();
    final chestCtrl = TextEditingController();
    final armsCtrl = TextEditingController();
    final notesCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log Weight'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: weightCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Weight (kg) *'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  autofocus: true),
              TextField(
                  controller: bfCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Body Fat % (optional)'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              TextField(
                  controller: waistCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Waist cm (optional)'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              TextField(
                  controller: chestCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Chest cm (optional)'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              TextField(
                  controller: armsCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Arms cm (optional)'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              TextField(
                  controller: notesCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Notes (optional)')),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final weight = double.tryParse(weightCtrl.text);
              if (weight == null) return;

              ref.read(weightLogProvider.notifier).add(WeightEntry(
                    id: _uuid.v4(),
                    date: DateTime.now(),
                    weight: weight,
                    bodyFat: double.tryParse(bfCtrl.text),
                    waist: double.tryParse(waistCtrl.text),
                    chest: double.tryParse(chestCtrl.text),
                    arms: double.tryParse(armsCtrl.text),
                    notes: notesCtrl.text.isEmpty ? null : notesCtrl.text,
                  ));
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final List<WeightEntry> entries;
  const _StatsRow({required this.entries});

  @override
  Widget build(BuildContext context) {
    final current = entries.first.weight;
    final oldest = entries.last.weight;
    final change = current - oldest;
    final min = entries.map((e) => e.weight).reduce((a, b) => a < b ? a : b);
    final max = entries.map((e) => e.weight).reduce((a, b) => a > b ? a : b);

    return Row(
      children: [
        Expanded(
            child: _StatCard(
                label: 'Current', value: '${current.toStringAsFixed(1)} kg')),
        const SizedBox(width: 8),
        Expanded(
            child: _StatCard(
          label: 'Change',
          value:
              '${change >= 0 ? "+" : ""}${change.toStringAsFixed(1)} kg',
          valueColor: change <= 0 ? Colors.green : Colors.red,
        )),
        const SizedBox(width: 8),
        Expanded(
            child: _StatCard(
                label: 'Range',
                value:
                    '${min.toStringAsFixed(1)}-${max.toStringAsFixed(1)}')),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatCard({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(value,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: valueColor,
                    )),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _WeightChart extends StatelessWidget {
  final List<WeightEntry> entries;
  const _WeightChart({required this.entries});

  @override
  Widget build(BuildContext context) {
    final sorted = entries.reversed.toList();
    final minWeight =
        sorted.map((e) => e.weight).reduce((a, b) => a < b ? a : b) - 1;
    final maxWeight =
        sorted.map((e) => e.weight).reduce((a, b) => a > b ? a : b) + 1;

    return LineChart(
      LineChartData(
        minY: minWeight,
        maxY: maxWeight,
        gridData: const FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '${value.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= sorted.length) return const SizedBox();
                return Text(
                  DateFormat.MMMd().format(sorted[index].date),
                  style: const TextStyle(fontSize: 9),
                );
              },
              interval: (sorted.length / 5).ceilToDouble().clamp(1, 100),
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: sorted
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.weight))
                .toList(),
            isCurved: true,
            preventCurveOverShooting: true,
            barWidth: 3,
            color: Theme.of(context).colorScheme.primary,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 3,
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 0,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (spots) => spots
                .map((s) => LineTooltipItem(
                      '${s.y.toStringAsFixed(1)} kg',
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _MeasurementsChart extends StatelessWidget {
  final List<WeightEntry> entries;
  const _MeasurementsChart({required this.entries});

  @override
  Widget build(BuildContext context) {
    final sorted = entries.reversed
        .where((e) => e.waist != null)
        .toList();

    if (sorted.length < 2) {
      return const Center(child: Text('Need more measurements'));
    }

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (value, meta) => Text(
                '${value.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= sorted.length) return const SizedBox();
                return Text(
                  DateFormat.MMMd().format(sorted[index].date),
                  style: const TextStyle(fontSize: 9),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: sorted
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.waist ?? 0))
                .toList(),
            isCurved: true,
            barWidth: 2,
            color: Colors.orange,
            dotData: const FlDotData(show: false),
          ),
          if (sorted.any((e) => e.chest != null))
            LineChartBarData(
              spots: sorted
                  .asMap()
                  .entries
                  .where((e) => e.value.chest != null)
                  .map((e) => FlSpot(e.key.toDouble(), e.value.chest!))
                  .toList(),
              isCurved: true,
              barWidth: 2,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
            ),
        ],
      ),
    );
  }
}
