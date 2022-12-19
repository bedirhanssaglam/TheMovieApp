import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:the_movie/src/core/components/appbar/custom_app_bar.dart';
import 'package:the_movie/src/core/components/button/button_widget.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/constants/app/app_constants.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Opacity(
                      opacity: .7,
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
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
                              "The Godfather",
                              textStyle: context.textTheme.headline2?.copyWith(
                                color: AppConstants.instance.mineShaft,
                              ),
                            ),
                            3.h.ph,
                            Container(
                              height: 5.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color: AppConstants.instance.dodgerBlue
                                      .withOpacity(.2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    "Drama, Crime",
                                    textStyle:
                                        context.textTheme.headline1?.copyWith(
                                      color: AppConstants.instance.outerSpace,
                                    ),
                                  ),
                                  CustomText(
                                    "Popularity: 103.802",
                                    textStyle:
                                        context.textTheme.headline1?.copyWith(
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
                ),
                Positioned(
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
                            "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
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
                              CircularPercentIndicator(
                                radius: 3.h,
                                restartAnimation: true,
                                animation: true,
                                curve: Curves.easeInOut,
                                percent: .94,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppConstants.instance.dodgerBlue,
                                arcType: ArcType.FULL,
                                center: CustomText(
                                  "9.4",
                                  textStyle:
                                      context.textTheme.headline1?.copyWith(
                                    color: AppConstants.instance.outerSpace,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
