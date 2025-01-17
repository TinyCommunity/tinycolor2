import 'package:flutter/painting.dart' show Color, HSLColor, HSVColor;
import 'package:flutter_test/flutter_test.dart';
import 'package:tinycolor2/tinycolor2.dart';

void main() {
  group(
    "TinyColor.fromColor()",
    () {
      TinyColor? color;
      setUp(() {
        color = TinyColor.fromColor(const Color(0xFFFFFFFF));
      });
      tearDown(() {
        color = null;
      });
      test(
        ".toColor()",
        () {
          expect(
            color!.toColor(),
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".toHex8()",
        () {
          expect(
            color!.toHex8(),
            "ffffffff",
          );
        },
      );
      test(
        ".getBrightness()",
        () {
          expect(
            color!.getBrightness(),
            255,
          );
        },
      );
      test(
        ".isLight()",
        () {
          expect(
            color!.isLight(),
            true,
          );
        },
      );
      test(
        ".isDark()",
        () {
          expect(
            color!.isDark(),
            false,
          );
        },
      );
      test(
        ".getLuminance()",
        () {
          expect(
            color!.getLuminance(),
            const Color(0xFFFFFFFF).computeLuminance(),
          );
        },
      );
      test(
        ".setAlpha()",
        () {
          expect(
            color!.setAlpha(0x00).color.alpha,
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
            color!.setOpacity(0.5).color.opacity,
            moreOrLessEquals(0.5, epsilon: 1e-2),
          );
        },
      );
      group(
        ".lighten()",
        () {
          test(
            "0",
            () {
              expect(
                color!.lighten(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.lighten(100).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.lighten().color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      group(
        ".brighten()",
        () {
          test(
            "0",
            () {
              expect(
                color!.brighten(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.brighten(100).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.brighten().color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      group(
        ".darken()",
        () {
          test(
            "0",
            () {
              expect(
                color!.darken(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.darken(100).color,
                const Color(0xFF000000),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.darken().color,
                const Color(0xFFE6E6E6),
              );
            },
          );
        },
      );
      group(
        ".tint()",
        () {
          test(
            "0",
            () {
              expect(
                color!.tint(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.tint(100).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.tint().color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      group(
        ".shade()",
        () {
          test(
            "0",
            () {
              expect(
                color!.shade(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.shade(100).color,
                const Color(0xFF000000),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.shade().color,
                const Color(0xFFE6E6E6),
              );
            },
          );
        },
      );
      group(
        ".desaturate()",
        () {
          test(
            "0",
            () {
              expect(
                color!.desaturate(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.desaturate(100).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.desaturate().color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      group(
        ".saturate()",
        () {
          test(
            "0",
            () {
              expect(
                color!.saturate(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.saturate(100).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.saturate().color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      test(
        ".greyscale()",
        () {
          expect(
            color!.greyscale().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      group(
        ".spin()",
        () {
          test(
            "-360",
            () {
              expect(
                color!.spin(-360).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "-180",
            () {
              expect(
                color!.spin(-180).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "0",
            () {
              expect(
                color!.spin(0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "180",
            () {
              expect(
                color!.spin(180).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "360",
            () {
              expect(
                color!.spin(360).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
        },
      );
      test(
        ".complement()",
        () {
          expect(
            color!.complement().color,
            const Color(0xFFFFFFFF),
          );
        },
      );
      group(
        ".mix()",
        () {
          test(
            "0",
            () {
              expect(
                color!.mix(const Color(0xFF000000), 0).color,
                const Color(0xFFFFFFFF),
              );
            },
          );
          test(
            "100",
            () {
              expect(
                color!.mix(const Color(0xFF000000), 100).color,
                const Color(0xFF000000),
              );
            },
          );
          test(
            "default",
            () {
              expect(
                color!.mix(const Color(0xFF000000)).color,
                const Color(0xFF808080),
              );
            },
          );
        },
      );
      test(
        ".clone()",
        () {
          expect(
            color!.clone(),
            TinyColor.fromColor(const Color(0xFFFFFFFF)),
          );
        },
      );
      test(
        "==",
        () {
          expect(
            color,
            TinyColor.fromColor(const Color(0xFFFFFFFF)),
          );
        },
      );
    },
  );

  group(
    "TinyColor.fromHSLColor()",
    () {
      final TinyColor color =
          TinyColor.fromHSLColor(HSLColor.fromColor(const Color(0xFFFFFFFF)));
      test(
        ".toColor()",
        () {
          expect(
            color.toColor(),
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".toHSLColor()",
        () {
          expect(
            color.toHSLColor(),
            HSLColor.fromColor(const Color(0xFFFFFFFF)),
          );
        },
      );
    },
  );

  group(
    "TinyColor.fromHSVColor()",
    () {
      final TinyColor color =
          TinyColor.fromHSVColor(HSVColor.fromColor(const Color(0xFFFFFFFF)));
      test(
        ".toColor()",
        () {
          expect(
            color.toColor(),
            const Color(0xFFFFFFFF),
          );
        },
      );
      test(
        ".toHSVColor()",
        () {
          expect(
            color.toHSVColor(),
            HSVColor.fromColor(const Color(0xFFFFFFFF)),
          );
        },
      );
    },
  );
}
