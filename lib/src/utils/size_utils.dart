// lib/src/utils/size_utils.dart
import 'package:flutter/widgets.dart';

/// Estimate width based on number of characters and font size.
/// Used for Text widget placeholders.
double estimateTextWidth(Text text, {double defaultWidth = 120.0}) {
  final content = text.data ?? '';
  final style = text.style;
  final fontSize = style?.fontSize ?? 14.0;
  // A more robust estimation for character width, considering common fonts.
  // Each character approx 0.55-0.65 * fontSize (rough average for varied fonts).
  final estimatedCharWidth = fontSize * 0.6;
  return (content.length * estimatedCharWidth).clamp(
      20.0, defaultWidth * 2); // Clamp to prevent excessively long placeholders
}

/// Estimate height based on font size for Text widgets.
double estimateTextHeight(Text text, {double fontSize = 14.0}) {
  final style = text.style;
  // Use 1.2 * font size for typical line height, considering ascenders/descenders
  return (style?.fontSize ?? fontSize) *
      (style?.height ?? 1.2); // Use style.height if available
}

/// Returns the fixed width of a widget, if set, else null.
/// Supports SizedBox, constrained Containers, and some layout widgets.
double? getWidgetWidth(Widget widget) {
  if (widget is SizedBox && widget.width != null) {
    return widget.width;
  } else if (widget is Container) {
    // Check if the container has explicit width in its constraints
    if (widget.constraints != null && widget.constraints!.hasTightWidth) {
      return widget.constraints!.maxWidth;
    }
  }
  return null;
}

/// Returns the fixed height of a widget, if set, else null.
/// Supports SizedBox, constrained Containers, and some layout widgets.
double? getWidgetHeight(Widget widget) {
  if (widget is SizedBox && widget.height != null) {
    return widget.height;
  } else if (widget is Container) {
    // Check if the container has explicit height in its constraints
    if (widget.constraints != null && widget.constraints!.hasTightHeight) {
      return widget.constraints!.maxHeight;
    }
  }
  return null;
}
