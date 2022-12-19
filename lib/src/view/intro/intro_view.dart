import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/extensions/string_extensions.dart';
import 'package:the_movie/src/view/intro/widgets/intro_header_widget.dart';

import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/app_constants.dart';
import '../../core/constants/enums/icon_enums.dart';
import '../../core/constants/enums/route_enums.dart';
import 'riverpod/current_page_riverpod.dart';

class IntroView extends ConsumerWidget {
  IntroView({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            10.h.ph,
            Consumer(
              builder: (context, ref, child) {
                return _buildIntroHeader(ref);
              },
            ),
            _buildPageDots(ref, context),
          ],
        ),
      ),
    );
  }

  Expanded _buildIntroHeader(WidgetRef ref) {
    return Expanded(
      flex: 8,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          ref.read(currentPageRiverpod.notifier).state = value;
        },
        itemCount: AppConstants.instance.splashData.length,
        itemBuilder: (context, index) => IntroHeaderWidget(
          image: AppConstants.instance.splashData[index]["image"]!,
          text: AppConstants.instance.splashData[index]['text']!,
        ),
      ),
    );
  }

  Expanded _buildPageDots(WidgetRef ref, BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          40.w.pw,
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppConstants.instance.splashData.length,
                  (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 1.w),
                      height: 1.5.w,
                      width:
                          ref.watch(currentPageRiverpod) == index ? 6.w : 2.5.w,
                      decoration: BoxDecoration(
                        color: ref.watch(currentPageRiverpod) == index
                            ? AppConstants.instance.malibu
                            : AppConstants.instance.shark,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  },
                ),
              ),
              22.w.pw,
              _buildSkipButton(context),
            ],
          ),
        ],
      ),
    );
  }

  InkWell _buildSkipButton(BuildContext context) {
    return InkWell(
      onTap: () => context.go(RouteEnums.home.routeName),
      child: Row(
        children: [
          CustomText(
            "Skip",
            textStyle: context.textTheme.headline1?.copyWith(
              color: AppConstants.instance.malibu,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(
            IconEnums.arrowForward.iconName.toSvg,
            height: 18.sp,
            color: AppConstants.instance.malibu,
          ),
        ],
      ),
    );
  }
}
