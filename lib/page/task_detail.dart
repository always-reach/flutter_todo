import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/form/task_form.dart';
import 'package:todo/repository/point_imp.dart';
import 'package:todo/repository/task_imp.dart';

class TaskDetailPage extends StatelessWidget {
  final int id;
  TaskDetailPage({Key? key, required this.id}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(Task task, BuildContext context) async {
    task.id = id;
    await TaskRepository().updateTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                var task = await TaskRepository().getTaskById(id);
                task.isComplete = true;
                await TaskRepository().updateTask(task);
                var point = await PointRepository().getPointById(1);
                point.point = point.point + task.point;
                await PointRepository().updatePoint(point);
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await TaskRepository().deleteTaskById(id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: FutureBuilder<Task>(
            future: TaskRepository().getTaskById(id),
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
