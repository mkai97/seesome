/*
 * @Author: your name
 * @Date: 2020-10-29 12:00:35
 * @LastEditTime: 2020-10-31 10:00:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \seesome\lib\views\mainHome\children\games\langaw\controllers\spawner.dart
 */

import 'package:seesome/views/mainHome/children/games/langaw/lanaw_core/langaw_game.dart';
import 'package:seesome/views/mainHome/children/games/langaw/langaw_components/fly.dart';

class FlySpawner {
  final LangawGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn; 

  FlySpawner(this.game) {
    start();
    game.spawnFly();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().microsecondsSinceEpoch + currentInterval;

  }

  void killAll() {
    game.flies.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {

    int nowTimestamp = DateTime.now().microsecondsSinceEpoch;
    int livingFlies = 0;
    game.flies.forEach((Fly fly) {
      if(!fly.isDead) livingFlies +=1;
     });

     if(nowTimestamp>=nextSpawn && livingFlies< maxFliesOnScreen){
       game.spawnFly();
       if(currentInterval>minSpawnInterval){
         currentInterval -=intervalChange;
         currentInterval-= (currentInterval*0.02).toInt();
       }
       nextSpawn = nowTimestamp + currentInterval;
     }
  }
}
