// TE4M
// Dylan Vermeulen
class Bullet extends GameObject {
  // bulletState indicates which way the player is shooting
  int bulletState = 0;

  // two floats for x and y so you can specify where you want the bullet to be drawn in other classes
  Bullet(float incomingDX, float incomingDY) {


    objPosX = myPlayer.muzzlePointX;  //x position of bullet begins on y position of player
    objPosY = myPlayer.muzzlePointY;  //y position of bullet begins on y position of player

    moveVelX = incomingDX; // assigns the given value from another class to moveVelX so it can function within this class
    moveVelY= incomingDY; // assigns the given value from another class to moveVelX so it can function within this class
    objWidth = bullet.width; // normalises the bulletwidth for all classes since this class extends to gameobject
    objHeight = bullet.height; // normalises the bulletheight for all classes since this class extends to gameobject

    // gives this class the tag "bullet" so the bullets won't be confused with other objects
    tag = "bullet";

    // this sets the bulletState depending on what way the player is shooting
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
      bulletState = 5; // this one is for the shotgun which doesnt need a direction since the bullets are just circles
    }
  }

  void draw() {
    // assigns a value for movement to the bullet
    objPosX += moveVelX;
    objPosY += moveVelY;

    // draws sprite and decides direction for the bullet depending on which weapon is being held and which upgrades you have
    switch(bulletState) {
    case 1: // if the player is shooting right
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_right.width;
        objHeight = rayGunP_B_right.height;
        image(rayGunP_B_right, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        image(bulletRight, objPosX, objPosY);
      }
      break;
    case 2: // if the player is shooting left
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_left.width;
        objHeight = rayGunP_B_left.height;
        image(rayGunP_B_left, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletLeft.width;
        objHeight = bulletLeft.height;
        image(bulletLeft, objPosX, objPosY);
      }
      break;
    case 3: // if the player is shooting up
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_up.width;
        objHeight = rayGunP_B_up.height;
        image(rayGunP_B_up, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bullet.width;
        objHeight = bullet.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bullet.width;
        objHeight = bullet.height;
        image(bullet, objPosX, objPosY);
      }
      break;
    case 4: // if the player is shooting down
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_down.width;
        objHeight = rayGunP_B_down.height;
        image(rayGunP_B_down, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletDown.width;
        objHeight = bulletDown.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletDown.width;
        objHeight = bulletDown.height;
        image(bulletDown, objPosX, objPosY);
      }
      break;
    case 5: // this is the bullet for the shotgun
      objWidth = buckS.width;
      objHeight = buckS.height;
      image(buckS, objPosX, objPosY);
      break;
    }

    //Bullet Removal if it is out of screen or colliding with a piller/tower
    if (objPosX + objWidth > width || objPosX < 0 || objPosY < 0 || objPosY + objHeight > height || collLeft || collRight || collTop || collBott)
    {
      Remove(this);
      ascore.ComboReset();
    }
  }
}
