import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'interface_theme.dart';

class AppThemeDark extends AppTheme with ITheme {
  static AppThemeDark? _instance;

  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headline1: textThemeDark!.headline1,
          headline2: textThemeDark!.headline2,
          headline3: textThemeDark!.headline3,
          headline4: textThemeDark!.headline4,
          headline5: textThemeDark!.headline5,
          bodyText1: textThemeDark!.bodyText1,
          bodyText2: textThemeDark!.bodyText2,
          subtitle1: textThemeDark!.subtitle1,
          subtitle2: textThemeDark!.subtitle2,
        ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: AppConstants.instance.outerSpace,
            elevation: 3,
            iconTheme:
                IconThemeData(color: AppConstants.instance.grey, size: 21),
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: AppConstants.instance.grey,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.3),
            ),
            focusedBorder: const OutlineInputBorder()),
        scaffoldBackgroundColor: AppConstants.instance.outerSpace,
        buttonTheme: ThemeData.dark().buttonTheme.copyWith(
              colorScheme: ColorScheme.dark(
                onError: AppConstants.instance.carnation,
              ),
            ),
        backgroundColor: AppConstants.instance.outerSpace,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      );
}
