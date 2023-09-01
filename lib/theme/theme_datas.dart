import 'package:flutter/material.dart';
import 'package:on_board_page_again/constants/colors/app_colors.dart';

import '../constants/app_border_radiuses.dart';

class ThemeDatas {
  ThemeDatas._();

  static ThemeData get generalAppTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme:const  AppBarTheme(
          foregroundColor: AppColors.blackColor,
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: const MaterialStatePropertyAll(AppColors.darkBlueColor),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadiuses.c5,
          ),
        ),
        primarySwatch: AppColors.getMaterialColor(AppColors.darkBlueColor),
      );
}
