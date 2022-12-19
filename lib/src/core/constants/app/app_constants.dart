import 'package:flutter/material.dart';

import '../enums/icon_enums.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  final String appName = "The Movie";
  final String apiKey = "[YOUR_API_KEY]";
  final String baseUrl = "https://api.themoviedb.org/3/";
  final String baserUrlForImage = "https://image.tmdb.org/t/p/original/";

  final List<Map<String, String>> splashData = [
    {
      "text":
          "A comprehensive news application that brings together all the news you need to know in Turkey and the US during the day.",
      "image": IconEnums.introFirst.iconName,
    },
    {
      "text":
          "Thanks to The News, which brings together the prominent topics of the agenda and last-minute developments, as well as many resources for different interests, everything you should not miss is at your fingertips.",
      "image": IconEnums.introSecond.iconName,
    },
    {
      "text":
          "Come every day and check out all the news that might interest you! So let's start!",
      "image": IconEnums.introThird.iconName,
    },
  ];

  final Color outerSpace = const Color(0xff33393E);
  final Color mineShaft = const Color(0xff252525);
  final Color dodgerBlue = const Color(0xff00BBFF);
  final Color malibu = const Color(0xff55CCF7);
  final Color grey = const Color(0xffC2C2C2);
  final Color carnation = const Color(0xffFA4F4F);
  final Color gray = const Color(0xff8C8C8C);
  final Color mischka = const Color(0xffDAD9DE);
  final Color paleSky = const Color(0xff6E7278);
  final Color shark = const Color(0xff222426);
}
