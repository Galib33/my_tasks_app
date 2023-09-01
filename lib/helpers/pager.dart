import 'package:flutter/material.dart';

import '../pages/tasks%20page/tasks_page.dart';
import '../pages/trash page/trash_page.dart';

class Pager {
  Pager._();

  static Widget get taskPage => const TasksPage();
  static Widget get trashPage => const TrashPage();
}
