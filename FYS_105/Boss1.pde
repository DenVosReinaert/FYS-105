class Boss1 extends GameObject{

  Boss1(){
    enemyW=65;
    enemyH=80;
    enemyHP=20;
    enemySpeedX=0.03;
    enemySpeedY=0.03;
  }
  void draw(){
    fill(255,0,0);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
    
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
}
