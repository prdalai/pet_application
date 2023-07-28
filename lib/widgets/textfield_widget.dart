import 'package:flutter/material.dart';

import '../common/colors.dart';

Widget textFieldWidget(TextEditingController controller, String hintText) {
  return TextFormField(
    controller: controller,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      filled: true,
      hintText: hintText,
      fillColor: AppColors.textFieldFillColor.withAlpha(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),

  );
}