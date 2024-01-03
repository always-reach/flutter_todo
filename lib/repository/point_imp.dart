import 'package:todo/dao/point_dao.dart';
import 'package:todo/entity/point.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/repository/point_abs.dart';

class PointRepository implements PointRepositoryAbs {
  final pointDao = PointDao(DatabaseHelper.instance);
  PointRepository();

  @override
  Future<Point> getPointById(int id) async {
    return pointDao.getPointById(id);
  }

  @override
  Future<void> updatePoint(Point point) async {
    pointDao.updatePoint(point);
  }
}
