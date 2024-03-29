import 'package:todo/constant/enum.dart';
import 'package:todo/entity/task/task.dart';
import 'package:todo/helper/db_helper.dart';

class TaskDao {
  final DatabaseHelper _databaseHelper;

  TaskDao(this._databaseHelper);

  Future<List<Task>> getAllTasks() async {
    final db = await _databaseHelper.database;
    final maps = await db.query("tasks");
    return maps.map((map) => Task.fromJson(map)).toList();
  }

  Future<List<Task>> getTasksFilteredByTaskType(TaskType taskType) async {
    final db = await _databaseHelper.database;
    final maps = await db
        .query("tasks", where: "taskType = ?", whereArgs: [taskType.toInt()]);
    return maps.map((map) => Task.fromJson(map)).toList();
  }

  Future<List<Task>> getTasksCompletedByAtCompleteDateAndTaskType(
      DateTime completeDate, TaskType taskType) async {
    final db = await _databaseHelper.database;
    final maps = await db.query("tasks",
        where: "taskType = ? AND atComplete < ? AND atComplete IS NOT NULL",
        whereArgs: [taskType.toInt(), completeDate.toIso8601String()]);
    return maps.map((map) => Task.fromJson(map)).toList();
  }

  Future<Task> getTaskById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query("tasks", where: "id = ?", whereArgs: [id]);
    return Task.fromJson(maps.first);
  }

  Future<void> insertTask(Task task) async {
    final db = await _databaseHelper.database;
    db.insert("tasks", task.toJson());
  }

  Future<void> updateTask(Task task) async {
    final db = await _databaseHelper.database;
    db.update("tasks", task.toJson(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> deleteTaskById(int id) async {
    final db = await _databaseHelper.database;
    db.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}
