
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_paddings.dart';
import '../../../constants/texts/app_texts.dart';
import '../../../constants/texts/app_titles.dart';
import '../../../models/task_hive_model.dart';
import '../../../provider/task_hive_provider.dart';
import '../../../theme/input_decorations.dart';
import '../../global widgets/save_button.dart';
import 'bottom_check_row.dart';
import 'bottom_text_fields.dart';

class BottomSheetElements extends StatelessWidget {
  final Function() onSaveTaskPressed;
  final bool isEdit;
  final TaskHiveModel? currentModel;
  const BottomSheetElements(
      {super.key,
      required this.isEdit,
      this.currentModel,
      required this.onSaveTaskPressed});

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider hiveService = context.read<TaskHiveProvider>();
    controllerSetText(isEdit, context);
    return SingleChildScrollView(
      padding: AppPaddings.all8  + EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: hiveService.globalFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomTextFields(
              decoration:
                  InputDecorations.generalInputDecor(AppTexts.enterTitle),
              validator: (p) {
                return hiveService.validateCheck(p);
              },
              maxLength: 10,
              controller: hiveService.controllers["title"]!,
            ),
            15.verticalSpace,
            BottomTextFields(
              decoration:
                  InputDecorations.generalInputDecor(AppTexts.enterSubtitle),
              validator: (v) {
                return hiveService.validateCheck(v);
              },
              maxLines: 5,
              controller: hiveService.controllers["subtitle"]!,
            ),
            15.verticalSpace,
            BottomCheckRow(isEdit: isEdit, model: currentModel),
            15.verticalSpace,
            SaveButton(
              onSavePressed: onSaveTaskPressed,
              title:
                  isEdit ? AppTitles.stringEditTask : AppTitles.stringSaveTask,
            ),
          ],
        ),
      ),
    );
  }

  void controllerSetText(bool isEdit, BuildContext context) {
    TaskHiveProvider service = context.read<TaskHiveProvider>();
    if (isEdit) {
      service.controllers["title"]!.text = currentModel!.title;
      service.controllers["subtitle"]!.text = currentModel!.subtitle;
    }
  }
}
