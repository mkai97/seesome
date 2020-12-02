/*
 * @Author: your name
 * @Date: 2020-10-29 11:14:48
 * @LastEditTime: 2020-10-29 11:56:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\views\home_view.dart
 */
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';

class HomeView{
  final LangawGame game;
Rect titleRect;
Sprite titleSprite;


  HomeView(this.game){
    titleRect = Rect.fromLTWH(game.tileSize, (game.screenSize.height/2)- (game.tileSize*5), game.tileSize*7, game.tileSize*4);
    titleSprite =Sprite('branding/title.png');
  }

void render(Canvas c){
  titleSprite.renderRect(c, titleRect);
}

void update(double t){}
}