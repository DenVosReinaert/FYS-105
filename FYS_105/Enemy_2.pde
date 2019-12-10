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

    //ENEMY MOVEMENT
    if (dist(myPlayer.playerPosX, myPlayer.playerPosY, enemyPosX, enemyPosY) < 1000) { 
      if (myPlayer.playerPosX > enemyPosX) {
        enemyPosX += enemySpeedX;
      }//if
      if (myPlayer.playerPosX < enemyPosX) {
        enemyPosX -= enemySpeedX;
      }//if
      if (myPlayer.playerPosY < enemyPosY) {
        enemyPosY -= enemySpeedY;
      } //if
      else {
        enemyPosY += enemySpeedY;
      }//else
    }
  }//enemyShow

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}
