# Changelog

## [3.0.0] - 2022-09-12

- Upgrade to Flutter 3.3.0
- Upgrade lint package to 1.1.0

## [2.1.0] - 2022-06-20

### Changed
* Rename constructors and methods per Dart & Flutter naming conventions at [PR #41](https://github.com/TinyCommunity/tinycolor2/pull/41)
* `HslColor` class is now deprecated in favor of native `HSLColor` at [PR #18](https://github.com/TinyCommunity/tinycolor2/pull/35)
* Deprecated TinyColor.fromRGB() at [PR #40](https://github.com/TinyCommunity/tinycolor2/pull/40)
* Refactor and improve tests at [PR #57](https://github.com/TinyCommunity/tinycolor2/pull/57)
* Update extension codes to remove usage of deprecated methods and add new methods at [PR #59](https://github.com/TinyCommunity/tinycolor2/pull/59)

### Fixed
* Not validating range of parameters at [PR #55](https://github.com/TinyCommunity/tinycolor2/pull/55)
* Split up test for parameterized tests at [PR #58](https://github.com/TinyCommunity/tinycolor2/pull/58)
* Most setters should update internal color value and return this at [PR #42](https://github.com/TinyCommunity/tinycolor2/pull/42)

## [2.0.1] - 2022-03-11

### Changed
* Rewrite tests at [PR #35](https://github.com/TinyCommunity/tinycolor2/pull/35)

### Fixed
* `.mix()` not matching readme usage at [PR #44](https://github.com/TinyCommunity/tinycolor2/pull/44)
* `.greyscale()` should be a method, not a property in `Color` extension at [PR #45](https://github.com/TinyCommunity/tinycolor2/pull/45)
* Typo in `.complement()` naming at [PR #43](https://github.com/TinyCommunity/tinycolor2/pull/43)
* `alpha` range should be `0`-`255` at [PR #39](https://github.com/TinyCommunity/tinycolor2/pull/39)

## [2.0.0] - 2021-07-28

### Added
* `.toHex8()` at [PR #17](https://github.com/TinyCommunity/tinycolor2/pull/17)
* `.equals()` and `operator ==` at [PR #16](https://github.com/TinyCommunity/tinycolor2/pull/16)
* Example project at [PR #13](https://github.com/TinyCommunity/tinycolor2/pull/13)

### Changed
* Forked as a community version with new name `tinycolor2`
* Null safety migration w/ dependency upgrade at [PR #24](https://github.com/TinyCommunity/tinycolor2/pull/24)
* Library restructure at [PR #5](https://github.com/TinyCommunity/tinycolor2/pull/5)

### Fixed
* #2, #6, #10 from upstream at [PR #5](https://github.com/TinyCommunity/tinycolor2/pull/5)

## [1.0.3] - 2020-08-27

### Added
* `Color` class extension method for direct usage

## [1.0.2] - 2018-08-17

### Fixed
* Compatibility issues with Dart `2.1` and `pigment` `1.0.3`

## [1.0.1] - 2018-08-04

### Fixed
* `HSLColor` class name duplicate definition

### Changed
* Package description

## [1.0.0] - 2018-08-04

### Added
* Initial port of `tinycolor2`
