import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/navigator/bottom_navigator.dart';
import 'package:todo/notifier/navigation_notifier.dart';
import 'package:todo/page/reward_create.dart';
import 'package:todo/page/reward_detail.dart';
import 'package:todo/page/rewards.dart';
import 'package:todo/page/task_create.dart';
import 'package:todo/page/task_detail.dart';
import 'package:todo/page/tasks.dart';
import 'package:todo/provider/navigation_provider.dart';
import 'package:todo/routing/path.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final WidgetRef ref;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate(this.ref) : navigatorKey = GlobalKey<NavigatorState>();

  bool _onPopPage(Route<dynamic>? route, dynamic result) {
    NavigationData navigationData = ref.watch(navigationProvider);
    NavigationNotifier notifier = ref.read(navigationProvider.notifier);
    if (route != null && result != null && !route.didPop(result)) {
      return false;
    }

    if (navigationData.pageType == PageType.taskCreate ||
        navigationData.pageType == PageType.taskDetail) {
      notifier.setSelectId(null);
      notifier.setPageType(PageType.tasks);
    }
    if (navigationData.pageType == PageType.rewardCreate ||
        navigationData.pageType == PageType.rewardDetail) {
      notifier.setSelectId(null);
      notifier.setPageType(PageType.rewards);
    }
    notifyListeners();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    NavigationData navigationData = ref.watch(navigationProvider);
    NavigationNotifier notifier = ref.read(navigationProvider.notifier);
    List<Page> pages = [
      const MaterialPage(key: ValueKey('Home'), child: BottomNavigator()),
    ];
    if (notifier.isPageType(PageType.taskCreate)) {
      pages.add(MaterialPage(
          key: const ValueKey("TaskCreate"), child: TaskCreateForm()));
    }
    if (notifier.isPageType(PageType.taskDetail)) {
      pages.add(MaterialPage(
          key: const ValueKey("TaskDetail"),
          child: TaskDetailPage(id: navigationData.selectedId!)));
    }
    if (notifier.isPageType(PageType.rewardCreate)) {
      pages.add(MaterialPage(
          key: const ValueKey("RewardCreate"), child: RewardCreatePage()));
    }
    if (notifier.isPageType(PageType.rewardDetail)) {
      pages.add(MaterialPage(
          key: const ValueKey("RewardDetail"),
          child: RewardDetailPage(id: navigationData.selectedId!)));
    }

    return Navigator(
      pages: pages,
      onPopPage: _onPopPage,
    );
  }

  @override
  RoutePath get currentConfiguration {
    final NavigationData data = ref.watch(navigationProvider);
    switch (data.pageType) {
      case PageType.tasks:
        return RoutePath.tasks();
      case PageType.taskCreate:
        return RoutePath.taskCreate();
      case PageType.taskDetail:
        return RoutePath.taskDetails(data.selectedId!);
      case PageType.rewards:
        return RoutePath.rewards();
      case PageType.rewardCreate:
        return RoutePath.rewardCreate();
      case PageType.rewardDetail:
        return RoutePath.rewardDetails(data.selectedId!);
      default:
        return RoutePath.bottomNavigate();
    }
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    final notifier = ref.read(navigationProvider.notifier);
    notifier.setSelectId(configuration.id);
    notifier.setPageType(configuration.pageType);
    notifyListeners();
  }

  int getBottomNavigationIndex() {
    final data = ref.watch(navigationProvider);
    switch (data.pageType) {
      case PageType.tasks:
        return 0;
      case PageType.rewards:
        return 1;
      default:
        return 0;
    }
  }

  void changeTabPage(RoutePath configuration) {
    final notifier = ref.read(navigationProvider.notifier);
    notifier.setPageType((configuration.pageType));
    notifyListeners();
  }

  Widget getTabPage() {
    final data = ref.watch(navigationProvider);
    switch (data.pageType) {
      case PageType.tasks:
        return const TaskList();
      case PageType.rewards:
        return const RewardList();
      default:
        return const TaskList();
    }
  }

  void backPage() {
    _onPopPage(null, null);
  }
}
