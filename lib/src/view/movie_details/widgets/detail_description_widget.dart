import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/components/snackbar/snackbar_widget.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/extensions/string_extensions.dart';

import '../../../core/base/models/movie_model.dart';
import '../../../core/base/singleton/base_singleton.dart';
import '../../../core/components/button/button_widget.dart';
import '../../../core/components/text/custom_text.dart';

class DetailDescriptionWidget extends StatelessWidget with BaseSingleton {
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
                  color: constants.malibu,
                ),
              ),
              3.h.ph,
              CustomText(
                functions.toShortString(
                  "${movie.overview}",
                  countCharacter: 330,
                ),
                textStyle: context.textTheme.headline1?.copyWith(
                  color: constants.outerSpace,
                ),
              ),
              5.h.ph,
              Row(
                children: [
                  ButtonWidget(
                    onTap: () {
                      snackbarWidget(context,
                          message: "This feature is not yet supported.");
                    },
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
      progressColor: constants.dodgerBlue,
      arcType: ArcType.FULL,
      center: CustomText(
        functions.toShortDoubleNumber(
          ("${movie.voteAverage}").parseDouble,
        ),
        textStyle: context.textTheme.headline1?.copyWith(
          color: constants.outerSpace,
        ),
      ),
    );
  }
}
