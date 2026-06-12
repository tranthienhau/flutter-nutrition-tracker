import 'package:flutter/material.dart';

import '../models/food_item.dart';
import 'nutrition_database.dart';

/// Barcode scanning service.
///
/// On a real device this opens the camera to scan a food product barcode.
/// To keep the POC demoable on a simulator with no camera hardware, the
/// scanner view simulates a detection behind a tap and looks the code up
/// in the Open Food Facts database.
class BarcodeScannerService {
  /// Opens a full-screen barcode scanner and returns the scanned FoodItem,
  /// or null if cancelled or not found.
  static Future<FoodItem?> scanAndLookup(BuildContext context) async {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => const _BarcodeScannerView(),
        fullscreenDialog: true,
      ),
    );

    if (barcode == null || barcode.isEmpty) return null;

    return NutritionDatabaseService.lookupBarcode(barcode);
  }
}

class _BarcodeScannerView extends StatelessWidget {
  const _BarcodeScannerView();

  // Sample barcodes the simulated scanner can "detect".
  static const _sampleBarcodes = <String, String>{
    '3017620422003': 'Nutella',
    '5449000000996': 'Coca-Cola',
    '7622210449283': 'Oreo',
    '0049000028904': 'Sprite',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 280,
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.primary, width: 3),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const Positioned(
              top: 48,
              left: 0,
              right: 0,
              child: Text(
                'Point camera at a barcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tap a sample product to simulate a scan',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: _sampleBarcodes.entries
                        .map(
                          (e) => ActionChip(
                            avatar: const Icon(Icons.qr_code_2, size: 18),
                            label: Text(e.value),
                            onPressed: () =>
                                Navigator.of(context).pop(e.key),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
