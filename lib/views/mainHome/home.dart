/*
 * @Author: your name
 * @Date: 2020-10-25 13:53:10
 * @LastEditTime: 2020-10-28 18:36:18
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\home.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seesome/components/customRouteJianBian.dart';
import 'package:seesome/mixins/index.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Navigation(
       title: '首页',
      
       body: GestureDetector(
         onTap: (){
               Navigator.push(context, CustomRouteJianBian(Langaw()));
         },
         child: Container(
         child: Text('Fly'),
       ),
       )  ,
    );
  }
}