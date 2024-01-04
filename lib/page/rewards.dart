import 'package:flutter/material.dart';
import 'package:todo/page/reward_create.dart';

class RewordList extends StatelessWidget {
  const RewordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: const Center(
          child: Text("Reword"),
        ),
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
