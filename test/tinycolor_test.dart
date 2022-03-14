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
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.setAlpha(0x00).color.alpha,
            0x00,
          );
        },
      );
      test(
        ".setOpacity()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          // underlying dart implementation converts the opacity value to an
          // int, then back into a double. Thus some precision is loss.
          expect(
            newColor.setOpacity(0.5).color.opacity,
            moreOrLessEquals(0.5, epsilon: 1e-2),
          );
        },
      );
      test(
        ".lighten()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.lighten(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.lighten(100).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.lighten().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".brighten()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.brighten(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.brighten(100).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.brighten().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".darken()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.darken(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.darken(100).color,
            const Color(0xFF000000),
          );
          expect(
            newColor.darken().color,
            const Color(0xFFE6E6E6),
          );
        },
      );
      test(
        ".tint()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.tint(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.tint(100).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.tint().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".shade()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.shade(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.shade(100).color,
            const Color(0xFF000000),
          );
          expect(
            newColor.shade().color,
            const Color(0xFFE6E6E6),
          );
        },
      );
      test(
        ".desaturate()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.desaturate(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.desaturate(100).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.desaturate().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".saturate()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.saturate(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.saturate(100).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.saturate().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".greyscale()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.greyscale().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".spin()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.spin(-360).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.spin(-180).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.spin(0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.spin(180).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.spin(360).color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".complement()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.complement().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".mix()",
        () {
          final TinyColor newColor = TinyColor(const Color(0xFFFFFFFF));
          expect(
            newColor.mix(const Color(0xFF000000), 0).color,
            const Color(0xFFFFFFFF),
          );
          expect(
            newColor.mix(const Color(0xFF000000), 100).color,
            const Color(0xFF000000),
          );
          expect(
            newColor.mix(const Color(0xFF000000)).color,
            const Color(0xFF808080),
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
