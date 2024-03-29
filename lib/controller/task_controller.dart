import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/entity/point/point.dart';
import 'package:todo/entity/task/task.dart';
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
    final Task updatedTask = task.copyWith(isComplete: false);
    taskRepository.insertTask(updatedTask);
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  accomplishedTask(int id) async {
    Task task = await taskRepository.getTaskById(id);
    final updatedTask = task.copyWith(
        isComplete: true,
        atComplete: DateTime.now(),
        completeCount: task.completeCount + 1);
    taskRepository.updateTask(updatedTask);
    Point point = await pointRepository.getPointById(1);
    final Point updatedPoint = point.copyWith(point: point.point + task.point);
    await pointRepository.updatePoint(updatedPoint);
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(pointProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  resetDailyTasksCompleteStatus() async {
    DateTime now = DateTime.now();
    DateTime todayAtFiveAM = DateTime(now.year, now.month, now.day, 5, 0, 0);
    List<Task> dailyTasks =
        await taskRepository.getTasksCompletedByAtCompleteDateAndTaskType(
            todayAtFiveAM, TaskType.daily);
    for (var task in dailyTasks) {
      final Task updatedTask =
          task.copyWith(isComplete: false, atComplete: null);
      taskRepository.updateTask(updatedTask);
    }
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  resetWeeklyTasksCompleteStatus() async {
    // その週の月曜日朝5時以前のデータをリセット
    DateTime now = DateTime.now();
    DateTime monday = now.subtract(Duration(days: now.weekday - 1));
    DateTime mondayAtFiveAM =
        DateTime(monday.year, monday.month, monday.day, 5, 0, 0);
    List<Task> weeklyTasks =
        await taskRepository.getTasksCompletedByAtCompleteDateAndTaskType(
            mondayAtFiveAM, TaskType.weekly);
    for (var task in weeklyTasks) {
      final Task updatedTask =
          task.copyWith(isComplete: false, atComplete: null);

      taskRepository.updateTask(updatedTask);
    }

    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  resetMonthylyTasksCompleteStatus() async {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1, 5, 0, 0);
    List<Task> monthlyTasks =
        await taskRepository.getTasksCompletedByAtCompleteDateAndTaskType(
            firstDayOfMonth, TaskType.monthly);
    for (var task in monthlyTasks) {
      final Task updatedTask =
          task.copyWith(isComplete: false, atComplete: null);
      taskRepository.updateTask(updatedTask);
    }
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  updateTask(Task task) async {
    taskRepository.updateTask(task);
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  deleteTaskById(int id) async {
    taskRepository.deleteTaskById(id);
    ref.invalidate(taskProvider);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }
}
