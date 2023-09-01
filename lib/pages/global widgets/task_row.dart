import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_paddings.dart';
import '../../constants/app_text_style.dart';
import '../../extensions/date_formatting.dart';
import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';
import 'task_check_box.dart';

class TaskRow extends StatelessWidget {
  // final int index;
  final TaskHiveModel taskModel;
  final bool isTrash;
  const TaskRow({super.key, required this.isTrash, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    TaskHiveModel task = isTrash
        ? context.read<TaskHiveProvider>().trashBox.get(taskModel.id)!
        : context.read<TaskHiveProvider>().taskBox.get(taskModel.id)!;
    return Padding(
      padding: AppPaddings.onlyL8,
      child: Row(
        children: [
          Text(
            "${task.dateTime.formattedMD}\n${task.dateTime.formattedHMin}",
            style: AppTextStyle.bold16Green,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TaskCheckBox(
            isTrash: isTrash,
            currentTask: taskModel,
          )
        ],
      ),
    );
  }
}
