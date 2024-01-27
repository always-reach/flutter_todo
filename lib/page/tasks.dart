import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/routing/path.dart';
import 'package:todo/widget/task_section.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: const SingleChildScrollView(
          child: Column(children: <Widget>[
            TaskSection(title: "Dailyミッション", taskType: TaskType.daily),
            TaskSection(title: "Weeklyミッション", taskType: TaskType.weekly),
            TaskSection(title: "Monthlyミッション", taskType: TaskType.monthly),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Router.of(context)
                .routerDelegate
                .setNewRoutePath(RoutePath.taskCreate());
          },
          child: const Icon(Icons.add),
        ));
  }
}
