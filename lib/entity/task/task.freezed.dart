// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @BoolIntConverter()
  bool get isComplete => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  @TaskTypeConverter()
  TaskType get taskType => throw _privateConstructorUsedError;
  DateTime? get atComplete => throw _privateConstructorUsedError;
  int get completeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String? description,
      @BoolIntConverter() bool isComplete,
      int point,
      @TaskTypeConverter() TaskType taskType,
      DateTime? atComplete,
      int completeCount});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? isComplete = null,
    Object? point = null,
    Object? taskType = null,
    Object? atComplete = freezed,
    Object? completeCount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType,
      atComplete: freezed == atComplete
          ? _value.atComplete
          : atComplete // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completeCount: null == completeCount
          ? _value.completeCount
          : completeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String? description,
      @BoolIntConverter() bool isComplete,
      int point,
      @TaskTypeConverter() TaskType taskType,
      DateTime? atComplete,
      int completeCount});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? isComplete = null,
    Object? point = null,
    Object? taskType = null,
    Object? atComplete = freezed,
    Object? completeCount = null,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType,
      atComplete: freezed == atComplete
          ? _value.atComplete
          : atComplete // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completeCount: null == completeCount
          ? _value.completeCount
          : completeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {this.id,
      required this.title,
      this.description,
      @BoolIntConverter() this.isComplete = false,
      required this.point,
      @TaskTypeConverter() required this.taskType,
      this.atComplete,
      required this.completeCount});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  @BoolIntConverter()
  final bool isComplete;
  @override
  final int point;
  @override
  @TaskTypeConverter()
  final TaskType taskType;
  @override
  final DateTime? atComplete;
  @override
  final int completeCount;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, isComplete: $isComplete, point: $point, taskType: $taskType, atComplete: $atComplete, completeCount: $completeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.atComplete, atComplete) ||
                other.atComplete == atComplete) &&
            (identical(other.completeCount, completeCount) ||
                other.completeCount == completeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      isComplete, point, taskType, atComplete, completeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {final int? id,
      required final String title,
      final String? description,
      @BoolIntConverter() final bool isComplete,
      required final int point,
      @TaskTypeConverter() required final TaskType taskType,
      final DateTime? atComplete,
      required final int completeCount}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  @BoolIntConverter()
  bool get isComplete;
  @override
  int get point;
  @override
  @TaskTypeConverter()
  TaskType get taskType;
  @override
  DateTime? get atComplete;
  @override
  int get completeCount;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
