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
    // Individual customization parameters for shimmer
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
    ShimmerDirection? direction,
    double? angle,
    double? borderRadius,
    bool? repeat,
    int? loopCount,
    LinearGradient? customGradient,
    // New UI customization parameters for the placeholder
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    BoxConstraints? constraints,
    Decoration? decoration,
  }) {
    if (!loading) {
      return this;
    }

    // Create a temporary default config to access default values easily.
    final defaultConfig = const ShimmerAiConfig();

    // Merge individual parameters into the config.
    // The ?? operator is used to provide a fallback value.
    // The final fallback is the default value from ShimmerAiConfig.
    final effectiveConfig = ShimmerAiConfig(
      baseColor: baseColor ?? config?.baseColor ?? defaultConfig.baseColor,
      highlightColor: highlightColor ??
          config?.highlightColor ??
          defaultConfig.highlightColor,
      duration: duration ?? config?.duration ?? defaultConfig.duration,
      direction: direction ?? config?.direction ?? defaultConfig.direction,
      angle: angle ?? config?.angle ?? defaultConfig.angle,
      borderRadius:
          borderRadius ?? config?.borderRadius ?? defaultConfig.borderRadius,
      repeat: repeat ?? config?.repeat ?? defaultConfig.repeat,
      loopCount: loopCount ?? config?.loopCount,
      customGradient: customGradient ?? config?.customGradient,
      width: width ?? config?.width,
      height: height ?? config?.height,
      margin: margin ?? config?.margin,
      padding: padding ?? config?.padding,
      alignment: alignment ?? config?.alignment,
      constraints: constraints ?? config?.constraints,
      decoration: decoration ?? config?.decoration,
    );

    return ShimmerAiWrapper(child: this, config: effectiveConfig);
  }
}
