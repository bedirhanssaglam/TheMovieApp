import 'package:flutter/material.dart';

class AutoFade extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;

  const AutoFade(
      {super.key,
      required this.delay,
      required this.duration,
      required this.offset,
      required this.curve,
      required this.child});

  @override
  State<AutoFade> createState() => _AutoFadeState();
}

class _AutoFadeState extends State<AutoFade>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> anim;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(vsync: this, duration: widget.duration);
    animController.addListener(() => setState(() {}));
    anim = animController.drive(CurveTween(curve: widget.curve));
    Future.delayed(widget.delay, animController.forward);
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Offset startPos = widget.offset;
    Animation<Offset> position =
        Tween<Offset>(begin: startPos, end: Offset.zero).animate(anim);
    return Transform.translate(
      offset: position.value,
      child: Opacity(
        opacity: anim.value,
        child: widget.child,
      ),
    );
  }
}
