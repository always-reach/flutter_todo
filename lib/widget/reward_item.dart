import 'package:flutter/material.dart';
import 'package:todo/entity/reward/reward.dart';
import 'package:todo/routing/path.dart';

Widget rewardItem(Reward reward, BuildContext context) {
  return ListTile(
    title: Text(reward.title),
    subtitle: Text("受け取り回数:${reward.totalCount} ${reward.description ?? ''}"),
    dense: true,
    tileColor: Colors.white,
    onTap: () {
      Router.of(context)
          .routerDelegate
          .setNewRoutePath(RoutePath.rewardDetails(reward.id));
    },
  );
}
