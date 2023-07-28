import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_application/common/colors.dart';
import 'package:pet_application/common/style.dart';

 showAlertDialog(
    BuildContext context,
    String title,
    String content,
    ) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return CupertinoAlertDialog(
        title: Text(title, style: AppStyle().poppinsBoldGeneral(AppColors.primaryColor, 15),),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(content, style: AppStyle().poppinsBoldGeneral(AppColors.primaryColor, 15),),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              //
              Navigator.of(context, rootNavigator: true).pop("Discard");
            },
            isDefaultAction: true,
            child: Text('ok', style: AppStyle().poppinsBoldGeneral(AppColors.primaryColor, 15),),
          ),
        ],
      );
    },
  );
}