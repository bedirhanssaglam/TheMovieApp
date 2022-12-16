import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';
import '../text/custom_text.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 4.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: AppConstants.instance.dodgerBlue.withOpacity(.4),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: CustomText(
                "Godfather",
                textStyle: context.textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
