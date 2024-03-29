import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/task/task.dart';
import 'package:todo/form/task_form.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/routing/delegate.dart';

class TaskCreateForm extends ConsumerWidget {
  TaskCreateForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  void handleSubmit(BuildContext context, WidgetRef ref, Task task) async {
    ref.read(taskContollerProvider).addTask(task);
    final delegate = Router.of(context).routerDelegate as AppRouterDelegate;
    delegate.backPage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My Mission"),
      ),
      body: TaskForm(
          key: _formKey, onSubmit: (task) => handleSubmit(context, ref, task)),
    );
  }
}
