class Bullet extends GameObject {
  
  Bullet() {
    playerPosX = myPlayer.playerPosX;  //x position of bullet begins on y position of player
   playerPosY = myPlayer.playerPosY;  //y position of bullet begins on y position of player
    moveVelX = 0;    
    moveVelY = -15;   // shooting bullet straight up
    //hp = 1;
    playerWidth = 20;
    playerHeight = 20;
  }
  
    Bullet(float incomingDX, float incomingDY) {
    playerPosX = myPlayer.playerPosX;  //x position of bullet begins on y position of player
    playerPosY = myPlayer.playerPosY;  //y position of bullet begins on y position of player
    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    //hp = 1;
    playerWidth = 15;
    playerHeight = 15;
  }
  
  void show() {
  fill(255);
  rect(playerPosX, playerPosY, 5, 5);
  }
  
  void act() {
    playerPosX = playerPosX + moveVelX;
    playerPosY = playerPosY + moveVelY;
  }
  
    boolean hasDied() {
      return playerPosY < 0 || playerPosY > height || playerPosX < 0 || playerPosX > width;
    }
}
