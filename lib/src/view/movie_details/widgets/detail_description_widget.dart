import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/functions/base_functions.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/extensions/string_extensions.dart';

import '../../../core/base/models/movie_model.dart';
import '../../../core/components/button/button_widget.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class DetailDescriptionWidget extends StatelessWidget {
  const DetailDescriptionWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.h.ph,
              CustomText(
                "Overview",
                textStyle: context.textTheme.headline1?.copyWith(
                  color: AppConstants.instance.malibu,
                ),
              ),
              3.h.ph,
              CustomText(
                "${movie.overview}",
                textStyle: context.textTheme.headline1?.copyWith(
                  color: AppConstants.instance.outerSpace,
                ),
              ),
              5.h.ph,
              Row(
                children: [
                  ButtonWidget(
                    onTap: () {},
                    text: "BUY",
                    width: 75,
                  ),
                  2.w.pw,
                  _buildOverageCircular(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CircularPercentIndicator _buildOverageCircular(BuildContext context) {
    return CircularPercentIndicator(
      radius: 3.h,
      restartAnimation: true,
      animation: true,
      curve: Curves.easeInOut,
      percent: ("${movie.voteAverage}").parseDouble / 10,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppConstants.instance.dodgerBlue,
      arcType: ArcType.FULL,
      center: CustomText(
        toShortDoubleNumber(
          ("${movie.voteAverage}").parseDouble,
        ),
        textStyle: context.textTheme.headline1?.copyWith(
          color: AppConstants.instance.outerSpace,
        ),
      ),
    );
  }
}
