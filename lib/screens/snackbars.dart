import 'package:flutter/material.dart';

import '../constants/borders/app_round_borders.dart';

class Snackbars {
  static void show(BuildContext context,
      {required Color color, required String snackbarMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackbarMessage),
      backgroundColor: color,
      shape: AppRoundBorders.bottomSheetRVRadius13,

      duration: const Duration(milliseconds: 800),

    ));
  }
}
