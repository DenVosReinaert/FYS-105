class Shotgun extends GameObject {


  Timer cooldownTimer = new Timer(2);

  Shotgun() {
    knockback = 40;
  }

  void holdingGun() {

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
  }



  void shoot() {


    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY;


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
        ShotgunReload.play();
        ShotgunReload.rewind();
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
        ShotgunReload.play();
        ShotgunReload.rewind();
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
        ShotgunReload.play();
        ShotgunReload.rewind();
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
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
