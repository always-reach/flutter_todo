import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/routing/delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;
  final databaseHelper = DatabaseHelper.instance;
  await databaseHelper.database;

  final providerContainer = ProviderContainer().read(taskContollerProvider);
  providerContainer.resetDailyTasksCompleteStatus();
  providerContainer.resetWeeklyTasksCompleteStatus();
  providerContainer.resetMonthylyTasksCompleteStatus();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'My Mission',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: AppRouterDelegate(ref),
    );
  }
}
