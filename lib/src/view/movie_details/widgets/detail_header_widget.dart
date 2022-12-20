import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../../core/base/models/movie_model.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMovieImage(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 15.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                3.h.ph,
                CustomText(
                  "${movie.title}",
                  textStyle: context.textTheme.headline2?.copyWith(
                    color: AppConstants.instance.mineShaft,
                  ),
                ),
                3.h.ph,
                Container(
                  height: 5.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: AppConstants.instance.dodgerBlue.withOpacity(.2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        "Release Date: ${movie.releaseDate}",
                        textStyle: context.textTheme.headline1?.copyWith(
                          fontSize: 10.sp,
                          color: AppConstants.instance.outerSpace,
                        ),
                      ),
                      CustomText(
                        "Popularity: ${movie.popularity}",
                        textStyle: context.textTheme.headline1?.copyWith(
                          fontSize: 10.sp,
                          color: AppConstants.instance.outerSpace,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Opacity _buildMovieImage() {
    return Opacity(
      opacity: .7,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "${AppConstants.instance.baserUrlForImage}${movie.backdropPath}",
            ),
          ),
        ),
      ),
    );
  }
}
