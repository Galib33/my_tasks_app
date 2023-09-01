import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/texts/app_texts.dart';
import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';
import '../../screens/bottom_sheets.dart';
import '../../screens/snackbars.dart';
import '../tasks%20page/widgets/bottom_sheet_elements.dart';
import 'app_slidable.dart';
import 'task_item.dart';

class ListViewItem extends StatelessWidget {
  final TaskHiveModel task;
  final bool isTrash;
  const ListViewItem(
      {super.key,
      required this.task,
      // required this.itemIndex,
      required this.isTrash});

  @override
  Widget build(BuildContext buildContext) {
    TaskHiveProvider hiveServices = buildContext.read<TaskHiveProvider>();
    return AppSlidable(
      slidableKey: Key(task.id),
      onEdit: (context) {
        BottomSheets.showTaskBottomSheet(context,
            model: task,
            view: BottomSheetElements(
              isEdit: true,
              currentModel: task,
              onSaveTaskPressed: () async {
                hiveServices.editTask(buildContext, task);
                Navigator.pop(buildContext);
                Snackbars.show(buildContext,
                    color: AppColors.darkBlueColor,
                    snackbarMessage: AppTexts.snackbarEdited);
              },
            ));
      },
      onDeleteAndUndo: (context) {
        if (isTrash) {
          hiveServices.undoTrashTask(buildContext, task);
          Snackbars.show(context,
              color: AppColors.yellowColor, snackbarMessage: AppTexts.snackbarUndo);
        } else {
          hiveServices.deleteTask(buildContext, task);
          Snackbars.show(context,
              color: AppColors.redColor, snackbarMessage: AppTexts.snackbarDeleted);
        }
      },
      isTrash: isTrash,
      child: TaskItem(task: task, isTrash: isTrash),
    );
  }
}
