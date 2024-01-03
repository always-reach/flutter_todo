import 'package:todo/dao/task_dao.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/repository/task_abs.dart';

class TaskRepositry implements TaskRepositoryAbs {
  final taskDao = TaskDao(DatabaseHelper.instance);
  TaskRepositry();
  @override
  Future<List<Task>> getAllTasks() {
    return taskDao.getAllTasks();
  }

  @override
  Future<Task> getTaskById(int id) {
    return taskDao.getTaskById(id);
  }

  @override
  Future<void> insertTask(Task task) {
    return taskDao.insertTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return taskDao.updateTask(task);
  }

  @override
  Future<void> deleteTaskById(int id) {
    return taskDao.deleteTaskById(id);
  }
}
