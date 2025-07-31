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

  const ShimmerAiConfig({
    this.baseColor = const Color(0xFFE0E0E0), // Equivalent to Colors.grey[300]!
    this.highlightColor =
        const Color(0xFFF5F5F5), // Equivalent to Colors.grey[100]!
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.angle = 0.0, // Default to horizontal shimmer
    this.borderRadius = 10.0,
    this.repeat = true,
    this.loopCount,
    this.customGradient,
  });

  /// Builds a shimmer widget based on the configuration.
  Widget buildShimmer({required Widget child}) {
    return CustomShimmerEffect(
      // Changed to CustomShimmerEffect
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      direction: direction,
      angle: angle,
      repeat: repeat,
      loopCount: loopCount,
      customGradient: customGradient,
      child: child,
    );
  }
}

/// A custom widget to apply the shimmer animation effect.
/// Replicates the functionality of the 'shimmer' package without direct dependency.
class CustomShimmerEffect extends StatefulWidget {
  // Renamed to CustomShimmerEffect
  const CustomShimmerEffect({
    required this.baseColor,
    required this.highlightColor,
    required this.duration,
    required this.direction,
    required this.angle,
    required this.repeat,
    this.loopCount,
    this.customGradient,
    required this.child,
  });

  final Color baseColor;
  final Color highlightColor;
  final Duration duration;
  final ShimmerDirection direction;
  final double angle;
  final bool repeat;
  final int? loopCount;
  final LinearGradient? customGradient;
  final Widget child;

  @override
  _CustomShimmerEffectState createState() => _CustomShimmerEffectState();
}

class _CustomShimmerEffectState
    extends State<CustomShimmerEffect> // Changed to CustomShimmerEffect
    with
        SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    if (widget.repeat) {
      if (widget.loopCount != null && widget.loopCount! > 0) {
        _controller.repeat(reverse: false, count: widget.loopCount);
      } else {
        _controller.repeat(reverse: false); // Infinite loop
      }
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CustomShimmerEffect oldWidget) {
    // Changed to CustomShimmerEffect
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration ||
        widget.repeat != oldWidget.repeat ||
        widget.loopCount != oldWidget.loopCount) {
      _controller.duration = widget.duration;
      if (widget.repeat) {
        if (widget.loopCount != null && widget.loopCount! > 0) {
          _controller.repeat(reverse: false, count: widget.loopCount);
        } else {
          _controller.repeat(reverse: false);
        }
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate gradient start and end points based on animation value and direction
        Alignment begin, end;
        switch (widget.direction) {
          case ShimmerDirection.ltr:
            begin = Alignment(-1.0 + 2.0 * _controller.value, 0.0);
            end = Alignment(0.0 + 2.0 * _controller.value, 0.0);
            break;
          case ShimmerDirection.rtl:
            begin = Alignment(1.0 - 2.0 * _controller.value, 0.0);
            end = Alignment(0.0 - 2.0 * _controller.value, 0.0);
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

        final gradient = widget.customGradient ??
            LinearGradient(
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: begin,
              // Use calculated begin
              end: end,
              // Use calculated end
              transform:
                  widget.angle != 0.0 ? GradientRotation(widget.angle) : null,
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
      child: widget.child,
    );
  }
}
