import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pet_application/common/colors.dart';
import 'package:pet_application/common/sizeconfig.dart';
import 'package:pet_application/common/style.dart';
import 'package:pet_application/widgets/text_button_widget.dart';

showExitConfirmationDialog(context, msg, Color color) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.08 * width),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      msg,
                      style: AppStyle().poppinsBoldPrimary20(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        exit(0);
                      },
                      child: textButtonWidget('Yes', AppColors.primaryColor, Colors.white),
                    ),
                    SizedBox(width: 0.045 * width),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: textButtonWidget('No', Colors.grey, Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
