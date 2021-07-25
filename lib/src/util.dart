import 'dart:math' as math;

double bound01(double value, double max) {
  final double n = max == 360.0 ? value : math.min(max, math.max(0.0, value));
  final double absDifference = n - max;
  if (absDifference.abs() < 0.000001) {
    return 1.0;
  }

  if (max == 360) {
    return (n < 0 ? n % max + max : n % max) / max;
  } else {
    return (n % max) / max;
  }
}

double clamp01(double val) => math.min(1.0, math.max(0.0, val));
