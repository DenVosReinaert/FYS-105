class Shotgun extends GameObject {


  Timer cooldownTimer = new Timer(1.5);

  Shotgun() {
    knockback = 40;
    upgradeLevel = 3;
  }

  //shotg_up, shotg_right, shotg_left, shotg_down; 

  void holdingGun() {

    switch(upgradeLevel)
    {
    case 1:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;

        image(pumpU, objPosX, objPosY);
        //handgunUp.resize(8, 35);
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        image(pumpD, objPosX, objPosY);
        //handgunDown.resize(8, 35);
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 10;
        image(pumpR, objPosX, objPosY);
        //handgunRight.resize(35, 16);
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 10;
        image(pumpL, objPosX, objPosY);
        //handgunLeft.resize(35, 16);
      }
      break;
    case 2:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        image(doubleBu, objPosX, objPosY);
        //handgunUp.resize(8, 35);
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+6;
        image(doubleBd, objPosX, objPosY);
        //handgunDown.resize(8, 35);
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX - 7;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBr, objPosX, objPosY);
        //handgunRight.resize(35, 16);
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBl, objPosX, objPosY);
        //handgunLeft.resize(35, 16);
      }
      break;
    case 3:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(shotg_up, objPosX, objPosY);
        shotg_up.resize(25, 60);
        popStyle();
        //handgunUp.resize(8, 35);
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2;
        pushStyle();
        image(shotg_down, objPosX, objPosY);
        shotg_down.resize(25, 60);
        popStyle();
        //handgunDown.resize(8, 35);
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX + 7;
        objPosY = myPlayer.objPosY;
        pushStyle();
        image(shotg_right, objPosX, objPosY);
        shotg_right.resize(50, 45);

        popStyle();
        //handgunRight.resize(35, 16);
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY;
        pushStyle();
        image(shotg_left, objPosX, objPosY);
        shotg_left.resize(50, 45);
        popStyle();
      }
      break;
    }
  }



  void shoot() {

    switch(upgradeLevel)
    {
    case 1:
      myPlayer.muzzlePointX = objPosX;
      myPlayer.muzzlePointY = objPosY;

      UI.capacityS1 = 20;
      break;
    case 2:
      UI.capacityS1 = 40;
      break;
    case 3:
      UI.capacityS1 = 60;
      break;
    }

    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingUp = true;
          Add(new Bullet(random(-2, 2), random(-14, -16)));
        }
        UI.ammoS1--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if ( UI.ammoS1 > 0) {


        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingDown = true;
          Add(new Bullet(random(-2, 2), random(14, 16)));
        }
        UI.ammoS1--;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingRight = true;
          Add(new Bullet(random(14, 16), random(-2, 2)));
        }
        UI.ammoS1--;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if ( UI.ammoS1 > 0) {
        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingLeft = true;
          Add(new Bullet(random(-14, -16), random(-2, 2)));
        }
        UI.ammoS1--;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
