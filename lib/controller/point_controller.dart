import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/provider/point_provider.dart';
import 'package:todo/repository/point_imp.dart';

class PointController {
  final ProviderRef ref;
  final PointRepository pointRepository;
  PointController({required this.ref, required this.pointRepository});

  Future<void> addPoint(int point) async {
    Point pointClass = await pointRepository.getPointById(1);
    pointClass.point += point;
    await pointRepository.updatePoint(pointClass);
    ref.invalidate(pointProvider);
  }

  Future<void> usePoint(int point) async {
    Point pointClass = await pointRepository.getPointById(1);
    if (pointClass.point >= point) {
      pointClass.point -= point;
      await pointRepository.updatePoint(pointClass);
      ref.invalidate(pointProvider);
    }
  }
}
