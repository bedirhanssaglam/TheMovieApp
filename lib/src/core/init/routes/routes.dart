import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../view/home/home_view.dart';
import '../../base/functions/base_functions.dart';
import '../../constants/enums/route_enums.dart';

final GlobalKey<NavigatorState> mainNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'main');

class Routes {
  static Routes? _instance;
  static Routes get instance {
    _instance ??= Routes._init();
    return _instance!;
  }

  Routes._init();

  GoRouter routes = GoRouter(
    navigatorKey: mainNavigatorKey,
    initialLocation: RouteEnums.home.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RouteEnums.home.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const HomeView(),
          );
        },
      ),
    ],
  );
}
