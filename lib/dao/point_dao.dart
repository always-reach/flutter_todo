import 'package:todo/entity/point.dart';
import 'package:todo/helper/db_helper.dart';

class PointDao {
  final DatabaseHelper _databaseHelper;
  PointDao(this._databaseHelper);

  Future<Point> getPointById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query("points", where: "id = ?", whereArgs: [id]);
    return Point.fromMap(maps.first);
  }

  Future<void> updatePoint(Point point) async {
    final db = await _databaseHelper.database;
    db.update("points", point.toMap(), where: "id = ?", whereArgs: [point.id]);
  }
}
