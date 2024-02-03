import 'package:freezed_annotation/freezed_annotation.dart';

part "point.freezed.dart";
part "point.g.dart";

@freezed
class Point with _$Point {
  const factory Point({
    required int id,
    required int point,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
