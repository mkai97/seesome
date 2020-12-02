/*
 * @Author: your name
 * @Date: 2020-10-28 18:25:21
 * @LastEditTime: 2020-10-29 14:53:09
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\langaw_components\fly.dart
 */
import 'dart:developer';
import 'dart:ui';
import '../lanaw_core/langaw_game.dart';
import 'package:flame/sprite.dart';

class Fly {
  final LangawGame game;
  Rect flyRect;
  List flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
// Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;
double get speed =>game.tileSize *3;
Offset targetLocation;
  Fly(this.game){
    setTargetLocation();
  }
//  现在我们已经有了包含动画的小飞蝇了, 你应该注意到区块尺寸已经失效了. 那是因为这是一个”概念证明”(Poc)规则, 可以解释屏幕尺寸, 宽高比, 尺寸, 以及区块系统.
  // Fly(this.game, double x, double y) {
    // flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    // flyPaint = Paint();
    // flyPaint.color = Color(0xff6ab04c);
  // }
  void setTargetLocation() { // 移动随机位置
  double x = game.rnd.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
  double y = game.rnd.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
  targetLocation = Offset(x, y);
}
  void render(Canvas c) {
    // c.drawRect(flyRect, flyPaint);
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex = 0.0;
      }
      double stepDistance = speed *t;
      Offset toTarget = targetLocation - Offset(flyRect.left,flyRect.top);
      if(stepDistance< toTarget.distance){
        Offset stepToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
        flyRect = flyRect.shift(stepToTarget);

      }else{
        flyRect= flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    // flyPaint.color = Color(0xffff4757);
    isDead = true;
  }
}
