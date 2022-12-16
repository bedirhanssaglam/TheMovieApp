import 'package:flutter/material.dart';

class AnimatedScale extends StatelessWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  final double beginScale;
  final Curve curve;

  const AnimatedScale({
    super.key,
    required this.scale,
    required this.duration,
    required this.beginScale,
    required this.curve,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: beginScale, end: scale),
      curve: curve,
      duration: duration,
      child: child,
      builder: (_, value, cachedChild) {
        return Transform.scale(
          scale: value,
          child: cachedChild,
        );
      },
    );
  }
}
