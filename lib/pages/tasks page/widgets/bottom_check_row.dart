import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/colors/app_colors.dart';
import '../../../constants/texts/app_texts.dart';
import '../../../models/task_hive_model.dart';
import '../../../provider/task_hive_provider.dart';

class BottomCheckRow extends StatefulWidget {
  final bool isEdit;
  final TaskHiveModel? model;
  const BottomCheckRow({super.key, required this.isEdit, required this.model});

  @override
  State<BottomCheckRow> createState() => _BottomCheckRowState();
}

class _BottomCheckRowState extends State<BottomCheckRow> {
  late TaskHiveProvider taskHiveServices;
  @override
  void initState() {
    taskHiveServices = context.read<TaskHiveProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppTexts.bottomCheckMessage,
          style: AppTextStyle.bold16Green
              .copyWith(color: AppColors.blackColor),
        ),
        Checkbox(
          value: widget.isEdit
              ? widget.model!.isChecked
              : taskHiveServices.bottomCheck,
          onChanged: (value) {
            widget.isEdit
                ? widget.model?.isChecked = value!
                : taskHiveServices.bottomCheck = value!;
                

            // context.read<TaskProvider>().fieldCheck = value;
            setState(() {});
          },
        )
      ],
    );
  }
}
