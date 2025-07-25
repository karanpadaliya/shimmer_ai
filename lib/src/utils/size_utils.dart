import 'package:flutter/widgets.dart';

/// Estimate width based on number of characters and font size.
/// Used for Text widget placeholders.
double estimateTextWidth(Text text, {double defaultWidth = 120.0}) {
  final content = text.data ?? '';
  final style = text.style;
  final fontSize = style?.fontSize ?? 14.0;
  // Each character approx 0.6 * fontSize (rough average)
  return (content.length * fontSize * 0.6).clamp(20.0, double.infinity);
}

/// Estimate height based on font size for Text widgets.
double estimateTextHeight(Text text, {double fontSize = 14.0}) {
  final style = text.style;
  // Use 1.2 * font size for typical line height
  return (style?.fontSize ?? fontSize) * 1.2;
}

/// Returns the fixed width of a widget, if set, else null.
/// Supports SizedBox and constrained Containers.
double? getWidgetWidth(Widget widget) {
  if (widget is SizedBox && widget.width != null) {
    return widget.width;
  } else if (widget is Container && widget.constraints != null) {
    if (widget.constraints!.hasBoundedWidth) {
      return widget.constraints!.maxWidth;
    }
  }
  // Extend here for more widget types.
  return null;
}

/// Returns the fixed height of a widget, if set, else null.
/// Supports SizedBox and constrained Containers.
double? getWidgetHeight(Widget widget) {
  if (widget is SizedBox && widget.height != null) {
    return widget.height;
  } else if (widget is Container && widget.constraints != null) {
    if (widget.constraints!.hasBoundedHeight) {
      return widget.constraints!.maxHeight;
    }
  }
  // Extend here for more widget types.
  return null;
}
