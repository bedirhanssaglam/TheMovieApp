import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'src/core/constants/app/app_constants.dart';
import 'src/core/init/routes/routes.dart';
import 'src/core/init/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.instance.appName,
          theme: AppThemeDark.instance.theme,
          routerConfig: Routes.instance.routes,
        );
      },
    );
  }
}
