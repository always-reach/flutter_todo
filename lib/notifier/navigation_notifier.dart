import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';

class NavigationData {
  final int? selectedId;
  final PageType pageType;
  const NavigationData({required this.selectedId, required this.pageType});
}

class NavigationNotifier extends StateNotifier<NavigationData> {
  NavigationNotifier()
      : super(const NavigationData(
            selectedId: null, pageType: PageType.bottomNavigator));

  void setSelectId(int? id) {
    state = NavigationData(selectedId: id, pageType: state.pageType);
  }

  void setPageType(PageType pageType) {
    state = NavigationData(selectedId: state.selectedId, pageType: pageType);
  }

  bool isPageType(PageType pageType) {
    debugPrint("state selectedId: ${state.selectedId}");
    debugPrint("state pageType: ${state.pageType}");
    switch (pageType) {
      case PageType.tasks:
      case PageType.taskCreate:
      case PageType.rewards:
      case PageType.rewardCreate:
        return state.pageType == pageType;
      case PageType.taskDetail:
      case PageType.rewardDetail:
        return state.pageType == pageType && state.selectedId != null;
      default:
        return false;
    }
  }
}
