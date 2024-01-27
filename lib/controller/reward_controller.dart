import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/provider/point_provider.dart';
import 'package:todo/provider/reward_provider.dart';
import 'package:todo/repository/point_imp.dart';
import 'package:todo/repository/reward_imp.dart';

class RewardController {
  final ProviderRef ref;
  final RewardRepository rewardRepository;
  final PointRepository pointRepository;
  RewardController(
      {required this.ref,
      required this.rewardRepository,
      required this.pointRepository});

  Future<void> addReward(Reward reward) async {
    await rewardRepository.insertReward(reward);
    ref.invalidate(rewardProvider);
    ref.invalidate(rewardsProvider);
  }

  Future<void> receiveReward(int id) async {
    Reward reward = await rewardRepository.getRewardById(id);
    Point point = await pointRepository.getPointById(1);
    if (point.point < reward.point) {
      return;
    }
    point.point = point.point - reward.point;
    await pointRepository.updatePoint(point);
    ref.invalidate(rewardProvider);
    ref.invalidate(pointProvider);
  }

  Future<void> updateReward(Reward reward) async {
    await rewardRepository.updateReward(reward);
    ref.invalidate(rewardProvider);
    ref.invalidate(rewardsProvider);
  }

  Future<void> deleteReward(int id) async {
    await rewardRepository.deleteRewardById(id);
    ref.invalidate(rewardProvider);
    ref.invalidate(rewardsProvider);
  }
}
