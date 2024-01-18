import 'package:todo/constant/enum.dart';
import 'package:todo/entity/task.dart';

abstract class TaskRepositoryAbs {
  Future<List<Task>> getAllTasks();
  Future<List<Task>> getTasksFilteredByTaskType(TaskType taskType);
  Future<List<Task>> getTasksCompletedYesterday();
  Future<Task> getTaskById(int id);
  Future<void> insertTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTaskById(int id);
}
