import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_application/common/style.dart';

Widget headingSubheadingWidget(String heading, String subHeading){
  return Container(
    margin: EdgeInsets.only(left: 10, top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(heading, style: AppStyle().poppinsBoldPrimary20(),),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(subHeading, style: AppStyle().poppinsSemiBoldBlack18(),),
        ),
        SizedBox(height: 5,),
        Divider(),
      ],
    ),
  );
}