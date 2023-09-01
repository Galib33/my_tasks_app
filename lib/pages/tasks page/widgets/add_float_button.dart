import 'package:flutter/material.dart';
import 'package:on_board_page_again/constants/colors/app_colors.dart';

class AddFloatButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData icon;
  const AddFloatButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 10,
      backgroundColor: AppColors.darkBlueColor,
      
        onPressed: onPressed, label: Text(label), icon: Icon(icon));
  }
}
