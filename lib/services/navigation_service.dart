import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService{
  static navigateTo(Widget widget, context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
}