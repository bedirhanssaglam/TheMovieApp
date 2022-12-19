import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bot_toast/bot_toast.dart';

import 'src/core/constants/app/app_constants.dart';
import 'src/core/init/dependency_injector.dart';
import 'src/core/init/main_build/main_build.dart';
import 'src/core/init/routes/routes.dart';
import 'src/core/init/theme/theme_data.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: DependencyInjector.instance.repositoryProviders,
      child: MultiBlocProvider(
        providers: DependencyInjector.instance.globalBlocProviders,
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final botToastBuilder = BotToastInit();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.instance.appName,
          theme: AppThemeDark.instance.theme,
          builder: (context, child) => botToastBuilder(
            context,
            MainBuild(child: child),
          ),
          routerConfig: Routes.instance.routes,
        );
      },
    );
  }
}
