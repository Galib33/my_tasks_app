import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/texts/app_texts.dart';
import '../../constants/texts/app_titles.dart';
import '../../provider/task_hive_provider.dart';
import '../../screens/bottom_sheets.dart';
import '../../screens/snackbars.dart';
import '../global widgets/views_body.dart';
import '../tasks%20page/widgets/add_float_button.dart';
import '../tasks%20page/widgets/app_bar_widget.dart';
import '../tasks%20page/widgets/bottom_sheet_elements.dart';
import '../tasks%20page/widgets/search_field.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider service = context.read<TaskHiveProvider>();
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          SearchField(
              onChanged: (valueSearch) {
                service.searchNotifier.value = valueSearch;
              },
              controller: service.controllers["search"]!,
              hint: AppTitles.titleSearchTitle),
          Expanded(
            child: ViewsBody(
                valueListenable: service.taskBoxListenable,
                isTrash: false,
                emptyMessage: AppTexts.emptyText),
          ),
        ],
      ),
      floatingActionButton: AddFloatButton(
        
        icon: Icons.add_outlined,
        label: AppTitles.titleAddTask,
        onPressed: () {
          service.clearFields();
          BottomSheets.showTaskBottomSheet(context,
              view: BottomSheetElements(
                isEdit: false,
                onSaveTaskPressed: () {
                  service.addTask(context);
                  Snackbars.show(context,
                      color: AppColors.greenColor,
                      snackbarMessage: AppTexts.snackbarAdded);
                },
              ));
        },
      ),
    );
  }
}
