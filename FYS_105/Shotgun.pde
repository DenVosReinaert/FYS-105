// Reno Bisschop
class Shotgun extends GameObject {


  Timer cooldownTimer = new Timer(1.5); //Sets the cooldown to shoot on 1.5 sec

  Shotgun() {
    knockback = 40;    //The knockback you get when you shoot with the Shotgun
    upgradeLevel = 1;  //Initializes the upgradeLevel of the Shotgun, which is 1
  }

  void holdingGun() {
    // Show weapon sprite based on which way the player is facing
    switch(upgradeLevel)
    {
    case 1:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        image(doubleBu, objPosX, objPosY);
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+6;
        image(doubleBd, objPosX, objPosY);
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX - 7;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBr, objPosX, objPosY);
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBl, objPosX, objPosY);
        //handgunLeft.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      }
      break;
    case 2:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;

        image(pumpU, objPosX, objPosY);
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        image(pumpD, objPosX, objPosY);
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 10;
        image(pumpR, objPosX, objPosY);
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 10;
        image(pumpL, objPosX, objPosY);
        //handgunLeft.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      }
      break;

    case 3:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        shotg_up.resize(25, 60);
        image(shotg_up, objPosX, objPosY);

        popStyle();
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX + 8;
        myPlayer.muzzlePointY = objPosY - 15;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2;
        pushStyle();
        shotg_down.resize(25, 60);
        image(shotg_down, objPosX, objPosY);

        popStyle();
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX + 8;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX + 7;
        objPosY = myPlayer.objPosY;
        pushStyle();
        shotg_right.resize(50, 45);
        image(shotg_right, objPosX, objPosY);
        popStyle();
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX + 5;
        myPlayer.muzzlePointY = objPosY + 10;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY;
        pushStyle();
        shotg_left.resize(50, 45);
        image(shotg_left, objPosX, objPosY);

        popStyle();

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 10;
      }
      break;
    }
  }



  void shoot() {
    //The capacity of the MachineGuns in the upgrades
    switch(upgradeLevel)
    {
    case 1:
      UI.capacityS1 = 20;
      break;
    case 2:
      UI.capacityS1 = 40;
      break;
    case 3:
      UI.capacityS1 = 60;
      break;
    }
    //Shoot at the direction based on which way the player is facing
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
    } 
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


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
    } 
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


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
    } 
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


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
    if (cooldownTimer.TimerDone())     //When you shoot, the cooldowntimer resets so you can't shoot immediately
      cooldownTimer.Reset();
  }
}
