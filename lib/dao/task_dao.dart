import 'package:todo/constant/enum.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/helper/db_helper.dart';

class TaskDao {
  final DatabaseHelper _databaseHelper;

  TaskDao(this._databaseHelper);

  Future<List<Task>> getAllTasks() async {
    final db = await _databaseHelper.database;
    final maps = await db.query("tasks");
    return maps.map((map) => Task.fromMap(map)).toList();
  }

  Future<List<Task>> getTasksFilteredByTaskType(TaskType taskType) async {
    final db = await _databaseHelper.database;
    final maps = await db
        .query("tasks", where: "taskType = ?", whereArgs: [taskType.toInt()]);
    return maps.map((map) => Task.fromMap(map)).toList();
  }

  Future<Task> getTaskById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query("tasks", where: "id = ?", whereArgs: [id]);
    return Task.fromMap(maps.first);
  }

  Future<void> insertTask(Task task) async {
    final db = await _databaseHelper.database;
    db.insert("tasks", task.toMap());
  }

  Future<void> updateTask(Task task) async {
    final db = await _databaseHelper.database;
    db.update("tasks", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> deleteTaskById(int id) async {
    final db = await _databaseHelper.database;
    db.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}
