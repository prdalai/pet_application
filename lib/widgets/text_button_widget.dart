import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/style.dart';

Widget textButtonWidget(String text, Color buttonBgColor, Color txtColor) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(color: buttonBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(text, style: AppStyle().poppinsBoldGeneral(txtColor, 20),),
  );
}
