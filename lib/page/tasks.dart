import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/page/task_create.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/widget/task_item.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: ref.watch(taskProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(
                  child: Text("エラーが発生しました"),
                ),
            data: (tasks) {
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return taskItem(tasks[index], context);
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
