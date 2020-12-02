/*
 * @Author: your name
 * @Date: 2020-10-29 10:06:50
 * @LastEditTime: 2020-10-29 10:55:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\agile_fly.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';

import 'fly.dart';

class AgileFly extends Fly {
  double get speed => game.tileSize*5;
  AgileFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x,y,game.tileSize*1.5,game.tileSize*1.5);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}