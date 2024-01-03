import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/form/task_form.dart';
import 'package:todo/repository/task_imp.dart';

class TaskDetailPage extends StatelessWidget {
  final int id;
  TaskDetailPage({Key? key, required this.id}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(Task task, BuildContext context) async {
    task.id = id;
    await TaskRepositry().updateTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: FutureBuilder<Task>(
            future: TaskRepositry().getTaskById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("エラーが発生しました"));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text("データがありません"));
              }
              var task = snapshot.data!;
              return TaskForm(
                  key: _formKey,
                  onSubmit: (task) => handleSubmit(task, context),
                  initialValue: task.toMap());
            }));
  }
}
