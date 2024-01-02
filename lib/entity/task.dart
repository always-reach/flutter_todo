class Task {
  int id;
  String title;
  String? description;
  bool isComplete;
  int point;
  int taskType;
  DateTime? atComplete;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.isComplete,
    required this.point,
    required this.taskType,
    this.atComplete,
  });


}