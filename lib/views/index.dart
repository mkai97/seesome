/*
 * @Author: your name
 * @Date: 2020-10-25 13:59:39
 * @LastEditTime: 2020-10-25 15:11:38
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\index.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seesome/common/event_Bus.dart';
import 'package:seesome/components/customRouteJianBian.dart';
import 'package:seesome/mixins/index.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var _selectedIndex = 0;

  // 底部tab布局
  List<Map<String, dynamic>> routes = [
    {
      'icon': "assets/images/home.png",
      'iconActive': "assets/images/home_active.png",
      'code': '首页',
      'page': MyHomePage(),
    },
    // {
    //   'icon': "assets/images/square.png",
    //   'iconActive': "assets/images/square_active.png",
    //   'code': '直播',
    //   'page': LiveList(),
    // },
    {
      'icon': "assets/images/iconun.jpg",
      'iconActive': "assets/images/iconun.jpg",
      'code': '',
      'page': IndexPage(),
    },
    // {
    //   'icon': "assets/images/message.png",
    //   'iconActive': "assets/images/message_active.png",
    //   'code': '消息',
    //   'page': Messages(),
    // },
    {
      'icon': "assets/images/me.png",
      'iconActive': "assets/images/me_active.png",
      'code': '我的',
      'page': MePage(),
    },
  ];

  List<Widget> _selectPage = [];

  List<Widget> barItem = [];
  // 构造单个tab
  Widget bottomAppBarItem(int index) {
    //未选中的状态
    Color color = Color(0xff333333);
    AssetImage assetImage = AssetImage(routes[index]['icon']);
    if (_selectedIndex == index) {
      //选中
      color = Color(0xff3EDBBD);
      assetImage = AssetImage(routes[index]['iconActive']);
      //改变状态栏
      // if (_selectedIndex == 0 || _selectedIndex == 4) {
      //   store.dispatch(new SystemActions(systemBool: true));
      // } else {
      //   store.dispatch(new SystemActions(systemBool: false));
      // }
//      if(_selectedIndex == 1){
//        _openAddEntryDialog();
//      }
    }
    //构造返回的Widget
    Widget item = GestureDetector(
      child: Container(
        color: Colors.transparent,
        height: 58,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(image: assetImage, width: 25.0),
            Text(
              routes[index]['code'],
              style: TextStyle(fontSize: 12.0),
            )
          ],
        ),
      ),
      onTap: () {
        if (_selectedIndex != index) {
          eventBus.fire(SelectEvent(index));
          setState(() {
            _selectedIndex = index;
            color = Color(0xff3EDBBD);
            assetImage = AssetImage(routes[index]['iconActive']);
          });
        }
      },
    );
    return item;
  }

  void _getPage() async {
    List<Widget> _page = [];
    List<Widget> _barItem = [];
    for (var i = 0; i < routes.length; i++) {
      _page.add(routes[i]['page']);
      if (routes[i]['code'] == null || routes[i]['code'] == '') {
        _barItem.add(SizedBox());
      } else {
        _barItem.add(bottomAppBarItem(i));
      }
    }
    setState(() {
      _selectPage = _page;
      barItem = _barItem;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  releaseFn() {
     Navigator.push(context, CustomRouteJianBian(IndexPage()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);

    if (_selectPage.length <= 0) {
      return Container(
        color: Colors.white,
        child: Icon(Icons.local_fire_department),
      );
    }
    return new Scaffold(
        floatingActionButton: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(3),
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setWidth(50),
              alignment: Alignment.center,
              
              // child: 
              // Icon(IconData(0xe603, fontFamily: 'iconfont'),
              //     color: Colors.white, size: ScreenUtil().setWidth(28)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
                image: DecorationImage(
                    image: AssetImage("assets/images/iconun.jpg"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center),
              ),
            ),
          ),
          onTap: () => releaseFn(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: _selectedIndex,
          children: _selectPage,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              bottomAppBarItem(0),
              SizedBox(),
              bottomAppBarItem(2),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ));
  }
}
