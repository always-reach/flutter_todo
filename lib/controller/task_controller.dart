import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/provider/point_provider.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/repository/point_imp.dart';
import 'package:todo/repository/task_imp.dart';

class TaskController {
  final ProviderRef ref;
  final TaskRepository taskRepository;
  final PointRepository pointRepository;

  TaskController(
      {required this.ref,
      required this.taskRepository,
      required this.pointRepository});

  addTask(Task task) async {
    task.isComplete = false;
    taskRepository.insertTask(task);
    ref.invalidate(tasksProvider);
  }

  accomplishedTask(int id) async {
    Task task = await taskRepository.getTaskById(id);
    task.isComplete = true;
    taskRepository.updateTask(task);
    Point point = await pointRepository.getPointById(1);
    point.point = point.point + task.point;
    await pointRepository.updatePoint(point);
    ref.invalidate(tasksProvider);
    ref.invalidate(pointProvider);
  }

  resetTasksAccomplished() async {
    List<Task> tasks = await taskRepository.getTasksCompletedYesterday();
    for (var task in tasks) {
      task.isComplete = false;
      taskRepository.updateTask(task);
    }
    ref.invalidate(tasksProvider);
  }

  updateTask(Task task) async {
    taskRepository.updateTask(task);
    ref.invalidate(tasksProvider);
  }

  deleteTaskById(int id) async {
    taskRepository.deleteTaskById(id);
    ref.invalidate(tasksProvider);
  }
}
