import 'package:todo/dao/reward_dao.dart';
import 'package:todo/entity/reward/reward.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/repository/reward_abs.dart';

class RewardRepository implements RewardRepositoryAbs {
  final rewardDao = RewardDao(DatabaseHelper.instance);
  RewardRepository();

  @override
  Future<List<Reward>> getAllRewards() {
    return rewardDao.getAllRewards();
  }

  @override
  Future<Reward> getRewardById(int id) {
    return rewardDao.getRewardById(id);
  }

  @override
  Future<void> insertReward(Reward reward) {
    return rewardDao.insertReward(reward);
  }

  @override
  Future<void> updateReward(Reward reward) {
    return rewardDao.updateReward(reward);
  }

  @override
  Future<void> deleteRewardById(int id) {
    return rewardDao.deleteRewardById(id);
  }
}
