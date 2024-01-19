import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationData {
  final int selectedIndex;
  const NavigationData({required this.selectedIndex});
}

class NavigationNotifier extends StateNotifier<NavigationData> {
  NavigationNotifier() : super(const NavigationData(selectedIndex: 0));

  void changeIndex(int index) {
    state = NavigationData(selectedIndex: index);
  }
}
