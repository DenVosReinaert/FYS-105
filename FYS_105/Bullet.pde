class Bullet extends GameObject {
  int bulletState = 0;

  Bullet(float incomingDX, float incomingDY) {

    bulletPosX = myPlayer.playerPosX + myPlayer.playerWidth/2;  //x position of bullet begins on y position of player
    bulletPosY = myPlayer.playerPosY + myPlayer.playerHeight/5;  //y position of bullet begins on y position of player

    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    //hp = 1;
    bulletWidth = 15;
    bulletHeight = 15;

    tag = "bullet";

    if (myPlayer.currentGun != myPlayer.shotgun) {
      if  (myPlayer.shootingRight) {
        bulletState = 1;
      } else if (myPlayer.shootingLeft) {
        bulletState = 2;
      } else if (myPlayer.shootingUp) {
        bulletState = 3;
      } else if (myPlayer.shootingDown) {
        bulletState = 4;
      }
    } else {
      bulletState = 5;
    }
  }

  void draw() {

    bulletPosX += moveVelX;
    bulletPosY += moveVelY;


    switch(bulletState) {
    case 1:
      bulletWidth = bulletRight.width;
      bulletHeight = bulletRight.height;
      image(bulletRight, bulletPosX, bulletPosY);
      break;
    case 2:
      bulletWidth = bulletLeft.width;
      bulletHeight = bulletLeft.height;
      image(bulletLeft, bulletPosX, bulletPosY);
      break;
    case 3:
      bulletWidth = bullet.width;
      bulletHeight = bullet.height;
      image(bullet, bulletPosX, bulletPosY);
      break;
    case 4:
      bulletWidth = bulletDown.width;
      bulletHeight = bulletDown.height;
      image(bulletDown, bulletPosX, bulletPosY);
      break;
    case 5:
      bulletWidth = buckS.width;
      bulletHeight = buckS.height;
      image(buckS, bulletPosX, bulletPosY);
      bulletWidth = buckS.width;
      bulletHeight = buckS.height;
      break;
    }

    //Bullet Removal
    if (bulletPosX + bulletWidth > width || bulletPosX < 0 || bulletPosY < 0 || bulletPosY + bulletHeight > height)
    {
      Remove(this);
      ascore.combo = 1;
      println("combo reset!");
    }
  }


  boolean hasDied() {
    return bulletPosY < 0 || bulletPosY > height || bulletPosX < 0 || bulletPosX > width;
  }
}
