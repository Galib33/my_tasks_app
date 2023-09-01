import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/texts/app_texts.dart';
import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';
import '../../screens/snackbars.dart';
import '../global%20widgets/views_body.dart';
import '../tasks%20page/widgets/add_float_button.dart';
import 'widgets/trash_app_bar.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({super.key});

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  late TaskHiveProvider service;

  @override
  void initState() {
    service = context.read<TaskHiveProvider>();
    service.setSeenTrue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrashAppBar(),
      body: ViewsBody(
          valueListenable: service.trashBoxListenable,
          isTrash: true,
          emptyMessage: AppTexts.removedEmptyText),


          
      floatingActionButton: ValueListenableBuilder(
          valueListenable: service.trashBoxListenable,
          builder: (context, Box<TaskHiveModel> trashBox, _) {
            return trashBox.isNotEmpty
                ? AddFloatButton(
                    onPressed: () {
                      service.deleteAllTrahes();
                      Snackbars.show(context,
                          color: AppColors.redColor,
                          snackbarMessage: AppTexts.snackbarAllDeleted);
                    },
                    label: AppTexts.deleteAll,
                    icon: Icons.delete_outline_outlined)
                : const SizedBox.shrink();
          }),
    );
  }
}
