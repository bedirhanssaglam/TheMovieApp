import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants? get instance {
    _instance ??= AppConstants._init();
    return _instance;
  }

  AppConstants._init();

  final String baseUrl = "https://api.themoviedb.org/3/";
  final String baserUrlForImage = "https://image.tmdb.org/t/p/original/";

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
