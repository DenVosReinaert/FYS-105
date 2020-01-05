class Shotgun extends GameObject {

  float barrelX, barrelY;

  Shotgun() {
    threshold = 100;
    cooldown = 0;
    knockback = 40;
  }

  void holdingGun() {

    if (myPlayer.lookingUp) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;

      image(pumpU, barrelX, barrelY);
      //handgunUp.resize(8, 35);
    } else if (myPlayer.lookingDown) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      image(pumpD, barrelX, barrelY);
      //handgunDown.resize(8, 35);
    } else if (myPlayer.lookingRight) {
      barrelX = myPlayer.playerPosX + playerWidth;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      image(pumpR, barrelX, barrelY);
      //handgunRight.resize(35, 16);
    } else if (myPlayer.lookingLeft) {
      barrelX = myPlayer.playerPosX - playerWidth - 30;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      image(pumpL, barrelX, barrelY);
      //handgunLeft.resize(35, 16);
    }
  }



  void shoot() {


    myPlayer.muzzlePointX = barrelX;
    myPlayer.muzzlePointY = barrelY;


    if (cooldown == threshold && myPlayer.shootingUp) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingUp = true;
          Add(new Bullet(random(-2, 2), random(-14, -16)));
        }
        UI.ammoS1--;
        cooldown = 0;

        if (!myPlayer.collBott || myPlayer.playerPosY + myPlayer.playerHeight + knockback < height)
          myPlayer.playerPosY += knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {


      if ( UI.ammoS1 > 0) {


        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingDown = true;
          Add(new Bullet(random(-2, 2), random(14, 16)));
        }
        UI.ammoS1--;
        cooldown = 0;

        if (!myPlayer.collTop || myPlayer.playerPosY - knockback > 0)
          myPlayer.playerPosY -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingRight = true;
          Add(new Bullet(random(14, 16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

        if (!myPlayer.collLeft || myPlayer.playerPosX - knockback > 0)
          myPlayer.playerPosX -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {


      if ( UI.ammoS1 > 0) {
        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingLeft = true;
          Add(new Bullet(random(-14, -16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

        if (!myPlayer.collRight || myPlayer.playerPosX + myPlayer.playerWidth + knockback < width)
          myPlayer.playerPosX += knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
