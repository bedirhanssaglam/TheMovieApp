import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class BannerTitle extends StatelessWidget {
  const BannerTitle({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.firstTextColor,
    this.secondTextColor,
  }) : super(key: key);

  final String firstText;
  final String secondText;
  final Color? firstTextColor;
  final Color? secondTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: RichText(
            text: TextSpan(
              style:
                  context.textTheme.headline5!.copyWith(color: firstTextColor),
              children: [
                TextSpan(
                  text: firstText,
                  style: context.textTheme.headline3!.copyWith(
                    color: secondTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
                TextSpan(
                  text: secondText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
