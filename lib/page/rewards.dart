import 'package:flutter/material.dart';

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
    );
  }
}
