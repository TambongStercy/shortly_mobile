// HSL to Color converter function
import 'package:flutter/material.dart';

Color hslToColor(int hue, int saturation, int lightness) {
  return HSLColor.fromAHSL(
          1.0, hue.toDouble(), saturation / 100, lightness / 100)
      .toColor();
}
