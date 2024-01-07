import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/repository/point_imp.dart';

final pointRepositoryProvider = Provider<PointRepository>((ref) {
  return PointRepository();
});

final pointProvider = FutureProvider<Point>((ref) {
  final pointRepository = ref.watch(pointRepositoryProvider);
  return pointRepository.getPointById(1);
});
