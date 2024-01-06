import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/form/reward_form.dart';
import 'package:todo/repository/point_imp.dart';
import 'package:todo/repository/reward_imp.dart';

class RewardDetailPage extends StatelessWidget {
  final int id;
  RewardDetailPage({Key? key, required this.id}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> handleSubmit(Reward reward, BuildContext context) async {
    reward.id = id;
    await RewardRepository().updateReward(reward);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                var reward = await RewardRepository().getRewardById(id);
                var point = await PointRepository().getPointById(1);
                if (point.point >= reward.point) {
                  point.point = point.point - reward.point;
                  await PointRepository().updatePoint(point);
                  Navigator.pop(context);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await RewardRepository().deleteRewardById(id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: FutureBuilder<Reward>(
            future: RewardRepository().getRewardById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("エラーが発生しました"));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text("データがありません"));
              }
              var reward = snapshot.data!;
              return RewardForm(
                  key: _formKey,
                  onSubmit: (reward) => handleSubmit(reward, context),
                  initialValue: reward.toMap());
            }));
  }
}
