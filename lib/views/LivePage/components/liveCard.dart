/*
 * @Author: your name
 * @Date: 2020-10-25 15:12:38
 * @LastEditTime: 2020-10-28 10:06:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\LivePage\components\liveCard.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seesome/components/customRouteJianBian.dart';
import 'package:seesome/mixins/index.dart';


class LiveCard extends StatefulWidget {
  final alldata;
  LiveCard({Key key, this.alldata}) : super(key: key);

  @override
  _LiveCardState createState() => _LiveCardState();
}

class _LiveCardState extends State<LiveCard> {
  var allData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData = widget.alldata;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomRouteJianBian(LivePlayerPage(sourceHttp:allData['sourceHttp'])));
      },
      child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
          width: ScreenUtil().setWidth(360),
          height: ScreenUtil().setWidth(60),
          decoration: BoxDecoration(color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
           boxShadow: [
            BoxShadow(
              color: Color(0xffcccccc),
              blurRadius: 3.0,
              spreadRadius: 2.0,
              offset: Offset(3.0, 3.0),
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Text(
                    allData['channelName'],
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      // color: Color(0xffccffcc)
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(allData['Status'],
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(10),
                            // color: Color(0xffccffcc)
                          )),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: ScreenUtil().setSp(30),
                      color: Color(0xffcccccc),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
