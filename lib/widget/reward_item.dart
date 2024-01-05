import 'package:flutter/material.dart';
import 'package:todo/entity/reward.dart';
import 'package:todo/page/task_detail.dart';

Widget rewardItem(Reward reward, BuildContext context) {
  return ListTile(
    title: Text(reward.title),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TaskDetailPage(key: UniqueKey(), id: reward.id!)),
      );
    },
  );
}
