/*
 * @Author: your name
 * @Date: 2020-10-29 11:29:35
 * @LastEditTime: 2020-10-29 14:48:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\start_button.dart
 */
import 'dart:developer';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/view.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/fly.dart';

class StartButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
        game.tileSize * 1.5,
        (game.screenSize.height * 0.75) - (game.tileSize * 1.5),
        game.tileSize * 6,
        game.tileSize * 3);
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}
  void onTapDown() {
    game.flySpawner.start();
    game.activeView = View.playing;
print(game.activeView);
  }
}
