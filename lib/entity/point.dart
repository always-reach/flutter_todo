class Point {
  int id;
  int point;

  Point({
    required this.id,
    required this.point,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'point': point,
    };
  }

  factory Point.fromMap(Map<String, dynamic> map) {
    return Point(
      id: map['id'] as int,
      point: map['point'] as int,
    );
  }
}
