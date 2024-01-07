import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controller/reward_controller.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/repository/reward_imp.dart';

final rewardRepositoryProvider = Provider<RewardRepository>((ref) {
  return RewardRepository();
});

final rewardProvider = FutureProvider.family<Reward, int>((ref, id) {
  final rewardRepository = ref.watch(rewardRepositoryProvider);
  return rewardRepository.getRewardById(id);
});

final rewardsProvider = FutureProvider<List<Reward>>((ref) {
  final rewardRepository = ref.watch(rewardRepositoryProvider);
  return rewardRepository.getAllRewards();
});

final rewardContollerProvider = Provider<RewardController>((ref) {
  final rewardRepository = ref.watch(rewardRepositoryProvider);
  return RewardController(ref: ref, rewardRepository: rewardRepository);
});
