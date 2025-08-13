// lib/src/shimmer_ai_config.dart
import 'package:flutter/material.dart';

/// Defines the direction of the shimmer animation.
enum ShimmerDirection {
  /// Shimmer moves from left to right.
  ltr,

  /// Shimmer moves from right to left.
  rtl,

  /// Shimmer moves from top to bottom.
  ttb,

  /// Shimmer moves from bottom to top.
  btt,
}

/// Configuration class for customizing the shimmer effect.
class ShimmerAiConfig {
  /// The base color of the shimmer effect. Defaults to Colors.grey[300]!.
  final Color baseColor;

  /// The highlight color of the shimmer effect. Defaults to Colors.grey[100]!.
  final Color highlightColor;

  /// The duration of one shimmer animation cycle. Defaults to 1500 milliseconds.
  final Duration duration;

  /// The direction of the shimmer animation. Defaults to ShimmerDirection.ltr.
  final ShimmerDirection direction;

  /// The angle of the shimmer effect in radians. Defaults to 0.0 (horizontal).
  final double angle;

  /// The border radius for rectangular shimmer placeholders. Defaults to 10.0.
  final double borderRadius;

  /// Whether the shimmer animation should loop continuously. Defaults to true.
  final bool repeat;

  /// The number of times the shimmer animation should repeat.
  /// Only applicable if [repeat] is true. Defaults to null (infinite).
  final int? loopCount;

  /// A custom [LinearGradient] to use for the shimmer effect.
  /// If provided, [baseColor] and [highlightColor] will be ignored.
  final LinearGradient? customGradient;

  // New UI parameters for placeholder customization
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final Decoration? decoration;

  /// Configuration for the shimmer effect, controlling its appearance and animation.
  const ShimmerAiConfig({
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.angle = 0.0,
    this.borderRadius = 10.0,
    this.repeat = true,
    this.loopCount,
    this.customGradient,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.constraints,
    this.decoration,
  });

  /// Builds a [Shimmer] widget to apply the shimmer effect to a child widget.
  Widget buildShimmer({
    required Widget child,
  }) {
    return _Shimmer(
      config: this,
      child: child,
    );
  }
}

/// The internal widget that provides the shimmer effect.
class _Shimmer extends StatefulWidget {
  final ShimmerAiConfig config;
  final Widget child;

  const _Shimmer({
    required this.config,
    required this.child,
  });

  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..repeat(
        period: widget.config.duration,
        min: -0.5,
        max: 1.5,
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the gradient's begin and end alignments based on the direction.
    // The animation controller's value is used to shift the gradient.
    // _controller.value ranges from -0.5 to 1.5
    Alignment begin, end;
    final child = widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        // Handle all four directions
        switch (widget.config.direction) {
          case ShimmerDirection.ltr:
            begin = Alignment(0.0 - 2.0 * _controller.value, 0.0);
            end = Alignment(1.0 - 2.0 * _controller.value, 0.0);
            break;
          case ShimmerDirection.rtl:
            begin = Alignment(1.0 + 2.0 * _controller.value, 0.0);
            end = Alignment(0.0 + 2.0 * _controller.value, 0.0);
            break;
          case ShimmerDirection.ttb:
            begin = Alignment(0.0, -1.0 + 2.0 * _controller.value);
            end = Alignment(0.0, 0.0 + 2.0 * _controller.value);
            break;
          case ShimmerDirection.btt:
            begin = Alignment(0.0, 1.0 - 2.0 * _controller.value);
            end = Alignment(0.0, 0.0 - 2.0 * _controller.value);
            break;
        }

        final gradient = widget.config.customGradient ??
            LinearGradient(
              colors: [
                widget.config.baseColor,
                widget.config.highlightColor,
                widget.config.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: begin, // Use calculated begin
              end: end, // Use calculated end
              transform:
              widget.config.angle != 0.0 ? GradientRotation(widget.config.angle) : null,
              // Apply rotation here
              tileMode:
              TileMode.clamp, // tileMode is a property of LinearGradient
            );

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            // The gradient itself now handles the transformation and tileMode,
            // so we just need to create a shader from it.
            return gradient.createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}
