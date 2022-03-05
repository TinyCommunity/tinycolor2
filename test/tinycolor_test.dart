import 'dart:ui' show Color;

import 'package:flutter_test/flutter_test.dart';
import 'package:tinycolor2/tinycolor2.dart';

void main() {
  group(
    "TinyColor()",
    () {
      final TinyColor color = TinyColor(const Color(0xFFFFFFFF));
      test(
        ".color",
        () {
          expect(
            color.color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".getBrightness()",
        () {
          expect(
            color.getBrightness(),
            color.color.brightness,
          );
        },
      );
      test(
        ".isLight()",
        () {
          expect(
            color.isLight(),
            color.color.isLight,
          );
        },
      );
      test(
        ".isDark()",
        () {
          expect(
            color.isDark(),
            color.color.isDark,
          );
        },
      );
      test(
        ".getLuminance()",
        () {
          expect(
            color.getLuminance(),
            color.color.luminance,
          );
        },
      );
      test(
        ".setAlpha()",
        () {
          color.setAlpha(0x00);
          expect(
            color.color.alpha,
            0x00,
          );
        },
      );
      test(
        ".setOpacity()",
        () {
          color.setOpacity(0.5);
          // underlying dart implementation converts the opacity value to an
          // int, then back into a double. Thus some precision is loss.
          expect(
            color.color.opacity,
            moreOrLessEquals(0.5, epsilon: 1e-2),
          );
        },
      );
    },
  );
}
