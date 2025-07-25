import 'package:flutter/material.dart';
import 'shimmer_placeholders.dart';
import '../utils/widget_type_utils.dart';

/// Widget that recursively replaces the child widget tree with
/// shimmer placeholders of correct type, shape, and size.
///
/// Internal use for .withShimmerAi extension.
class ShimmerAiWrapper extends StatelessWidget {
  final Widget child;

  /// Wrap [child] for shimmer effect generation.
  const ShimmerAiWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Recursively walk and transform the widget tree.
    return _transform(child);
  }

  /// Core recursive transformation for the widget tree.
  Widget _transform(Widget w) {
    // Replace Text widgets with shimmer text placeholder
    if (isTextWidget(w)) {
      return ShimmerTextPlaceholder(original: w);
    }
    // Replace Image-like widgets with shimmer box (handles avatars too)
    else if (isImageWidget(w)) {
      return ShimmerBoxPlaceholder(original: w, isCircle: isAvatar(w));
    }
    // Recur through Columns
    else if (w is Column) {
      return Column(
        children: w.children.map(_transform).toList(),
        mainAxisSize: w.mainAxisSize,
        crossAxisAlignment: w.crossAxisAlignment,
      );
    }
    // Recur through Rows
    else if (w is Row) {
      return Row(
        children: w.children.map(_transform).toList(),
        mainAxisSize: w.mainAxisSize,
        crossAxisAlignment: w.crossAxisAlignment,
      );
    }
    // Replace generic Containers with a shimmer box
    else if (w is Container) {
      return ShimmerBoxPlaceholder(original: w);
    }
    // Fallback: show default shimmer rectangle for any unsupported widget
    return ShimmerBoxPlaceholder();
  }
}
