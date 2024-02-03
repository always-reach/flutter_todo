import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/entity/task/task.dart';
import 'package:todo/provider/point_provider.dart';
import 'package:todo/repository/task_imp.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository();
});

final taskProvider = FutureProvider.family<Task, int>((ref, id) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.getTaskById(id);
});

final tasksFilteredByTaskTypeProvider =
    FutureProvider.family<List<Task>, TaskType>((ref, taskType) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.getTasksFilteredByTaskType(taskType);
});

final tasksProvider = FutureProvider<List<Task>>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.getAllTasks();
});

final taskContollerProvider = Provider<TaskController>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  final pointRepository = ref.watch(pointRepositoryProvider);
  return TaskController(
      ref: ref,
      taskRepository: taskRepository,
      pointRepository: pointRepository);
});
