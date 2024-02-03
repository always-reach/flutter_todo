import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/widget/task_item.dart';

class TaskSection extends ConsumerWidget {
  final String title;
  final TaskType taskType;
  const TaskSection({Key? key, required this.title, required this.taskType})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(title: Text(title), children: <Widget>[
      ref.watch(tasksFilteredByTaskTypeProvider(taskType)).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            data: (tasks) {
              if (tasks.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.task_alt, size: 60), // アイコンの表示
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "タスクがありません。\n新しいタスクを追加しましょう。",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...tasks.map((task) => taskItem(task, context)).toList()
                ],
              );
            },
          )
    ]);
  }
}
