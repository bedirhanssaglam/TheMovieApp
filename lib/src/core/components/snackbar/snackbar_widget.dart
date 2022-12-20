import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/app/app_constants.dart';
import '../text/custom_text.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarWidget(
    BuildContext context,
    {required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(
        message,
        textAlign: TextAlign.start,
        textStyle: context.textTheme.headline1?.copyWith(
          color: AppConstants.instance.outerSpace,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 500),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      backgroundColor: AppConstants.instance.carnation,
    ),
  );
}
