import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/colors/app_colors.dart';
import '../../../constants/texts/app_titles.dart';
import '../../../helpers/pager.dart';
import '../../../models/task_hive_model.dart';
import '../../../provider/task_hive_provider.dart';
import '../../../theme/box_decorations.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider hiveServices = context.read<TaskHiveProvider>();

    return AppBar(
      title: Text(
        AppTitles.titleYourTasks,
        style: AppTextStyle.bold25Black,
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Stack(children: [
            IconButton(
                highlightColor: AppColors.transparentColor,
                splashColor: AppColors.transparentColor,
                color: AppColors.darkBlueColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pager.trashPage,
                      ));
                },
                icon: Icon(Icons.delete, size: 35.r)),
            Positioned(
              top: 7.h,
              right: 5.w,
              child: ValueListenableBuilder(
                  valueListenable: hiveServices.trashBoxListenable,
                  builder: (context, Box<TaskHiveModel> trashBox, _) {
                    int count = hiveServices.countIsNotSeen(trashBox);
                    return count != 0
                        ? Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecorations.circleRed,
                            alignment: Alignment.center,
                            child: Text(
                              count > 9 ? "9+" : "$count",
                              style: AppTextStyle.bold14,
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
            )
          ]),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
