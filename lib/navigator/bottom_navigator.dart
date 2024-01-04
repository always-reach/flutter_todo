import 'package:flutter/material.dart';
import 'package:todo/page/rewords.dart';
import 'package:todo/page/tasks.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TaskList(),
    RewordList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
