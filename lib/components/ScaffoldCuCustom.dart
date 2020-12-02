import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navigation extends StatefulWidget {
  final title; //标题
  final body; //主内容
  final actions; //右侧内容
  final bool automaticallyImplyLeading; //是否子页面
  final bool position; //是否为绝对定位
  final Widget bottom; //顶部Botton
  final bool centerText; //文字居中
  final Widget leading; //左侧
  final Color backgroundColor; //背景颜色
  final Color headerBackgroundColor; //头部颜色
  final bool brightness; //导航栏字体颜色  false 黑色  true 白色
  final Function backFn; //返回监听
  Navigation(
      {Key key,
      this.title,
      this.body,
      this.actions,
      this.bottom,
      this.position,
      this.automaticallyImplyLeading,
      this.centerText = false,
      this.leading,
      this.backgroundColor,
      this.headerBackgroundColor,
      this.brightness,
      this.backFn})
      : super(key: key);

  @override
  _NavigationState createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  String title = '';
  Widget body;
  List<Widget> actions = [];
  bool automaticallyImplyLeading = false;
  bool position = false;
  Widget bottom = null;
  bool centerText = false;
  Color backgroundColor = Colors.white;
  Color headerBackgroundColor = Colors.white;
  Widget leading;
  bool brightness = false;
  @override
  void initState() {
    super.initState();
    updateState();
  }

  updateState() {
    if (widget.title != null) {
      title = widget.title;
    }
    if (widget.body != null) {
      body = widget.body;
    }
    if (widget.actions != null) {
      actions = widget.actions;
    }
    if (widget.bottom != null) {
      bottom = widget.bottom;
    }
    if (widget.automaticallyImplyLeading != null) {
      automaticallyImplyLeading = widget.automaticallyImplyLeading;
    }
    if (widget.position != null) {
      position = widget.position;
    }
    if (widget.leading != null) {
      leading = widget.leading;
    }
    if (widget.backgroundColor != null) {
      backgroundColor = widget.backgroundColor;
    }
    if (widget.headerBackgroundColor != null) {
      headerBackgroundColor = widget.headerBackgroundColor;
    }
    if (widget.brightness != null) {
      brightness = widget.brightness;
    }
  }

  @override
  void didUpdateWidget(Navigation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    updateState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    // TODO: implement build
    return !position
        ? Container(
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                leading: leading,
                brightness: !brightness ? Brightness.light : Brightness.dark,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: headerBackgroundColor,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Color(0xffccffcc), Colors.blue[200]])),
                ),
                centerTitle: centerText,
                title: !automaticallyImplyLeading
                    ? Container(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(!centerText ? 15 : 0)),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(17)),
                        ),
                      )
                    : Container(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(8)),
                        width: ScreenUtil().setWidth(375),
                        height: ScreenUtil().setWidth(25),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Positioned(
                              left: -ScreenUtil().setWidth(6),
                              top: -ScreenUtil().setWidth(8),
                              child: automaticallyImplyLeading
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: ScreenUtil().setWidth(25),
                                        color: Color(0xffffffff),
                                      ),
                                      onPressed: () => widget.backFn != null
                                          ? widget.backFn()
                                          : Navigator.pop(context))
                                  : null,
                            ),
                            GestureDetector(
                              onTap: () => widget.backFn != null
                                  ? widget.backFn()
                                  : Navigator.pop(context),
                              child: Center(
                                widthFactor: 1,
                                child: Container(
                                  alignment:
                                      Alignment(centerText ? -0.07 : -1, 0),
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(!centerText
                                          ? 30
                                          : actions.length > 0
                                              ? 45
                                              : 0)),
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setWidth(17)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                elevation: 0.0,
                bottom: bottom,
                actions: actions,
              ),
              body: body,
            ),
          )
        : body;
  }
}
