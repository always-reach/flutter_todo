import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/form/reward_form.dart';
import 'package:todo/provider/reward_provider.dart';

class RewardCreatePage extends ConsumerWidget {
  RewardCreatePage({Key? key}) : super(key: key);

  Future<void> handleSubmit(
      Reward reward, BuildContext context, WidgetRef ref) async {
    await ref.read(rewardContollerProvider).addReward(reward);
    Navigator.pop(context);
  }

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: RewardForm(
            key: formKey,
            onSubmit: (task) => handleSubmit(task, context, ref)));
  }
}
