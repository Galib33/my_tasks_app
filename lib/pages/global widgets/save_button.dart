import 'package:flutter/material.dart';

import '../../constants/app_paddings.dart';
import '../../constants/borders/app_round_borders.dart';

class SaveButton extends StatelessWidget {
  final String title;
  final Function() onSavePressed;
  const SaveButton(
      {super.key, required this.onSavePressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: AppRoundBorders.submitButtonRadius13,
          padding: AppPaddings.v25h60,
        ),
        onPressed: onSavePressed
        //
        ,
        child: Text(title));
  }
}
