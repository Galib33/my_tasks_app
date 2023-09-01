import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_board_page_again/constants/colors/app_colors.dart';

import 'box_shadows.dart';

class BoxDecorations {
  BoxDecorations._();

  static BoxDecoration circular14withShadow = BoxDecoration(
      boxShadow: [BoxShadows.blueShadow],
      color: Colors.white,
      borderRadius: BorderRadius.circular(14).w);

  static const BoxDecoration circleRed =
      BoxDecoration(color: AppColors.redColor, shape: BoxShape.circle);
}
