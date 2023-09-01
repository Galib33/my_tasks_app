import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:on_board_page_again/constants/texts/app_texts.dart';
import 'package:on_board_page_again/constants/texts/app_titles.dart';
import 'package:provider/provider.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/app_paddings.dart';
import '../../provider/task_hive_provider.dart';

class AppSlidable extends StatelessWidget {
  final Function(BuildContext) onEdit;
  final Function(BuildContext) onDeleteAndUndo;
  final Widget child;
  final Key? slidableKey;
  final bool isTrash;

  const AppSlidable({
    super.key,
    required this.onEdit,
    required this.child,
    required this.onDeleteAndUndo,
    this.slidableKey,
    required this.isTrash,
  });

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider service = context.read<TaskHiveProvider>();

    return Padding(
        padding: AppPaddings.onlyLRT778 +
            (service.itemIndex == 0
                ? AppPaddings.onlyT5
                : EdgeInsets.zero),
        child: Slidable(
          // enabled: !isTrash,
          startActionPane: !isTrash
              ? ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(14),
                        onPressed: onEdit,
                        backgroundColor: AppColors.darkBlueColor,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: AppTexts.editString,
                      )
                    ])
              : null,
          key: slidableKey,
          endActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                // if (!isTrash)
                //   SlidableAction(
                //     borderRadius: BorderRadius.circular(14),
                //     onPressed: onEdit,
                //     backgroundColor: AppColors.darkBlueColor,
                //     foregroundColor: Colors.white,
                //     icon: Icons.edit,
                //     label: 'Edit',
                //   ),
                SlidableAction(
                  borderRadius: BorderRadius.circular(14),
                  onPressed: onDeleteAndUndo,
                  backgroundColor:
                      isTrash ? AppColors.greenColor : AppColors.redColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  label: isTrash ? AppTitles.titleUndo : AppTitles.titleDelete,
                ),
              ]),
          child: child,
        ));
  }
}
