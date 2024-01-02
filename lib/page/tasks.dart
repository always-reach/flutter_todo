import 'package:flutter/widgets.dart';
import 'package:todo/widget/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  //static const tasks = ["task1", "task2", "task3"];
  static const tasks = [];

  @override
  Widget build(BuildContext context) {
    return tasks.length > 0
        ? ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return taskItem(tasks[index]);
            },
          )
        : const Center(
            child: Text("タスクを追加してください。"),
          );
  }
}
