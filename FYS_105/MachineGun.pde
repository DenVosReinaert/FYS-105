class MachineGun extends GameObject {

  float barrelX, barrelY;

  MachineGun() 
  {
    threshold = 8;
    cooldown = 0;
    knockback = 15;
  }


  void holdingGun() {


    if (myPlayer.lookingUp) 
    {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(8, 35);
    } else if (myPlayer.lookingDown) 
    {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      image(handgunDown, barrelX, barrelY);
      handgunDown.resize(8, 35);
    } else if (myPlayer.lookingRight)
    {
      barrelX = myPlayer.playerPosX + playerWidth + 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      image(handgunRight, barrelX, barrelY);
      handgunRight.resize(35, 16);
    } else if (myPlayer.lookingLeft) 
    {
      barrelX = myPlayer.playerPosX - playerWidth - 30;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      image(handgunLeft, barrelX, barrelY);
      handgunLeft.resize(35, 16);
    }
  }


  void shoot() {

    myPlayer.muzzlePointX = barrelX;
    myPlayer.muzzlePointY = barrelY;

    if (cooldown == threshold && myPlayer.shootingUp) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingUp = true;

        Add(new Bullet(random(-0.5, 0.5), random(-14.5, -15.5)));
        UI.ammoM1--;
        cooldown = 0;

        if (!myPlayer.collBott || myPlayer.playerPosY + myPlayer.playerHeight + knockback < height)
          myPlayer.playerPosY += knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.5, 0.5), random(14.5, 15.5)));
        UI.ammoM1--;
        cooldown = 0;

        if (!myPlayer.collTop || myPlayer.playerPosY - knockback > 0)
          myPlayer.playerPosY -= knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingLeft = true;

        Add(new Bullet(random(-14.5, -15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;

        if (!myPlayer.collRight || myPlayer.playerPosX + myPlayer.playerWidth + knockback < width)
          myPlayer.playerPosX += knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.5, 15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;

        if (!myPlayer.collLeft || myPlayer.playerPosX - knockback > 0)
          myPlayer.playerPosX -= knockback;

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
