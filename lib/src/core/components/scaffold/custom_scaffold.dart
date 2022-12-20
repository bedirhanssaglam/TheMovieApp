import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

import '../../constants/app/app_constants.dart';
import '../../constants/enums/route_enums.dart';
import '../appbar/custom_app_bar.dart';

class CustomScaffold extends StatefulWidget {
  final Widget child;
  final GoRouterState? navigatorState;

  const CustomScaffold({
    Key? key,
    required this.child,
    this.navigatorState,
  }) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int? get currentTabIndex => _getSelectedTabIndex();

  List<String> tabsRouteLocations = [
    RouteEnums.home.routeName,
    RouteEnums.discover.routeName,
    RouteEnums.topRated.routeName,
    RouteEnums.nowPlayingMovies.routeName,
  ];

  _returnHomeView() {
    context.go(tabsRouteLocations.first);
  }

  int? _getSelectedTabIndex() {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    final selected = tabsRouteLocations
        .indexWhere((element) => location.startsWith(element));
    return selected >= 0 ? selected : null;
  }

  void _onItemTapped(int index) {
    final location = tabsRouteLocations
        .firstWhereIndexedOrNull((itemIndex, element) => index == itemIndex);
    if (location != null) context.go(location);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentTabIndex == 0) {
        } else {
          _returnHomeView();
        }
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          navigatorState: widget.navigatorState,
        ),
        bottomNavigationBar: bottomNavBar(),
        body: widget.child,
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: AppConstants.instance.shark,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedItemColor: AppConstants.instance.dodgerBlue,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: AppConstants.instance.grey,
      currentIndex: currentTabIndex ?? 0,
      onTap: (index) {
        _onItemTapped(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Top Rated',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle),
          label: 'Now Playing',
        ),
      ],
    );
  }
}
