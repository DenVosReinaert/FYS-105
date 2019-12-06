class Brute extends Grunt{

  Brute(){
    enemyW=30;
    enemyH=30;
    enemyHP=4;
    enemySpeedX=1;
    enemySpeedY=1;
            float r = random(-1, 3);
    if (r <= 0) {
      enemyPosX = spawn.spawnerPosX0;
      enemyPosY = spawn.spawnerPosY0;
    } else if (r > 0 && r <= 1) {
      enemyPosX = spawn.spawnerPosX1;
      enemyPosY = spawn.spawnerPosY1;
    } else if (r > 1 && r <= 2) {
      enemyPosX = spawn.spawnerPosX2;
      enemyPosY = spawn.spawnerPosY2;
    } else if (r > 2 && r <= 3) {
      enemyPosX = spawn.spawnerPosX3;
      enemyPosY = spawn.spawnerPosY3;
    }

  }//constructor Brute

  void enemyShow(){
    fill(9,36,145);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }

}
