import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/page/reward_create.dart';
import 'package:todo/provider/reward_provider.dart';
import 'package:todo/widget/reward_item.dart';

class RewordList extends ConsumerWidget {
  const RewordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: ref.watch(rewardsProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(
                  child: Text("エラーが発生しました"),
                ),
            data: (rewards) {
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
