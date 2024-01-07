import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/form/reward_form.dart';
import 'package:todo/provider/point_provider.dart';
import 'package:todo/provider/reward_provider.dart';

class RewardDetailPage extends ConsumerWidget {
  final int id;
  RewardDetailPage({Key? key, required this.id}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(
      Reward reward, WidgetRef ref, BuildContext context) async {
    reward.id = id;
    ref.read(rewardContollerProvider).updateReward(reward);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reward = ref.watch(rewardProvider(id));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                ref
                    .read(pointControllerProvider)
                    .usePoint(reward.value?.point ?? 0);
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(rewardContollerProvider).deleteReward(id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: reward.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(
                  child: Text("エラーが発生しました"),
                ),
            data: (reward) {
              return RewardForm(
                  key: _formKey,
                  onSubmit: (reward) => handleSubmit(reward, ref, context),
                  initialValue: reward.toMap());
            }));
  }
}
