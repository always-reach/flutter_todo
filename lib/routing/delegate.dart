import 'package:flutter/material.dart';
import 'package:todo/navigator/bottom_navigator.dart';

class RoutePath {
  final bool isDetailsPage;

  RoutePath.home() : isDetailsPage = false;
  RoutePath.details() : isDetailsPage = true;
}

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  bool _showDetails = false;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return const Navigator(pages: [
      MaterialPage(key: ValueKey("HomePage"), child: BottomNavigator()),
    ]);
  }

  @override
  RoutePath get currentConfiguration {
    return _showDetails ? RoutePath.details() : RoutePath.home();
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    _showDetails = configuration.isDetailsPage;
  }
}
