# tinycolor2
> TinyColor is a small library for Flutter color manipulation and conversion

A port of [tinycolor2](https://github.com/bgrins/TinyColor) by [Brian Grinstead](https://github.com/bgrins)

## Getting Started

A `TinyColor` receives a `Color` as parameter.

```dart
import 'package:tinycolor2/tinycolor2.dart';

final TinyColor tinyColor = TinyColor.fromColor(Colors.green);
```
Now you can also use the package to extend the native `Color` class with all the same features, but simpler. To use extension update, make sure to change envieronment sdk version in pubspec like this: ` sdk: ">=2.6.0 <3.0.0"`

## Constructors

### From Flutter's `Color`

```dart
TinyColor.fromColor(Colors.blue);
// or with Color extension
Colors.blue.toTinyColor();
```

### From a Hex String

The package uses [Pigment](https://pub.dartlang.org/packages/pigment) by [Bregy Malpartida Ramos](https://github.com/bregydoc/) to convert strings to `Color`

```dart
TinyColor.fromString('#FE5567');
```

### From `HSLColor`

```dart
final HSLColor color = HSLColor.fromAHSL(1.0, 250, 57, 30);
TinyColor.fromHSLColor(color);
```

### From `HSVColor`

```dart
final HSVColor color = HSVColor.fromAHSV(1.0, 250, 57, 30);
TinyColor.fromHSVColor(color);
```

## Methods

### Conversions

#### `.toColor()`

Returns the Flutter's `Color`

```dart
final Color color = TinyColor.fromColor(Colors.white).toColor();
```

#### `.toHSLColor()`

Returns the Flutter's `HSLColor`

```dart
final HSLColor color = TinyColor.fromColor(Colors.white).toHSLColor();
```

#### `.toHSVColor()`

Returns the Flutter's `HSVColor`

```dart
final HSVColor color = TinyColor.fromColor(Colors.white).toHSVColor();
```

### Properties

### `.isLight()`

Return a boolean indicating whether the color's perceived brightness is light.

```dart
TinyColor.fromString("#ffffff").isLight(); // true
TinyColor.fromString("#000000").isLight(); // false
// or with Color extension
Colors.white.isLight;  // true
```

### `.isDark()`

Return a boolean indicating whether the color's perceived brightness is dark.

```dart
TinyColor.fromString("#ffffff").isDark(); // false
TinyColor.fromString("#000000").isDark(); // true
// or with Color extension
Colors.white.isDark;  // false
```

### `.getBrightness()`

Returns the perceived brightness of a color, from `0` to `255`, as defined by [Web Content Accessibility Guidelines (Version 1.0)](https://www.w3.org/TR/AERT#color-contrast).

```dart
TinyColor.fromString("#ffffff").getBrightness(); // 255
TinyColor.fromString("#000000").getBrightness(); // 0
// or with Color extension
Colors.grey.brightness;  // 127
```

### `.getLuminance()`

Return the perceived luminance of a color, a shorthand for flutter `Color.computeLuminance()`

```dart
TinyColor.fromString("#ffffff").getLuminance();
// or with Color extension
Colors.white.luminance;
```

### Utilities

#### `.clone()`

`clone: function() -> TinyColor`. Instantiate a new `TinyColor` object with the same color. Any changes to the new one won't affect the old one.

```dart
final TinyColor color1 = TinyColor.fromColor(Colors.red);
final TinyColor color2 = color1.clone();
color2.setAlpha(20);
```

#### `==`

`==: function(Object) -> bool`. Compares if `[Object]` is the same `TinyColor` object.

```dart
final TinyColor color1 = TinyColor.fromColor(Colors.blue);
final TinyColor color2 = TinyColor.fromColor(Colors.yellow);
if (color1 == color2) return "same";
else return "different";
```

### Modifications

These methods manipulate the current color, and return it for chaining.

```dart
TinyColor.fromColor(Colors.red).lighten().desaturate().color;
// or with Color extension
Colors.red.lighten().desaturate();
```

#### `.setAlpha()`

Sets the alpha value on the current color, from `0` to `255`.

```dart
TinyColor.fromColor(Colors.red).setAlpha(10);
```

#### `.setOpacity()`

Sets the opacity value on the current color, from `0.0` to `1.0`.

```dart
TinyColor.fromColor(Colors.red).setOpacity(0.5);
```

#### `.lighten()`

`lighten: function(amount = 10) -> TinyColor`. Lighten the color a given amount, from `0` to `100`. Providing `100` will always return white.

```dart
TinyColor.fromColor(Colors.red).lighten().color;
TinyColor.fromColor(Colors.red).lighten(100).color;
// or with Color extension
Colors.red.lighten(50);
```

#### `.brighten()`

`brighten: function(amount = 10) -> TinyColor`. Brighten the color a given amount, from `0` to `100`.

```dart
TinyColor.fromColor(Colors.black).brighten().color;
// or with Color extension
Colors.black.brighten(50);
```

#### `.darken()`

`darken: function(amount = 10) -> TinyColor`. Darken the color a given amount, from `0` to `100`. Providing `100` will always return black.

```dart
TinyColor.fromColor(Colors.red).darken().color;
TinyColor.fromColor(Colors.red).darken(100).color;
// or with Color extension
Colors.red.darken(50);
```

#### `.tint()`

Mix the color with pure white, from `0` to `100`. Providing `0` will do nothing, providing `100` will always return white.

```dart
TinyColor.fromColor(Color.red).tint().color;
TinyColor.fromColor(Color.red).tint(100).color;
// or with Color extension
Colors.red.tint(50);
```

#### `.shade()`

Mix the color with pure black, from `0` to `100`. Providing `0` will do nothing, providing `100` will always return black.

```dart
TinyColor.fromColor(Colors.red).shade().color;
TinyColor.fromColor(Colors.red).shade(100).color;
// or with Color extension
Colors.red.shade(50);
```

#### `.desaturate()`

`desaturate: function(amount = 10) -> TinyColor`. Desaturate the color a given amount, from `0` to `100`. Providing `100` will is the same as calling `greyscale`.

```dart
TinyColor.fromColor(Colors.red).desaturate().color;
TinyColor.fromColor(Colors.red).desaturate(100).color;
// or with Color extension
Colors.red.desaturate(50);
```

#### `.saturate()`

`saturate: function(amount = 10) -> TinyColor`. Saturate the color a given amount, from `0` to `100`.

```dart
TinyColor.fromColor(Colors.red).saturate().color;
// or with Color extension
Colors.red.saturate(50);
```

#### `.greyscale()`

`greyscale: function() -> TinyColor`. Completely desaturates a color into greyscale. Same as calling `desaturate(100)`.

```dart
TinyColor.fromColor(Colors.red).greyscale().color;
// or with Color extension
Colors.red.greyscale();
```

#### `.spin()`

`spin: function(amount) -> TinyColor`. Spin the hue a given amount, from `-360` to `360`. Calling with `0`, `360`, or `-360` will do nothing (since it sets the hue back to what it was before).

```dart
TinyColor.fromColor(Colors.red).spin(180).color;
// or with Color extension
Colors.red.spin(180);

// spin(0) and spin(360) do nothing
TinyColor.fromColor(Colors.red).spin(0).color;
TinyColor.fromColor(Colors.red).spin(360).color;
```

#### `.complement()`

`complement: function() -> TinyColor`. Returns the complementary color for dynamic matching.

```dart
TinyColor.fromColor(Colors.red).complement().color;
// or with Color extension
Colors.red.complement();
```

#### `.mix()`

`mix: function(toColor, amount = 50) -> TinyColor`. Blends the color with another color a given amount, from `0` to `100`.

```dart
TinyColor.fromColor(Colors.red).mix(TinyColor.fromColor(Colors.yellow, 20)).color;
// or with Color extension
Colors.red.mix(Colors.yellow, 20);
```
