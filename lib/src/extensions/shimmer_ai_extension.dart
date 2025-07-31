import 'package:flutter/widgets.dart';
import 'package:shimmer_ai/src/shimmer_ai_config.dart';
import 'package:shimmer_ai/src/widgets/shimmer_ai_wrapper.dart';

/// Extension on all widgets to enable shimmer effect with a single line.
///
/// Usage:
/// ```
/// MyWidget().withShimmerAi(loading: isLoading)
/// ```
extension ShimmerAiExtension on Widget {
  /// Adds shimmer effect to the current widget when [loading] is true.
  /// Shows the original widget when [loading] is false.
  ///
  /// [loading]: Set to `true` to show the shimmer effect, `false` to show the original widget.
  /// [config]: Optional. A [ShimmerAiConfig] object to customize the shimmer appearance.
  /// If not provided, default shimmer settings will be used.
  ///
  /// You can also directly provide individual customization parameters,
  /// which will override the corresponding values in [config] if both are provided.
  Widget withShimmerAi({
    required bool loading,
    ShimmerAiConfig? config,
    // Individual customization parameters
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
    ShimmerDirection? direction,
    double? angle,
    double? borderRadius,
    bool? repeat,
    int? loopCount,
    LinearGradient? customGradient,
  }) {
    if (!loading) {
      return this;
    }

    // Merge individual parameters into the config
    final effectiveConfig = ShimmerAiConfig(
      baseColor: baseColor ?? config?.baseColor ?? const Color(0xFFE0E0E0),
      highlightColor:
          highlightColor ?? config?.highlightColor ?? const Color(0xFFF5F5F5),
      duration:
          duration ?? config?.duration ?? const Duration(milliseconds: 1500),
      direction: direction ?? config?.direction ?? ShimmerDirection.ltr,
      angle: angle ?? config?.angle ?? 0.0,
      borderRadius: borderRadius ?? config?.borderRadius ?? 10.0,
      repeat: repeat ?? config?.repeat ?? true,
      loopCount: loopCount ?? config?.loopCount,
      customGradient: customGradient ?? config?.customGradient,
    );

    return ShimmerAiWrapper(child: this, config: effectiveConfig);
  }
}
