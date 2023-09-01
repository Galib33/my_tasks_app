import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/app_paddings.dart';

class EmptyText extends StatelessWidget {
  final String message;

  const EmptyText({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all6,
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: AppColors.greyColor, fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
