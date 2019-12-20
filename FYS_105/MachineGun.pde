class MachineGun extends GameObject {


  MachineGun() {
    threshold = 8;
    cooldown = 0;
    knockback = 15;
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
      if (UI.ammoM1 > 0 ) {
        Add(new Bullet(random(-0.5, 0.5), random(-14.5, -15.5)));
        UI.ammoM1--;
        cooldown = 0;

        myPlayer.moveVelY += knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      if (UI.ammoM1 > 0 ) {
        Add(new Bullet(random(-0.5, 0.5), random(14.5, 15.5)));
        UI.ammoM1--;
        cooldown = 0;


        myPlayer.moveVelY -= knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if (UI.ammoM1 > 0 ) {
        Add(new Bullet(random(-14.5, -15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;

        myPlayer.moveVelX += knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      if (UI.ammoM1 > 0 ) {
        Add(new Bullet(random(14.5, 15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;

        myPlayer.moveVelX -= knockback;

        LMG.play();
        LMG.rewind();
      }
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
