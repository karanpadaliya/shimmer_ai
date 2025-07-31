import 'package:flutter/material.dart';
import 'package:shimmer_ai/src/shimmer_ai_config.dart';
import 'package:shimmer_ai/src/widgets/shimmer_placeholders.dart';
import 'package:shimmer_ai/src/utils/widget_type_utils.dart';

/// Widget that recursively replaces the child widget tree with
/// shimmer placeholders of correct type, shape, and size.
///
/// Internal use for .withShimmerAi extension.
class ShimmerAiWrapper extends StatelessWidget {
  final Widget child;
  final ShimmerAiConfig config;

  /// Wrap [child] for shimmer effect generation.
  const ShimmerAiWrapper(
      {super.key, required this.child, required this.config});

  @override
  Widget build(BuildContext context) {
    // Recursively walk and transform the widget tree.
    return _transform(child);
  }

  /// Core recursive transformation for the widget tree.
  Widget _transform(Widget w) {
    // Replace Text widgets with shimmer text placeholder
    if (isTextWidget(w)) {
      return ShimmerTextPlaceholder(original: w, config: config);
    }
    // Replace Image-like widgets with shimmer box (handles avatars too)
    else if (isImageWidget(w) || isAvatar(w)) {
      // Combine for simplicity
      return ShimmerBoxPlaceholder(
          original: w, isCircle: isAvatar(w), config: config);
    }
    // Recur through Column, Row, Flex
    else if (w is Column) {
      return Column(
        key: w.key, // Preserve key if any
        mainAxisAlignment: w.mainAxisAlignment,
        mainAxisSize: w.mainAxisSize,
        crossAxisAlignment: w.crossAxisAlignment,
        textDirection: w.textDirection,
        verticalDirection: w.verticalDirection,
        children: w.children.map(_transform).toList(),
      );
    } else if (w is Row) {
      return Row(
        key: w.key, // Preserve key if any
        mainAxisAlignment: w.mainAxisAlignment,
        mainAxisSize: w.mainAxisSize,
        crossAxisAlignment: w.crossAxisAlignment,
        textDirection: w.textDirection,
        verticalDirection: w.verticalDirection,
        children: w.children.map(_transform).toList(),
      );
    } else if (w is Flex) {
      // Catch general Flex (Column/Row inherit from Flex)
      return Flex(
        key: w.key,
        direction: w.direction,
        mainAxisAlignment: w.mainAxisAlignment,
        mainAxisSize: w.mainAxisSize,
        crossAxisAlignment: w.crossAxisAlignment,
        textDirection: w.textDirection,
        verticalDirection: w.verticalDirection,
        clipBehavior: w.clipBehavior,
        children: w.children.map(_transform).toList(),
      );
    }
    // Replace generic Containers with a shimmer box
    else if (w is Container) {
      return ShimmerBoxPlaceholder(original: w, config: config);
    }
    // Handle SizedBox specifically to get exact dimensions for placeholders
    else if (w is SizedBox) {
      return ShimmerBoxPlaceholder(original: w, config: config);
    }
    // Fallback: show default shimmer rectangle for any unsupported widget
    return ShimmerBoxPlaceholder(config: config);
  }
}
