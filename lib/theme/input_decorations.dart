import 'package:flutter/material.dart';

import '../constants/borders/app_borders.dart';
import '../constants/colors/app_colors.dart';

class InputDecorations {
  InputDecorations._();

  static InputDecoration generalInputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: AppBorders.generalOutlineInputBorder(Colors.grey),
      focusedBorder: AppBorders.generalOutlineInputBorder(Colors.black),
      errorBorder: AppBorders.generalOutlineInputBorder(Colors.red),
      focusedErrorBorder: AppBorders.generalOutlineInputBorder(Colors.red),
    );
  }

  static InputDecoration searchInputDecor(String hint) {
    return InputDecoration(
      enabledBorder: AppBorders.searchOutlineInputBorder(AppColors.blueColor.withOpacity(0.5)),
      focusedBorder: AppBorders.searchOutlineInputBorder(AppColors.blueColor),
        hintText: hint,
        // hintStyle: AppTextStyle.bold14
        // border: AppBorders.searchOutlineInputBorder(AppColors.redColor),
        
        // enabledBorder:
        //     AppBorders.searchOutlineInputBorder(AppColors.redColor)
            );
  }
}
