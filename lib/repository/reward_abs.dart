import 'package:todo/entity/reward.dart';

abstract class RewardRepositoryAbs {
  Future<List<Reward>> getAllRewards();
  Future<Reward> getRewardById(int id);
  Future<void> insertReward(Reward reward);
  Future<void> updateReward(Reward reward);
  Future<void> deleteRewardById(int id);
}
