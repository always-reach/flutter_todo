import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/constant/enum.dart';

class TaskTypeConverter implements JsonConverter<TaskType, int> {
  const TaskTypeConverter();

  @override
  TaskType fromJson(int json) {
    return TaskType.values[json];
  }

  @override
  int toJson(TaskType object) {
    return object.index;
  }
}

class BoolIntConverter implements JsonConverter<bool, int> {
  const BoolIntConverter();

  @override
  bool fromJson(int json) {
    return json == 1;
  }

  @override
  int toJson(bool object) {
    return object ? 1 : 0;
  }
}
