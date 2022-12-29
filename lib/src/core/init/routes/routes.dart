import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie/src/view/discover/discover_view.dart';
import 'package:the_movie/src/view/intro/intro_view.dart';
import 'package:the_movie/src/view/movie_details/movie_details_view.dart';
import 'package:the_movie/src/view/now_playing_movies/now_playing_movies_view.dart';
import 'package:the_movie/src/view/searched_movies/searched_movies_view.dart';
import 'package:the_movie/src/view/splash/splash_view.dart';
import 'package:the_movie/src/view/top_rated/top_rated_view.dart';

import '../../../view/home/home_view.dart';
import '../../base/functions/base_functions.dart';
import '../../components/scaffold/custom_scaffold.dart';
import '../../constants/enums/route_enums.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

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
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteEnums.splash.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RouteEnums.splash.routeName,
        pageBuilder: (context, state) {
          return BaseFunctions.instance.animatedRouting(
            state: state,
            route: const SplashView(),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.intro.routeName,
        pageBuilder: (context, state) {
          return BaseFunctions.instance.animatedRouting(
            state: state,
            route: IntroView(),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.movieDetails.routeName,
        pageBuilder: (context, state) {
          return BaseFunctions.instance.animatedRouting(
            state: state,
            route: MovieDetailsView(
              id: int.tryParse(state.params['id'] ?? "")!,
            ),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.searchedMovies.routeName,
        pageBuilder: (context, state) {
          return BaseFunctions.instance.animatedRouting(
            state: state,
            route: SearchedMoviesView(
              searchWord: state.params['searchWord'] ?? "",
            ),
          );
        },
      ),
      ShellRoute(
        navigatorKey: mainNavigatorKey,
        pageBuilder: (context, state, child) =>
            BaseFunctions.instance.animatedRouting(
          state: state,
          route: CustomScaffold(
            navigatorState: state,
            child: child,
          ),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: RouteEnums.home.routeName,
            pageBuilder: (context, state) {
              return BaseFunctions.instance.animatedRouting(
                state: state,
                route: const HomeView(),
              );
            },
          ),
          GoRoute(
            path: RouteEnums.discover.routeName,
            pageBuilder: (context, state) {
              return BaseFunctions.instance.animatedRouting(
                state: state,
                route: const DiscoverView(),
              );
            },
          ),
          GoRoute(
            path: RouteEnums.topRated.routeName,
            pageBuilder: (context, state) {
              return BaseFunctions.instance.animatedRouting(
                state: state,
                route: const TopRatedView(),
              );
            },
          ),
          GoRoute(
            path: RouteEnums.nowPlayingMovies.routeName,
            pageBuilder: (context, state) {
              return BaseFunctions.instance.animatedRouting(
                state: state,
                route: const NowPlayingMoviesView(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
