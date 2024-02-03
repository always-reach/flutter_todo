import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/routing/delegate.dart';
import 'package:todo/routing/path.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppRouterDelegate routerDelegate =
        Router.of(context).routerDelegate as AppRouterDelegate;
    return Consumer(
      builder: (BuildContext context, WidgetRef child, Widget? widget) {
        return Scaffold(
          body: routerDelegate.getTabPage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "Task",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: "Reword",
              ),
            ],
            currentIndex: routerDelegate.getBottomNavigationIndex(),
            onTap: (index) {
              RoutePath routePath =
                  index == 0 ? RoutePath.tasks() : RoutePath.rewards();
              routerDelegate.changeTabPage(routePath);
            },
          ),
        );
      },
    );
  }
}
