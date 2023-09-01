import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  // static TextStyle get columnTitleTextStyle =>
  //     GoogleFonts.rubik(color: AppColors.whiteColor, fontSize: 18);
  // const TextStyle(color: AppColors.whiteColor, fontSize: 18);
  // static const TextStyle titleTextStyle = TextStyle(
  //     color: AppColors.whiteColor, fontSize: 35, fontWeight: FontWeight.bold);

  static TextStyle get bold14 => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
      fontFamily: 'RobotoSlab');

  static TextStyle bold25 = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoSlab');
      
      static TextStyle bold25Black = TextStyle(
      fontSize: 24.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoSlab');
  static TextStyle grey600Style17 =
      TextStyle(fontSize: 17.sp,color: Colors.grey.shade600, fontFamily: 'RobotoSlab');

  static TextStyle bold16Green = TextStyle(
      fontSize: 16.sp,
      color: Colors.green.shade800,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoSlab');
}
