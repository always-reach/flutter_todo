enum TaskType {
  daily,
  weekly,
  monthly,
  ;

  int toInt() {
    switch (this) {
      case TaskType.daily:
        return 0;
      case TaskType.weekly:
        return 1;
      case TaskType.monthly:
        return 2;
    }
  }
}

enum PageType {
  bottomNavigator,
  tasks,
  taskCreate,
  taskDetail,
  rewards,
  rewardCreate,
  rewardDetail,
}
