import 'package:todo/entity/point.dart';

abstract class PointRepositoryAbs {
  Future<Point> getPointById(int id);
  Future<void> updatePoint(Point point);
}
