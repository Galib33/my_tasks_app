import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/texts/app_texts.dart';
import '../../models/task_hive_model.dart';
import '../../provider/task_hive_provider.dart';
import 'empty_text.dart';
import 'list_view_item.dart';

class ViewsBody extends StatelessWidget {
  final ValueListenable<Box<TaskHiveModel>> valueListenable;
  final bool isTrash;
  final String emptyMessage;

  const ViewsBody(
      {super.key,
      required this.valueListenable,
      required this.isTrash,
      required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    TaskHiveProvider service = context.read<TaskHiveProvider>();
    return ValueListenableBuilder(
        // valueListenable: single.get<TaskHiveServices>().taskBoxListenable,
        valueListenable: valueListenable,
        builder: (context, Box<TaskHiveModel> box, _) {
          return box.isEmpty
              ? EmptyText(message: emptyMessage)
              : ValueListenableBuilder(
                  valueListenable: service.searchNotifier,
                  builder: (context, String valueSearch, _) {
                    // List<TaskHiveModel> mainList = isTrash
                    //     ? box.values.toList()
                    //     : box.values
                    //         .toList()
                    //         .where((element) =>
                    //             element.title.contains(valueSearch))
                    //         .toList();
                    List<TaskHiveModel> mainList = service.getMainList(
                        isTrash: isTrash, value: valueSearch, box: box);

                    mainList.sort(
                      (a, b) => b.dateTime.compareTo(a.dateTime),
                    );
                    return mainList.isEmpty
                        ? const EmptyText(message: AppTexts.notFoundText)
                        : ListView.separated(

                            itemCount: mainList.length,
                            separatorBuilder: (context, index) =>
                                14.verticalSpace,
                            itemBuilder: (context, index) {
                              service.itemIndex=index;
                              return ListViewItem(

                                task: mainList[index],
                                isTrash: isTrash,
                              );
                            },
                          );
                  },
                );
        });
  }
}
