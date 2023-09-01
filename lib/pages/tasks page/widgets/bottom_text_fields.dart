import 'package:flutter/material.dart';

class BottomTextFields extends StatelessWidget {
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController controller;
  final InputDecoration decoration;
  const BottomTextFields(
      {super.key,
      this.maxLength,
      this.maxLines,
      required this.controller,
      this.validator,
      required this.decoration});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: decoration,
    );
  }
}
