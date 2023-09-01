import 'package:flutter/material.dart';
import 'package:on_board_page_again/constants/texts/app_titles.dart';

import '../../../constants/app_text_style.dart';

class TrashAppBar extends StatelessWidget with PreferredSizeWidget {
  const TrashAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded)),
      title: Text(
        AppTitles.titleRemovedTasks,
        style: AppTextStyle.bold25Black,
      ),
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
