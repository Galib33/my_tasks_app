import 'package:flutter/material.dart';
import 'package:on_board_page_again/constants/colors/app_colors.dart';

class BoxShadows {
  BoxShadows._();

  static BoxShadow get blueShadow => BoxShadow(
      color: AppColors.darkBlueColor.withOpacity(0.2),
      spreadRadius: 0,
      blurRadius: 16,
      offset: const Offset(0, 0));
}
