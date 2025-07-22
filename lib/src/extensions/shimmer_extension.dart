import 'package:flutter/widgets.dart';
import '../shimmer_wrapper.dart';

extension ShimmerAiExtension on Widget {
  Widget withShimmerAi({required bool loading}) {
    return loading ? ShimmerWrapper(child: this) : this;
  }
}
