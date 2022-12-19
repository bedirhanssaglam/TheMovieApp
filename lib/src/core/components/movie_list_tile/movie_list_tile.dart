import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppConstants.instance.shark,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          2.w.pw,
          _movieImage(),
          3.w.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              1.h.ph,
              CustomText(
                "Godfather",
                textStyle: context.textTheme.headline2,
              ),
              1.h.ph,
              const CustomText(
                "Average: 9.4",
              ),
              1.h.ph,
              const CustomText(
                "Vote Count : 1000",
              ),
              1.h.ph,
              const CustomText(
                "Original Language: EN",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _movieImage() {
    return Container(
      height: 13.h,
      width: 26.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
          ),
        ),
      ),
    );
  }
}
