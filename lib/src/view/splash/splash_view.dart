import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/extensions/string_extensions.dart';

import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/app_constants.dart';
import '../../core/constants/enums/icon_enums.dart';
import '../../core/constants/enums/route_enums.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            25.h.ph,
            Lottie.asset(
              IconEnums.splash.iconName.toJson,
              controller: _controller,
              fit: BoxFit.cover,
              height: 40.h,
              animate: true,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(
                    () => context.go(
                      RouteEnums.home.routeName,
                    ),
                  );
              },
            ),
            CustomText(
              AppConstants.instance.appName,
              textStyle: context.textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
