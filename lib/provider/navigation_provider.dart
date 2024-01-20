import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/notifier/navigation_notifier.dart';

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationData>((ref) {
  return NavigationNotifier();
});
