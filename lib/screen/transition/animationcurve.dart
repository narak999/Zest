import 'dart:math';

import 'package:flutter/animation.dart';

class AnimationCurve extends Curve {
  @override
  double transform(double t) {
    final double flip = Random().nextBool() ? 1.0 : -1.0;
    final double amplitude = 0.3 + Random().nextDouble() * 0.7;
    final double period = 0.5 + Random().nextDouble();
    return flip *
        amplitude *
        sin(period * pi * t) *
        pow(2, -10 * t) +
        1;
  }
}