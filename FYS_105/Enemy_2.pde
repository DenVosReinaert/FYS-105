//Ruben de Jager
class Speedster extends Enemies {

  Speedster() {
    tag = "enemy";

    enemyW=40;
    enemyH=40;
    enemyHP=20;
    enemySpeedX=5;
    enemySpeedY=5;
  }//constructor Speedster
  void draw() {
    fill(229, 143, 23);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
  }//enemyShow

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}
