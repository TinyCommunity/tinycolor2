import 'package:flutter/painting.dart';
import 'package:tinycolor2/src/tinycolor.dart';

/// Extends the Color class to allow direct TinyColor manipulation natively
extension TinyColorExtension on Color {
  /// Converts standard Color to TinyColor object
  TinyColor toTinyColor() => TinyColor.fromColor(this);

  HSVColor toHSVColor() => TinyColor.fromColor(this).toHSVColor();

  HSLColor toHSLColor() => TinyColor.fromColor(this).toHSLColor();

  String toHex8() => TinyColor.fromColor(this).toHex8();

  /// Lighten the color a given amount, from 0 to 100. Providing 100 will always return white.
  Color lighten([int amount = 10]) =>
      TinyColor.fromColor(this).lighten(amount).toColor();

  /// Brighten the color a given amount, from 0 to 100.
  Color brighten([int amount = 10]) =>
      TinyColor.fromColor(this).brighten(amount).toColor();

  /// Darken the color a given amount, from 0 to 100. Providing 100 will always return black.
  Color darken([int amount = 10]) =>
      TinyColor.fromColor(this).darken(amount).toColor();

  /// Mix the color with pure white, from 0 to 100. Providing 0 will do nothing, providing 100 will always return white.
  Color tint([int amount = 10]) =>
      TinyColor.fromColor(this).tint(amount).toColor();

  /// Mix the color with pure black, from 0 to 100. Providing 0 will do nothing, providing 100 will always return black.
  Color shade([int amount = 10]) =>
      TinyColor.fromColor(this).shade(amount).toColor();

  /// Desaturate the color a given amount, from 0 to 100. Providing 100 will is the same as calling greyscale.
  Color desaturate([int amount = 10]) =>
      TinyColor.fromColor(this).desaturate(amount).toColor();

  /// Saturate the color a given amount, from 0 to 100.
  Color saturate([int amount = 10]) =>
      TinyColor.fromColor(this).saturate(amount).toColor();

  /// Completely desaturates a color into greyscale. Same as calling desaturate(100).
  Color greyscale() => TinyColor.fromColor(this).greyscale().toColor();

  /// Spin the hue a given amount, from -360 to 360. Calling with 0, 360, or -360 will do nothing (since it sets the hue back to what it was before).
  Color spin([double amount = 0]) =>
      TinyColor.fromColor(this).spin(amount).toColor();

  /// Blends the color with another color a given amount, from 0 - 100, default 50.
  Color mix(Color toColor, [int amount = 50]) =>
      TinyColor.fromColor(this).mix(toColor, amount).toColor();

  /// Returns the complementary color for dynamic matching
  Color complement() => TinyColor.fromColor(this).complement().toColor();

  /// Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).
  double get brightness => TinyColor.fromColor(this).getBrightness();

  /// Return the perceived luminance of a color, a shorthand for flutter Color.computeLuminance
  double get luminance => TinyColor.fromColor(this).getLuminance();

  /// Return a boolean indicating whether the color's perceived brightness is light.
  bool get isLight => TinyColor.fromColor(this).isLight();

  /// Return a boolean indicating whether the color's perceived brightness is dark.
  bool get isDark => TinyColor.fromColor(this).isDark();
}
