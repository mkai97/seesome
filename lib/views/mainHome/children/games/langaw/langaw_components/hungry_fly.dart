/*
 * @Author: your name
 * @Date: 2020-10-29 10:08:19
 * @LastEditTime: 2020-10-29 10:38:14
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\hungry_fly.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';

import 'fly.dart';


class HungryFly extends Fly {
  HungryFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}