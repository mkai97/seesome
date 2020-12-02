/*
 * @Author: your name
 * @Date: 2020-10-29 10:05:53
 * @LastEditTime: 2020-10-29 11:27:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\drooler_fly.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';

import 'fly.dart';


class DroolerFly extends Fly {
  double get speed => game.tileSize *1.5; 
  DroolerFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x,y,game.tileSize*1.5,game.tileSize*1.5);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}