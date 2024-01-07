import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/provider/reward_provider.dart';
import 'package:todo/repository/reward_imp.dart';

class RewardController {
  final ProviderRef ref;
  final RewardRepository rewardRepository;
  RewardController({required this.ref, required this.rewardRepository});

  Future<void> addReward(Reward reward) async {
    await rewardRepository.insertReward(reward);
    ref.invalidate(rewardsProvider);
  }

  Future<void> updateReward(Reward reward) async {
    await rewardRepository.updateReward(reward);
    ref.invalidate(rewardsProvider);
  }

  Future<void> deleteReward(int id) async {
    await rewardRepository.deleteRewardById(id);
    ref.invalidate(rewardsProvider);
  }
}
