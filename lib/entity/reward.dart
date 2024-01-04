class Reward {
  final int? id;
  final String title;
  final String? description;
  final int point;

  Reward({
    this.id,
    required this.title,
    this.description,
    required this.point,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'point': point,
    };
  }

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      point: map['point'] as int,
    );
  }
}
