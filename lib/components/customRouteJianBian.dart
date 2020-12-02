import 'package:flutter/material.dart';

//渐变效果
class CustomRouteJianBian extends PageRouteBuilder{
  final Widget widget;
  CustomRouteJianBian(this.widget)
      :super(
      transitionDuration:const Duration(milliseconds:300),
      pageBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2){
        return widget;
      },
      transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
        return FadeTransition(
          opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(
              parent:animation1,
              curve:Curves.fastOutSlowIn
          )),
          child: child,
        );
      }
  );
}