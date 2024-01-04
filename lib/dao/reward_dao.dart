import 'package:todo/entity/reward.dart';
import 'package:todo/helper/db_helper.dart';

class RewardDao {
  final DatabaseHelper _databaseHelper;
  RewardDao(this._databaseHelper);

  Future<List<Reward>> getAllRewards() async {
    final db = await _databaseHelper.database;
    final maps = await db.query("rewards");
    return maps.map((map) => Reward.fromMap(map)).toList();
  }

  Future<Reward> getRewardById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query("rewards", where: "id = ?", whereArgs: [id]);
    return Reward.fromMap(maps.first);
  }

  Future<void> insertReward(Reward reward) async {
    final db = await _databaseHelper.database;
    db.insert("rewards", reward.toMap());
  }

  Future<void> updateReward(Reward reward) async {
    final db = await _databaseHelper.database;
    db.update("rewards", reward.toMap(),
        where: "id = ?", whereArgs: [reward.id]);
  }

  Future<void> deleteRewardById(int id) async {
    final db = await _databaseHelper.database;
    db.delete("rewards", where: "id = ?", whereArgs: [id]);
  }
}
