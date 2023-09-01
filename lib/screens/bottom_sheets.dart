import 'package:flutter/material.dart';
import 'package:on_board_page_again/models/task_hive_model.dart';

import '../constants/borders/app_round_borders.dart';

class BottomSheets {
  BottomSheets._();

  static showTaskBottomSheet(BuildContext context,
      {TaskHiveModel? model, required Widget view}) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: AppRoundBorders.bottomSheetRVRadius13,
      context: context,
      builder: (context) {
        return view;
      },
    );
  }
}
