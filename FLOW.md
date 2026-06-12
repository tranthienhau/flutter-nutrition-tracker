# Screenshot capture flow

Real captures from the iOS Simulator via an integration-test driver (no mockups).

## Steps

1. Boot the simulator:
   ```bash
   xcrun simctl boot "iPhone 17 Pro"
   open -a Simulator
   ```
2. Scaffold the iOS platform folder (lib-only project) and get dependencies:
   ```bash
   flutter create . --platforms=ios --project-name flutter_nutrition_tracker
   flutter pub get
   ```
3. Drive the screenshot test:
   ```bash
   flutter drive \
     --driver test_driver/integration_test.dart \
     --target integration_test/screenshot_test.dart \
     -d "iPhone 17 Pro"
   ```
4. Build the demo GIF from the PNGs:
   ```bash
   cd screenshots
   ffmpeg -y -framerate 1 -pattern_type glob -i '*.png' \
     -vf "scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
     -loop 0 demo.gif
   ```

PNGs + `demo.gif` are written to `screenshots/` and embedded in `README.md`.

## How it works

- `test_driver/integration_test.dart` - `integrationDriver(onScreenshot:)` writes each PNG to `screenshots/<name>.png`.
- `integration_test/screenshot_test.dart`:
  - In `setUpAll`, initializes Hive in a temp directory and seeds the boxes so the screens render real-looking content: today's `food_log` entries (Greek yogurt, chicken salad, almonds, salmon), `favorites`, and a multi-week `weight_logs` history with body measurements.
  - Pumps `DashboardScreen` and shoots `01-dashboard` (calorie ring, macro rings, habit score, recent entries).
  - Pumps `FoodLogScreen`, taps the `Today` tab, and shoots `02-food-log` (logged meals with calories).
  - Pumps `ProgressScreen` and shoots `03-progress` (weight-trend line chart, measurements, stats, weight log).
  - `shoot` calls `binding.convertFlutterSurfaceToImage()` + `pumpAndSettle()` + `binding.takeScreenshot('NN-name')`.

Note: `mobile_scanner` (GoogleMLKit) is not used; it does not provide arm64 simulator slices on iOS 26. The barcode scanner is simulated behind a tap (`lib/services/barcode_scanner.dart`) so the app builds and runs on the simulator with no camera hardware.
