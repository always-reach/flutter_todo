import 'package:flutter/material.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/page/task_detail.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TaskDetailPage(key: UniqueKey(), id: task.id!)),
      );
    },
    dense: true,
    tileColor: task.isComplete ? Colors.grey[200] : Colors.white,
  );
}
