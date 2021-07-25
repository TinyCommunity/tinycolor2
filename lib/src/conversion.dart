import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/painting.dart';

import 'hsl_color.dart';
import 'util.dart';

HslColor rgbToHsl({
  required double r,
  required double g,
  required double b,
}) {
  final double rBound = bound01(r, 255.0);
  final double gBound = bound01(g, 255.0);
  final double bBound = bound01(b, 255.0);

  final max = [rBound, gBound, bBound].reduce(Math.max);
  final min = [rBound, gBound, bBound].reduce(Math.min);
  double h = 0.0;
  double s = 0.0;
  final double l = (max + min) / 2;

  if (max == min) {
    h = s = 0.0;
  } else {
    final double d = max - min;
    s = l > 0.5 ? d / (2.0 - max - min) : d / (max + min);
    if (max == rBound) {
      h = (gBound - bBound) / d + (gBound < bBound ? 6 : 0);
    } else if (max == gBound) {
      h = (bBound - rBound) / d + 2;
    } else if (max == bBound) {
      h = (rBound - gBound) / d + 4;
    }
  }

  h /= 6.0;
  return HslColor(h: h, s: s, l: l);
}

Color hslToColor(HslColor hsl) => hslToRgb(hsl);

Color hslToRgb(HslColor hsl) {
  double r;
  double g;
  double b;
  final double h = bound01(hsl.h, 360.0);
  final double s = bound01(hsl.s * 100, 100.0);
  final double l = bound01(hsl.l * 100, 100.0);

  if (s == 0.0) {
    r = g = b = l;
  } else {
    final q = l < 0.5 ? l * (1.0 + s) : l + s - l * s;
    final p = 2 * l - q;
    r = _hue2rgb(p, q, h + 1 / 3);
    g = _hue2rgb(p, q, h);
    b = _hue2rgb(p, q, h - 1 / 3);
  }
  return Color.fromARGB(
    hsl.a.round(),
    (r * 255).round(),
    (g * 255).round(),
    (b * 255).round(),
  );
}

HSVColor rgbToHsv({
  required int r,
  required int g,
  required int b,
  required int a,
}) =>
    HSVColor.fromColor(Color.fromARGB(a, r, g, b));

double _hue2rgb(double p, double q, double t) {
  double tint = t;

  if (tint < 0) tint += 1;
  if (tint > 1) tint -= 1;
  if (tint < 1 / 6) return p + (q - p) * 6 * tint;
  if (tint < 1 / 2) return q;
  if (tint < 2 / 3) return p + (q - p) * (2 / 3 - tint) * 6;
  return p;
}
