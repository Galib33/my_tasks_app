import 'package:flutter/material.dart';

import '../../../constants/app_paddings.dart';
import '../../../theme/input_decorations.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final String hint;

  const SearchField(
      {super.key,
      required this.onChanged,
      required this.controller,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h7v8,
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecorations.searchInputDecor(hint),
      ),
    );
  }
}
