import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/form/task_form.dart';
import 'package:todo/repository/task_imp.dart';

class TaskCreateForm extends StatefulWidget {
  const TaskCreateForm({required Key key}) : super(key: key);

  @override
  _TaskCreateFormState createState() => _TaskCreateFormState();
}

class _TaskCreateFormState extends State<TaskCreateForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(Task task) async {
    await TaskRepositry().insertTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: TaskForm(key: _formKey, onSubmit: handleSubmit));
  }
}
