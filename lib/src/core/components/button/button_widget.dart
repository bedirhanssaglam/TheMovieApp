import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';

import '../../constants/app/app_constants.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  const ButtonWidget({
    Key? key,
    this.text = "",
    this.width = 90,
    this.height = 5.5,
    required this.onTap,
    this.fontSize = 13,
    this.textColor = Colors.white,
    this.fontWeight,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: widget.height?.h,
          width: widget.width?.w,
          decoration: BoxDecoration(
            color: AppConstants.instance.dodgerBlue,
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.white12,
                blurRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: CustomText(
              widget.text!,
              textStyle: context.textTheme.headline1?.copyWith(
                color: widget.textColor,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize?.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
