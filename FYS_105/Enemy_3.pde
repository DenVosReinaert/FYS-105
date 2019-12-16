//Ruben de Jager
class Heavy extends Enemies {

  Heavy() {
    tag = "enemy";

    enemyW=60;
    enemyH=60;
    enemyHP=80;
    enemySpeedX=0.75;
    enemySpeedY=0.75;

  }//constructor Heavy


  void draw() {
    fill(91, 80, 80);
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
