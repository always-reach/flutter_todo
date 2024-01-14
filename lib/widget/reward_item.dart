import 'package:flutter/material.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/page/reward_detail.dart';

Widget rewardItem(Reward reward, BuildContext context) {
  return ListTile(
    title: Text(reward.title),
    subtitle: Text(reward.description ?? ''),
    dense: true,
    tileColor: Colors.white,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RewardDetailPage(key: UniqueKey(), id: reward.id!)),
      );
    },
  );
}
