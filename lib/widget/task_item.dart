import 'package:flutter/material.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/page/task_detail.dart';

Widget taskItem(Task task, BuildContext context) {
  return ListTile(
    title: Text(task.title),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TaskDetailPage(key: UniqueKey(), id: task.id!)),
      );
    },
  );
}
