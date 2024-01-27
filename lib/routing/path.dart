import 'package:todo/constant/enum.dart';

class RoutePath {
  final PageType pageType;
  final int? id;

  RoutePath.bottomNavigate()
      : pageType = PageType.tasks,
        id = null;
  RoutePath.tasks()
      : pageType = PageType.tasks,
        id = null;
  RoutePath.taskCreate()
      : pageType = PageType.taskCreate,
        id = null;
  RoutePath.taskDetails(this.id) : pageType = PageType.taskDetail;
  RoutePath.rewards()
      : pageType = PageType.rewards,
        id = null;
  RoutePath.rewardCreate()
      : pageType = PageType.rewardCreate,
        id = null;
  RoutePath.rewardDetails(this.id) : pageType = PageType.rewardDetail;
}
