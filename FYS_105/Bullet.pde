class Bullet extends GameObject {

  Bullet(float incomingDX, float incomingDY) {
    bulletPosX = myPlayer.playerPosX;  //x position of bullet begins on y position of player
    bulletPosY = myPlayer.playerPosY;  //y position of bullet begins on y position of player
    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    //hp = 1;
    bulletWidth = 15;
    bulletHeight = 15;

    tag = "bullet";
  }

  void draw() {

    bulletPosX += moveVelX;
    bulletPosY += moveVelY;

    fill(255);
    rect(bulletPosX, bulletPosY, 5, 5);

    //Bullet Removal
    if (bulletPosX + bulletWidth > width || bulletPosX < 0 || bulletPosY < 0 || bulletPosY + bulletHeight > height)
      Remove(this);
  }


  boolean hasDied() {
    return bulletPosY < 0 || bulletPosY > height || bulletPosX < 0 || bulletPosX > width;
  }
}
