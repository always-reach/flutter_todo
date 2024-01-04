import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/form/reward_form.dart';
import 'package:todo/repository/reward_imp.dart';

class RewardCreatePage extends StatelessWidget {
  const RewardCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    Future<void> handleSubmit(Reward reward) async {
      await RewardRepository().insertReward(reward);
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: RewardForm(key: formKey, onSubmit: handleSubmit));
  }
}
