/*
 * @Author: your name
 * @Date: 2020-09-07 09:17:57
 * @LastEditTime: 2020-09-21 17:26:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \sport_client-marge\lib\components\customRouteSuofang.dart
 */
import 'package:flutter/material.dart';

//渐变效果
class CustomRouteSuofang extends PageRouteBuilder {
  final Widget widget;
  CustomRouteSuofang(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1,
                    //快出慢进
                    curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
