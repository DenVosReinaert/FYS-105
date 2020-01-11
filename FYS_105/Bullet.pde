// TE4M
// Dylan Vermeulen
class Bullet extends GameObject {

  int bulletState = 0;

  Bullet(float incomingDX, float incomingDY) {



    objPosX = myPlayer.muzzlePointX;  //x position of bullet begins on y position of player
    objPosY = myPlayer.muzzlePointY;  //y position of bullet begins on y position of player

    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    objWidth = bullet.width;
    objHeight = bullet.height;

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

    objPosX += moveVelX;
    objPosY += moveVelY;


    switch(bulletState) {
    case 1:
      objWidth = bulletRight.width;
      objHeight = bulletRight.height;
      image(bulletRight, objPosX, objPosY);
      break;
    case 2:
      objWidth = bulletLeft.width;
      objHeight = bulletLeft.height;
      image(bulletLeft, objPosX, objPosY);
      break;
    case 3:
      objWidth = bullet.width;
      objHeight = bullet.height;
      image(bullet, objPosX, objPosY);
      break;
    case 4:
      objWidth = bulletDown.width;
      objHeight = bulletDown.height;
      image(bulletDown, objPosX, objPosY);
      break;
    case 5:
      objWidth = buckS.width;
      objHeight = buckS.height;
      image(buckS, objPosX, objPosY);
      objWidth = buckS.width;
      objHeight = buckS.height;
      break;
    }

    //Bullet Removal
    if (objPosX + objWidth > width || objPosX < 0 || objPosY < 0 || objPosY + objHeight > height || collLeft || collRight || collTop || collBott)
    {
      Remove(this);
      ascore.ComboReset();
      println("combo reset!");
    }
  }


  boolean hasDied() {
    return objPosY < 0 || objPosY > height || objPosX < 0 || objPosX > width;
  }
}
