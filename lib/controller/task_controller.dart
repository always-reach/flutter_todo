import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/repository/task_imp.dart';

class TaskController {
  final ProviderRef ref;
  final TaskRepository taskRepository;

  TaskController({required this.ref, required this.taskRepository});

  addTask(Task task) async {
    taskRepository.insertTask(task);
    ref.invalidate(taskProvider);
  }

  updateTask(Task task) async {
    taskRepository.updateTask(task);
    ref.invalidate(taskProvider);
  }

  deleteTaskById(int id) async {
    taskRepository.deleteTaskById(id);
    ref.invalidate(taskProvider);
  }
}
