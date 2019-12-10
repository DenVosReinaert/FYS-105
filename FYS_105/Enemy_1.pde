//Ruben de Jager
class Grunt extends Enemies {

  Grunt() {
    tag = "enemy";

    enemyW=16;
    enemyH=20;
    enemyHP=2;
    enemySpeedX=2;
    enemySpeedY=2;
  }//constructor Grunt

  void setup() {
    //dit moet in een array, de float "r" moet in draw want die moet veranderen, maar de enemies moeten 1 keer spawnen
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
  }//constructor Grunt

  void enemyShow() {
    fill(65, 17, 96);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
  }//enemyShow

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}//class Grunt
