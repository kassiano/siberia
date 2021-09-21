import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  /// Applies bolder property on this [TextStyle].
  TextStyle get bold => merge(const TextStyle(fontWeight: FontWeight.bold));
}
