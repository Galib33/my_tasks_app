import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';

class TaskCheckBox extends StatelessWidget {
  final TaskHiveModel currentTask;
  final bool isTrash;
  const TaskCheckBox(
      {super.key, required this.isTrash, required this.currentTask});

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider service = context.read<TaskHiveProvider>();

    return Checkbox(
      value: service.getTaskChecked(currentTask.id, isTrash),
      onChanged: (value) {
        service.updateChecked(value!, oldModel: currentTask, isTrash: isTrash);
      },
    );
  }
}
