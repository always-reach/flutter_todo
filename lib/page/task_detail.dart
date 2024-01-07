import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/form/task_form.dart';
import 'package:todo/provider/task_provider.dart';

class TaskDetailPage extends ConsumerWidget {
  final int id;
  TaskDetailPage({Key? key, required this.id}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(
      Task task, WidgetRef ref, BuildContext context) async {
    task.id = id;
    ref.read(taskContollerProvider).updateTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                ref.read(taskContollerProvider).accomplishedTask(id);
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(taskContollerProvider).deleteTaskById(id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ref.watch(taskProvider(id)).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(
                  child: Text("エラーが発生しました"),
                ),
            data: (task) {
              return TaskForm(
                  key: _formKey,
                  onSubmit: (task) => handleSubmit(task, ref, context),
                  initialValue: task.toMap());
            }));
  }
}
