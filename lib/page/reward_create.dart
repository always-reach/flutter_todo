import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/reward/reward.dart';
import 'package:todo/form/reward_form.dart';
import 'package:todo/provider/reward_provider.dart';
import 'package:todo/routing/delegate.dart';

class RewardCreatePage extends ConsumerWidget {
  RewardCreatePage({Key? key}) : super(key: key);

  void handleSubmit(Reward reward, BuildContext context, WidgetRef ref) async {
    ref.read(rewardContollerProvider).addReward(reward);
    final delegate = Router.of(context).routerDelegate as AppRouterDelegate;
    delegate.backPage();
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
