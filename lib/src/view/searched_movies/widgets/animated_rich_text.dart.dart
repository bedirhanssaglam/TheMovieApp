import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AnimatedRichText extends StatefulWidget {
  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final TextDecoration? textDecoration;

  const AnimatedRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.secondTextColor,
    this.textDecoration,
  });

  @override
  State<AnimatedRichText> createState() => _AnimatedRichTextState();
}

class _AnimatedRichTextState extends State<AnimatedRichText>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.firstText,
              style: context.textTheme.headline2,
            ),
            TextSpan(
              text: widget.secondText,
              style: context.textTheme.headline2?.copyWith(
                color: widget.secondTextColor,
                decoration: widget.textDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
