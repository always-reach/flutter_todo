import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward.freezed.dart';
part 'reward.g.dart';

@freezed
class Reward with _$Reward {
  const factory Reward({
    int? id,
    required String title,
    String? description,
    required int point,
    @Default(0) int totalCount,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}
