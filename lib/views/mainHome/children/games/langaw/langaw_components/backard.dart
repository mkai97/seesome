/*
 * @Author: your name
 * @Date: 2020-10-29 09:31:33
 * @LastEditTime: 2020-10-29 12:46:07
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\backard.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';

import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw.dart';

class Backary {
  final LangawGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backary(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(0, game.screenSize.height - (game.tileSize * 23),
        game.tileSize * 9, game.tileSize * 23);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
