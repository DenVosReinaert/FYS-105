class Shotgun extends GameObject {



  Shotgun() {
    threshold = 100;
    cooldown = 0;
    knockback = 40;
  }
  
    void holdingGun() {
    float barrelX, barrelY;
    if (myPlayer.lookingUp) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(8, 35);
      
    } else if (myPlayer.lookingDown) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      image(handgunDown, barrelX, barrelY);
      handgunDown.resize(8, 35);
      
    } else if (myPlayer.lookingRight) {
      barrelX = myPlayer.playerPosX + playerWidth + 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunRight, barrelX, barrelY);
      handgunRight.resize(35, 16);
      
    } else if (myPlayer.lookingLeft) {
      barrelX = myPlayer.playerPosX - playerWidth - 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunLeft, barrelX, barrelY);
      handgunLeft.resize(35, 16);
    }
  }
  
  

  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          Add(new Bullet(random(-2, 2), random(-14, -16)));
        }
        UI.ammoS1--;
        cooldown = 0;

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
          Add(new Bullet(random(-2, 2), random(14, 16)));
        }
        UI.ammoS1--;
        cooldown = 0;

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
          Add(new Bullet(random(14, 16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

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
          Add(new Bullet(random(-14, -16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

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
