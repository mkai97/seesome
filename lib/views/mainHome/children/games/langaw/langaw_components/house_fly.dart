/*
 * @Author: your name
 * @Date: 2020-10-29 09:57:01
 * @LastEditTime: 2020-10-29 10:34:14
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\house_fly.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';

import 'fly.dart';

class HouseFly extends Fly {
  HouseFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x,y,game.tileSize*1.5,game.tileSize*1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    deadSprite = Sprite('flies/house-fly-1.png');
  }
}
