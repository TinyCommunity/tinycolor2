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
            255,
          );
        },
      );
      test(
        ".isLight()",
        () {
          expect(
            color.isLight(),
            true,
          );
        },
      );
      test(
        ".isDark()",
        () {
          expect(
            color.isDark(),
            false,
          );
        },
      );
      test(
        ".getLuminance()",
        () {
          expect(
            color.getLuminance(),
            const Color(0xFFFFFFFF).computeLuminance(),
          );
        },
      );
      test(
        ".setAlpha()",
        () {
          expect(
            color.setAlpha(0x00).color.alpha,
            0x00,
          );
        },
      );
      test(
        ".setOpacity()",
        () {
          // underlying dart implementation converts the opacity value to an
          // int, then back into a double. Thus some precision is loss.
          expect(
            color.setOpacity(0.5).color.opacity,
            moreOrLessEquals(0.5, epsilon: 1e-2),
          );
        },
      );
      test(
        ".clone()",
        () {
          expect(
            color.clone(),
            TinyColor(const Color(0xFFFFFFFF)),
          );
        },
      );
      test(
        "==",
        () {
          expect(
            color == TinyColor(const Color(0xFFFFFFFF)),
            true,
          );
        },
      );
    },
  );
}
