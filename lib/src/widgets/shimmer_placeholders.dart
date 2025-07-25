import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/size_utils.dart';

/// Shows a shimmer placeholder styled as a horizontal line,
/// mimicking a Text widget in size and width.
class ShimmerTextPlaceholder extends StatelessWidget {
  final Widget original;

  const ShimmerTextPlaceholder({required this.original, super.key});

  @override
  Widget build(BuildContext context) {
    // Try to estimate width and height for the Text widget,
    // fallback to default values if not possible.
    double? width;
    double? height;

    if (original is Text) {
      final text = original as Text;
      width = estimateTextWidth(text);
      height = estimateTextHeight(text);
    }

    width ??= 120;
    height ??= 16;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
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

  const ShimmerBoxPlaceholder({this.original, this.isCircle = false, super.key});

  @override
  Widget build(BuildContext context) {
    // Best-effort: attempt to get size from the original widget, if possible.
    double? width;
    double? height;

    if (original != null) {
      width = getWidgetWidth(original!);
      height = getWidgetHeight(original!);
    }

    // Use sensible defaults depending on shape.
    width ??= isCircle ? 40 : 100;
    height ??= isCircle ? 40 : 20;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isCircle ? null : BorderRadius.circular(10),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        margin: const EdgeInsets.all(4),
      ),
    );
  }
}
