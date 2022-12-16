import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class CircularCategories extends StatefulWidget {
  const CircularCategories({
    super.key,
    required this.image,
    required this.text,
    this.path,
  });

  final String image;
  final String text;
  final String? path;

  @override
  State<CircularCategories> createState() => _CircularCategoriesState();
}

class _CircularCategoriesState extends State<CircularCategories>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: .5,
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
    return Padding(
      padding: EdgeInsets.only(right: 1.w),
      child: GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        onTap: () {
          widget.path != null ? context.go(widget.path!) : null;
        },
        child: Transform.scale(
          scale: _scale,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCircularCard(),
              1.h.ph,
              CustomText(
                widget.text,
                textStyle: context.textTheme.headline1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCircularCard() {
    return Container(
      width: 15.w + 40,
      height: 8.h + 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(color: AppConstants.instance.dodgerBlue, width: 2),
      ),
    );
  }
}
