class Pistol extends GameObject {

  float barrelX, barrelY;

  Pistol() {
    threshold = 40;
    cooldown = 0;
    knockback = 5;
  }

  // Show weapon sprite
  void holdingGun() {


    if (myPlayer.lookingUp) 
    {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;
      pushStyle();
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(8, 35);
      popStyle();
    } else if (myPlayer.lookingDown) 
    {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      pushStyle();
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(8, 35);
      popStyle();
    } else if (myPlayer.lookingRight)
    {
      barrelX = myPlayer.playerPosX + playerWidth + 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      pushStyle();
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(35, 16);
      popStyle();
    } else if (myPlayer.lookingLeft) 
    {
      barrelX = myPlayer.playerPosX - playerWidth - 30;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 10;
      pushStyle();
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(35, 16);
      popStyle();
    }
  }


  void shoot() {

    myPlayer.muzzlePointX = barrelX;
    myPlayer.muzzlePointY = barrelY;



    if (cooldown == threshold && myPlayer.shootingUp) {


      if (UI.ammoP > 0) {
        myPlayer.lookingUp = true;
        Add(new Bullet(random(-0.25, 0.25), random(-14.75, -15.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collBott || myPlayer.playerPosY + myPlayer.playerHeight + knockback < height)
          myPlayer.moveVelY += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {


      if (UI.ammoP > 0) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collTop || myPlayer.playerPosY - knockback > 0)
          myPlayer.moveVelY -=knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {


      if (UI.ammoP > 0) {
        myPlayer.lookingLeft = true;
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collRight || myPlayer.playerPosX + myPlayer.playerWidth + knockback < width)
          myPlayer.moveVelX += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {


      if (UI.ammoP > 0) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collLeft || myPlayer.playerPosX - knockback > 0)
          myPlayer.moveVelX -= knockback;

        Pistol.play();
        Pistol.rewind();
      }
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
