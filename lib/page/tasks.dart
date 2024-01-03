import 'package:flutter/material.dart';
import 'package:todo/page/task_create.dart';
import 'package:todo/widget/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  //static const tasks = ["task1", "task2", "task3"];
  static const tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: tasks.length > 0
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return taskItem(tasks[index]);
                },
              )
            : const Center(
                child: Text("タスクを追加してください。"),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskCreateForm(key: UniqueKey())),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
