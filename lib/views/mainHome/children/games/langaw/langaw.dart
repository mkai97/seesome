/*
 * @Author: your name
 * @Date: 2020-10-28 18:07:47
 * @LastEditTime: 2020-10-29 11:17:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw.dart
 */
import 'dart:developer';

import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import './lanaw_core/langaw_game.dart';

class Langaw extends StatefulWidget {
  @override
  _LangawState createState() => _LangawState();
}

class _LangawState extends State<Langaw> {
  LangawGame game = LangawGame();
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.portraitUp);
    // debugger();
    Flame.images.loadAll([
      'bg/backyard.png',
      'flies/agile-fly-1.png',
      'flies/agile-fly-2.png',
      'flies/agile-fly-dead.png',
      'flies/drooler-fly-1.png',
      'flies/drooler-fly-2.png',
      'flies/drooler-fly-dead.png',
      'flies/house-fly-1.png',
      'flies/house-fly-2.png',
      'flies/house-fly-dead.png',
      'flies/hungry-fly-1.png',
      'flies/hungry-fly-2.png',
      'flies/hungry-fly-dead.png',
      'flies/macho-fly-1.png',
      'flies/macho-fly-2.png',
      'flies/macho-fly-dead.png',
      'bg/lose-splash.png',
      'branding/title.png',
      'ui/dialog-credits.png',
      'ui/dialog-help.png',
      'ui/icon-credits.png',
      'ui/icon-help.png',
      'ui/start-button.png',
    ]);

    print(game);
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
    flameUtil.addGestureRecognizer(tapper);
  }

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
