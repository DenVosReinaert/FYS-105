//Ruben de Jager
class Speedster extends Enemies {

  Speedster() {
    enemyW=20;
    enemyH=24;
    enemyHP=1;
    enemySpeedX=4;
    enemySpeedY=4;
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
    
  }//constructor Speedster
  void enemyShow() {
    fill(229, 143, 23);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
  }//enemyShow

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}
