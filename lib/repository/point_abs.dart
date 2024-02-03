import 'package:todo/entity/point/point.dart';

abstract class PointRepositoryAbs {
  Future<Point> getPointById(int id);
  Future<void> updatePoint(Point point);
}
