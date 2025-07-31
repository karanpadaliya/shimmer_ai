# Changelog

All notable changes to this project will be documented in this file.

## [1.2.1+1] - July 31, 2025
**Released:** July 31, 2025

### Changed
- 🧹 Fixed code formatting.
- 📝 Shortened package description in `pubspec.yaml` for better SEO.

## [1.2.1] - July 31, 2025
**Released:** July 31, 2025

### Changed
- 🧹 Fixed code formatting.

## [1.2.0] - July 31, 2025
**Released:** July 31, 2025

### Added
- ✨ **Enhanced Customization:** Introduced `ShimmerAiConfig` for granular control over shimmer appearance.
- `baseColor`, `highlightColor`: Control shimmer colors.
- `duration`: Adjust animation speed.
- `direction`: Set shimmer animation direction (LTR, RTL, TTB, BTT).
- `angle`: Define the angle of the shimmer effect.
- `borderRadius`: Customize border radius of rectangular placeholders.
- `repeat`: Control continuous looping.
- `loopCount`: Specify the number of animation loops.
- `customGradient`: Provide a custom `LinearGradient` for unique effects.
- 🧪 **New Test Cases:** Added comprehensive widget tests for all new customization parameters to ensure functionality and prevent regressions, now testing the internal shimmer implementation.

### Changed
- ♻️ **Refactored API:** `withShimmerAi()` extension now accepts `ShimmerAiConfig` or individual parameters for flexibility.
- ⚙️ **Improved Placeholder Logic:** Enhanced `ShimmerAiWrapper` and `ShimmerPlaceholders` to utilize `ShimmerAiConfig` for dynamic rendering.
- 📏 **Smarter Sizing:** Refined `size_utils.dart` to provide more accurate estimations for placeholder dimensions based on original widgets (e.g., Text, Container, SizedBox).
- 📚 **Updated Example:** `example/lib/main.dart` now showcases all new customization options with various scenarios.

### Fixed
- 🐛 Ensured all parameters propagate correctly from `withShimmerAi` to the underlying custom shimmer widget.
- 🐛 Improved handling of different widget types within `ShimmerAiWrapper` for more consistent placeholder generation.

## [1.1.1] - July 25, 2025
**Released:** July 25, 2025

### Changed
- 🔧 Bug Fixed.

## [1.1.0] - July 25, 2025
**Released:** July 25, 2025

### Changed
- 🔧 Refactored package structure to modularize extensions, widgets, placeholders, and utilities.
- ♻️ Improved performance and widget rebuilding logic.
- 🧹 Cleaned codebase for null safety, code style, and pub.dev scoring improvements.

## [1.0.0] - July 22, 2025
**Released:** July 22, 2025

🎉 Initial release of **shimmer_ai**:

| Feature                              | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| ✨ Smooth shimmer animation         | Built-in shimmer gradient animation to mimic content loading                |
| 🧱 Reusable skeleton layout widgets| Customizable rectangular, rounded, and circular shimmer placeholders        |
| 🎨 Full color and duration control | Adjust base color, highlight color, animation duration, and direction       |
| 🔁 Looping animation support       | Supports continuous looping shimmer effect for async UIs                    |
| 📱 Responsive layout support       | Works across all screen sizes with adaptive behavior                        |
| 💡 Perfect for                    | Loading states, skeleton UIs, onboarding placeholders, list/grid loaders    |
| 🧪 example/lib/main.dart           | Full working demo with vertical list, card UI, and use-case showcase        |
