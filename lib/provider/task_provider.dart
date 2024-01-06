import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/repository/task_imp.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository();
});

final taskProvider = FutureProvider.autoDispose((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.getAllTasks();
});

final taskContollerProvider = Provider<TaskController>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return TaskController(ref: ref, taskRepository: taskRepository);
});
