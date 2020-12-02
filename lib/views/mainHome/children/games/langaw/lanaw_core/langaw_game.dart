/*
 * @Author: your name
 * @Date: 2020-10-28 18:12:07
 * @LastEditTime: 2020-10-29 14:51:46
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\lanaw_core\langaw_game.dart
 */
import 'dart:developer';
import 'dart:math';

import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:seesome/views/mainHome/children/games/langaw/controllers/spawner.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/view.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/agile_fly.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/backard.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/drooler_fly.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/house_fly.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/hungry_fly.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/macho_fly.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/start_button.dart';
import 'package:seesome/views/mainHome/children/games/langaw/views/home_view.dart';
import 'package:seesome/views/mainHome/children/games/langaw/views/lost_view.dart';
import '../langaw_components/fly.dart';
import 'package:flutter/gestures.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backary backgroud;
  View activeView = View.home;
  HomeView homeView;
  LostView lostView;
  StartButton startButton;
  FlySpawner flySpawner;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    backgroud = Backary(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    lostView = LostView(this);
    rnd = Random();
    flySpawner = FlySpawner(this);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize * 2.025);
    double y = rnd.nextDouble() * (screenSize.height - tileSize * 2.025);
    // flies.add(HouseFly(this, x, y));
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render

    // Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    // Paint bgPaint = Paint();
    // bgPaint.color = Color(0xff576574);
    // canvas.drawRect(bgRect, bgPaint);

    backgroud.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));

    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
    if (activeView == View.lost) lostView.render(canvas);
  }

  @override
  void update(double t) {
    // TODO: implement update
    flySpawner.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;
    bool didHitAFly = false;

    if (!isHandled) {
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          didHitAFly = true;
          isHandled = true;
        }
      });
    }
    if (activeView == View.playing && !didHitAFly) {
      activeView = View.lost;
    }
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
  }
}
