import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/page/rewards.dart';
import 'package:todo/page/tasks.dart';
import 'package:todo/provider/navigation_provider.dart';

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  static const List<Widget> _widgetOptions = <Widget>[
    TaskList(),
    RewordList(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(navigationProvider);
    final navigationNotifier = ref.read(navigationProvider.notifier);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(data.selectedIndex),
      ),
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
        currentIndex: data.selectedIndex,
        onTap: (index) {
          navigationNotifier.changeIndex(index);
        },
      ),
    );
  }
}
