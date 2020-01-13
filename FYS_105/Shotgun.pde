class Shotgun extends GameObject {


  Timer cooldownTimer = new Timer(1.5);

  Shotgun() {
    knockback = 40;
    upgradeLevel = 1;
  }

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
      break;
    case 3:
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
