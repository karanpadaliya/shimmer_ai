import 'package:flutter/widgets.dart';
import '../widgets/shimmer_ai_wrapper.dart';

/// Extension on all widgets to enable shimmer effect with a single line.
///
/// Usage:
/// ```
/// MyWidget().withShimmerAi(loading: isLoading)
/// ```
extension ShimmerAiExtension on Widget {
  /// Adds shimmer effect to the current widget when [loading] is true.
  /// Shows the original widget when [loading] is false.
  Widget withShimmerAi({required bool loading}) {
    return loading ? ShimmerAiWrapper(child: this) : this;
  }
}
