import 'package:flutter/material.dart';
import 'package:shimmer_ai/src/shimmer_ai_config.dart';
import 'package:shimmer_ai/src/utils/size_utils.dart';

/// Shows a shimmer placeholder styled as a horizontal line,
/// mimicking a Text widget in size and width.
class ShimmerTextPlaceholder extends StatelessWidget {
  final Widget original;
  final ShimmerAiConfig config;

  const ShimmerTextPlaceholder(
      {required this.original, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;

    if (original is Text) {
      final text = original as Text;
      width = estimateTextWidth(text);
      height = estimateTextHeight(text);
    }

    width ??= 120;
    height ??= 16;

    return config.buildShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
      ),
    );
  }
}

/// Shows a shimmer placeholder for box-type or avatar-type widgets.
/// Attempts to match the original widget's size/shape.
class ShimmerBoxPlaceholder extends StatelessWidget {
  final Widget? original;
  final bool isCircle;
  final ShimmerAiConfig config;

  const ShimmerBoxPlaceholder({
    this.original,
    this.isCircle = false,
    required this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;

    if (original != null) {
      width = getWidgetWidth(original!);
      height = getWidgetHeight(original!);
    }

    width ??= isCircle ? 40 : 100;
    height ??= isCircle ? 40 : 20;

    return config.buildShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isCircle ? null : BorderRadius.circular(config.borderRadius),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        margin: const EdgeInsets.all(4),
      ),
    );
  }
}
