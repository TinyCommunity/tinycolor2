import 'dart:math' as math;

import 'package:flutter/painting.dart' show Color, HSLColor, HSVColor;
import 'package:pigment/pigment.dart';

import 'conversion.dart';
import 'util.dart';

class TinyColor {
  final Color originalColor;
  Color _color;

  @Deprecated('Use TinyColor.fromColor() instead.')
  TinyColor(this.originalColor) : _color = Color(originalColor.value);

  TinyColor.fromColor(this.originalColor) : _color = Color(originalColor.value);

  @Deprecated('Use TinyColor.fromColor(Color.fromARGB(a, r, g, b)) instead.')
  factory TinyColor.fromRGB({
    required int r,
    required int g,
    required int b,
    int a = 255,
  }) =>
      TinyColor.fromColor(Color.fromARGB(a, r, g, b));

  @Deprecated('Use TinyColor.fromHSLColor() instead.')
  factory TinyColor.fromHSL(HSLColor hsl) => TinyColor.fromColor(hsl.toColor());

  factory TinyColor.fromHSLColor(HSLColor hsl) =>
      TinyColor.fromColor(hsl.toColor());

  @Deprecated('Use TinyColor.fromHSVColor() instead.')
  factory TinyColor.fromHSV(HSVColor hsl) => TinyColor.fromHSVColor(hsl);

  factory TinyColor.fromHSVColor(HSVColor hsv) =>
      TinyColor.fromColor(hsv.toColor());

  factory TinyColor.fromString(String string) =>
      TinyColor.fromColor(Pigment.fromString(string));

  bool isDark() => getBrightness() < 128.0;

  bool isLight() => !isDark();

  double getBrightness() =>
      (_color.red * 299 + _color.green * 587 + _color.blue * 114) / 1000;

  double getLuminance() => _color.computeLuminance();

  TinyColor setAlpha(int alpha) {
    _color = _color.withAlpha(alpha);
    return this;
  }

  TinyColor setOpacity(double opacity) {
    _color = _color.withOpacity(opacity);
    return this;
  }

  Color toColor() => Color(_color.value);

  @Deprecated('Use TinyColor.toHSVColor() instead.')
  HSVColor toHsv() => toHSVColor();

  HSVColor toHSVColor() => HSVColor.fromColor(_color);

  @Deprecated('Use TinyColor.toHSLColor() instead.')
  HSLColor toHsl() => HSLColor.fromColor(_color);

  HSLColor toHSLColor() => HSLColor.fromColor(_color);

  String toHex8() => _color.value.toRadixString(16).padLeft(8, '0');

  TinyColor clone() => TinyColor.fromColor(_color);

  TinyColor lighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = toHSLColor();
    final lightness = clamp01(hsl.lightness + p);
    _color = hsl.withLightness(lightness).toColor();
    return this;
  }

  TinyColor brighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    _color = Color.fromARGB(
      _color.alpha,
      math.max(
        0,
        math.min(
          255,
          _color.red - (255 * -p).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          _color.green - (255 * -p).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          _color.blue - (255 * -p).round(),
        ),
      ),
    );
    return this;
  }

  TinyColor darken([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = toHSLColor();
    final lightness = clamp01(hsl.lightness - p);
    _color = hsl.withLightness(lightness).toColor();
    return this;
  }

  TinyColor tint([int amount = 10]) => mix(
        const Color.fromRGBO(255, 255, 255, 1.0),
        amount,
      );

  TinyColor shade([int amount = 10]) => mix(
        const Color.fromRGBO(0, 0, 0, 1.0),
        amount,
      );

  TinyColor desaturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = toHSLColor();
    final saturation = clamp01(hsl.saturation - p);
    _color = hsl.withSaturation(saturation).toColor();
    return this;
  }

  TinyColor saturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = toHSLColor();
    final saturation = clamp01(hsl.saturation + p);
    _color = hsl.withSaturation(saturation).toColor();
    return this;
  }

  TinyColor greyscale() => desaturate(100);

  TinyColor spin(double amount) {
    final hsl = toHSLColor();
    final hue = (hsl.hue + amount) % 360;
    _color = hsl.withHue(hue < 0 ? 360 + hue : hue).toColor();
    return this;
  }

  TinyColor mix(Color toColor, [int amount = 50]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    _color = Color.fromARGB(
      ((toColor.alpha - _color.alpha) * p + _color.alpha).round(),
      ((toColor.red - _color.red) * p + _color.red).round(),
      ((toColor.green - _color.green) * p + _color.green).round(),
      ((toColor.blue - _color.blue) * p + _color.blue).round(),
    );
    return this;
  }

  TinyColor complement() {
    final hsl = toHSLColor();
    final hue = (hsl.hue + 180) % 360;
    _color = hsl.withHue(hue).toColor();
    return this;
  }

  Color get color => toColor();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TinyColor &&
          runtimeType == other.runtimeType &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;

  @Deprecated('Use == instead.')
  bool equals(Object other) => this == other;
}
