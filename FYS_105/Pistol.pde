// Reno Bisschop
class Pistol extends GameObject {

  Timer cooldownTimer = new Timer(1);

  Pistol() {
    knockback = 5;
    upgradeLevel = 1;
  }


  void holdingGun() {

    switch(upgradeLevel)
    {
    case 1:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(handgunUp, objPosX, objPosY);
        handgunUp.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(handgunDown, objPosX, objPosY);
        handgunDown.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(handgunRight, objPosX, objPosY);
        handgunRight.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 30;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(handgunLeft, objPosX, objPosY);
        handgunLeft.resize(35, 15);
        popStyle();
      }
      break;
    case 2:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(rayGunP_up, objPosX, objPosY);
        rayGunP_up.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(rayGunP_down, objPosX, objPosY);
        rayGunP_down.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(rayGunP_right, objPosX, objPosY);
        rayGunP_right.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 27;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(rayGunP_left, objPosX, objPosY);
        rayGunP_left.resize(35, 15);
        popStyle();
      }
      break;
    case 3:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(treeGun_up, objPosX, objPosY);
        treeGun_up.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(treeGun_down, objPosX, objPosY);
        treeGun_down.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(treeGun_right, objPosX, objPosY);
        treeGun_right.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 27;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(treeGun_left, objPosX, objPosY);
        treeGun_left.resize(35, 15);
        popStyle();
      }
      break;
    }
  }


  void shoot() {

    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY;



    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {


      if (UI.ammoP > 0) {
        myPlayer.lookingUp = true;
        Add(new Bullet(random(-0.25, 0.25), random(-14.75, -15.25)));
        UI.ammoP--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if (UI.ammoP > 0) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -=knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if (UI.ammoP > 0) {
        myPlayer.lookingLeft = true;
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if (UI.ammoP > 0) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
