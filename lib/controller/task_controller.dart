import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
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
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  accomplishedTask(int id) async {
    Task task = await taskRepository.getTaskById(id);
    task.isComplete = true;
    task.atComplete = DateTime.now();
    taskRepository.updateTask(task);
    Point point = await pointRepository.getPointById(1);
    point.point = point.point + task.point;
    await pointRepository.updatePoint(point);
    ref.invalidate(tasksProvider);
    ref.invalidate(pointProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  resetDailyTasksCompleteStatus() async {
    DateTime now = DateTime.now();
    DateTime todayAtFiveAM = DateTime(now.year, now.month, now.day, 5, 0, 0);
    debugPrint("resetDailyTasksCompleteStatus");
    debugPrint(todayAtFiveAM.toString());
    List<Task> dailyTasks =
        await taskRepository.getTasksCompletedByAtCompleteDateAndTaskType(
            todayAtFiveAM, TaskType.daily);
    debugPrint(dailyTasks.toString());
    for (var task in dailyTasks) {
      task.isComplete = false;
      task.atComplete = null;
      taskRepository.updateTask(task);
    }
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  resetWeeklyTasksCompleteStatus() async {
    DateTime now = DateTime.now();
    DateTime todayAtFiveAM = DateTime(now.year, now.month, now.day, 5, 0, 0);
    int weekday = now.weekday;
    DateTime lastSunday = todayAtFiveAM.subtract(Duration(days: weekday));
    if (weekday == 7) {
      lastSunday = lastSunday.subtract(const Duration(days: 7));
    }
    List<Task> weeklyTasks =
        await taskRepository.getTasksCompletedByAtCompleteDateAndTaskType(
            lastSunday, TaskType.weekly);
    for (var task in weeklyTasks) {
      task.isComplete = false;
      task.atComplete = null;
      taskRepository.updateTask(task);
    }
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
      task.isComplete = false;
      task.atComplete = null;
      taskRepository.updateTask(task);
    }
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  updateTask(Task task) async {
    taskRepository.updateTask(task);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }

  deleteTaskById(int id) async {
    taskRepository.deleteTaskById(id);
    ref.invalidate(tasksProvider);
    ref.invalidate(tasksFilteredByTaskTypeProvider);
  }
}
