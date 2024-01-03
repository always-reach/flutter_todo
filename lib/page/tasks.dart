import 'package:flutter/material.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/page/task_create.dart';
import 'package:todo/repository/task_imp.dart';
import 'package:todo/widget/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: FutureBuilder<List<Task>>(
            future: TaskRepositry().getAllTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("エラーが発生しました"));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("データがありません"));
              }
              var tasks = snapshot.data!;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return taskItem(tasks[index].title);
                },
              );
            }),
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
