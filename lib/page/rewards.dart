import 'package:flutter/material.dart';
import 'package:todo/page/reward_create.dart';
import 'package:todo/repository/reward_imp.dart';
import 'package:todo/widget/reward_item.dart';

class RewordList extends StatelessWidget {
  const RewordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: FutureBuilder(
            future: RewardRepository().getAllRewards(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("エラーが発生しました"));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("データがありません"));
              }
              var rewards = snapshot.data!;
              return ListView.builder(
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  return rewardItem(rewards[index], context);
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RewardCreatePage(key: UniqueKey())),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
