import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controller/point_controller.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/repository/point_imp.dart';

final pointRepositoryProvider = Provider<PointRepository>((ref) {
  return PointRepository();
});

final pointControllerProvider = Provider<PointController>((ref) {
  final pointRepository = ref.watch(pointRepositoryProvider);
  return PointController(ref: ref, pointRepository: pointRepository);
});

final pointProvider = FutureProvider<Point>((ref) {
  final pointRepository = ref.watch(pointRepositoryProvider);
  return pointRepository.getPointById(1);
});
