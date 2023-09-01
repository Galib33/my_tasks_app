import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/app_keys.dart';
import '../../constants/app_text_style.dart';
import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';
import '../../theme/box_decorations.dart';
import 'task_row.dart';

class TaskItem extends StatefulWidget {
  final TaskHiveModel task;
  final bool isTrash;
  const TaskItem({super.key, required this.task, required this.isTrash});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late Box<bool> introduceBox;
  late TaskHiveProvider service;
  @override
  void initState() {
    service = context.read<TaskHiveProvider>();

    intro();

    super.initState();
  }

  intro() async {
    introduceBox = Hive.isBoxOpen(AppKeys.introduce)
        ? Hive.box<bool>(AppKeys.introduce)
        : await Hive.openBox<bool>(AppKeys.introduce);
    bool? isTaskShowed = introduceBox.get(AppKeys.isTaskShowed);
    bool? isTrashShowed = introduceBox.get(AppKeys.isTrashShowed);
    if (isTaskShowed != true || widget.isTrash) {
      if (isTrashShowed != true) {
        // ignore: use_build_context_synchronously
        SlidableController? slidableController = Slidable.of(context);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await slidableController?.openEndActionPane();
          Future.delayed(const Duration(milliseconds: 500))
              .whenComplete(() async {
            await slidableController?.close();
            if (!widget.isTrash) {
              await slidableController?.openStartActionPane();
              Future.delayed(const Duration(milliseconds: 500))
                  .whenComplete(() {
                slidableController?.close().then((value) {
                  introduceBox.put(AppKeys.isTaskShowed, true);
                });
              });
            } else {
              introduceBox.put(AppKeys.isTrashShowed, true);
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        service.updateChecked(!widget.task.isChecked,
            oldModel: widget.task, isTrash: widget.isTrash);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecorations.circular14withShadow,
        child: Column(
          children: [
            Text(widget.task.title, style: AppTextStyle.bold25),
            2.verticalSpace,
            Text(
              widget.task.subtitle,
              style: AppTextStyle.grey600Style17,
              textAlign: TextAlign.center,
            ),
            TaskRow(
              isTrash: widget.isTrash,
              taskModel: widget.task,
            )
          ],
        ),
      ),
    );
  }
}
