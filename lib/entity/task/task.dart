import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/constant/enum.dart';
import 'package:todo/entity/task/converter.dart';

part "task.freezed.dart";
part "task.g.dart";

@freezed
class Task with _$Task {
  const factory Task({
    int? id,
    required String title,
    String? description,
    @BoolIntConverter() @Default(false) bool isComplete,
    required int point,
    @TaskTypeConverter() required TaskType taskType,
    DateTime? atComplete,
    required int completeCount,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
