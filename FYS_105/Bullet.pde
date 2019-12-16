class Bullet extends GameObject {

  Bullet(float incomingDX, float incomingDY) {
    bulletPosX = myPlayer.playerPosX;  //x position of bullet begins on y position of player
    bulletPosY = myPlayer.playerPosY;  //y position of bullet begins on y position of player
    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    //hp = 1;
    bulletWidth = 15;
    bulletHeight = 15;
  }

  void draw() {

    bulletPosX += moveVelX;
    bulletPosY += moveVelY;

    fill(255);
    rect(bulletPosX, bulletPosY, 5, 5);
  }


  boolean hasDied() {
    return bulletPosY < 0 || bulletPosY > height || bulletPosX < 0 || bulletPosX > width;
  }
}
