// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String?,
      isComplete: json['isComplete'] == null
          ? false
          : const BoolIntConverter().fromJson(json['isComplete'] as int),
      point: json['point'] as int,
      taskType: const TaskTypeConverter().fromJson(json['taskType'] as int),
      atComplete: json['atComplete'] == null
          ? null
          : DateTime.parse(json['atComplete'] as String),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isComplete': const BoolIntConverter().toJson(instance.isComplete),
      'point': instance.point,
      'taskType': const TaskTypeConverter().toJson(instance.taskType),
      'atComplete': instance.atComplete?.toIso8601String(),
    };
