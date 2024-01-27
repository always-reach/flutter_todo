import 'package:flutter/material.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/routing/path.dart';

Widget taskItem(Task task, BuildContext context) {
  return ListTile(
    leading: task.isComplete
        ? const Icon(Icons.done, color: Colors.green)
        : const Icon(Icons.hourglass_empty),
    subtitle: Text(
      task.description ?? '',
    ),
    title: Text(task.title,
        style: TextStyle(
          color: task.isComplete ? Colors.grey : Colors.black,
        )),
    onTap: () {
      Router.of(context)
          .routerDelegate
          .setNewRoutePath(RoutePath.taskDetails(task.id));
    },
    dense: true,
    tileColor: task.isComplete ? Colors.grey[200] : Colors.white,
  );
}
