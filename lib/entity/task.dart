class Task {
  int? id;
  String title;
  String? description;
  bool isComplete;
  int point;
  int taskType;
  DateTime? atComplete;

  Task({
    this.id,
    required this.title,
    this.description,
    required this.isComplete,
    required this.point,
    required this.taskType,
    this.atComplete,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isComplete': isComplete ? 1 : 0,
      'point': point,
      'taskType': taskType,
      'atComplete': atComplete?.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      isComplete: map['isComplete'] == 1,
      point: map['point'] as int,
      taskType: map['taskType'] as int,
      atComplete: map['atComplete'] == null
          ? null
          : DateTime.parse(map['atComplete'] as String),
    );
  }
}
