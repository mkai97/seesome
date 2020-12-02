/*
 * @Author: your name
 * @Date: 2020-10-25 14:10:04
 * @LastEditTime: 2020-10-25 15:08:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\Me\index_page.dart
 */
import 'package:flutter/material.dart';
import 'package:seesome/mixins/index.dart';

class MePage extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Navigation(
      title: '我的',
    );
  }
}
