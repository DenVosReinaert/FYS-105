class Pistol extends GameObject {

  Timer cooldownTimer = new Timer(1);

  Pistol() {
    threshold = 40;
    cooldown = 0;
    knockback = 5;
  }


  void holdingGun() {

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
      image(handgunUp, objPosX, objPosY);
      handgunUp.resize(8, 35);
      popStyle();
    } else if (myPlayer.lookingRight)
    {
      objPosX = myPlayer.objPosX + objWidth + 20;
      objPosY = myPlayer.objPosY - objHeight/2 + 10;
      pushStyle();
      image(handgunUp, objPosX, objPosY);
      handgunUp.resize(35, 16);
      popStyle();
    } else if (myPlayer.lookingLeft) 
    {
      objPosX = myPlayer.objPosX - objWidth - 30;
      objPosY = myPlayer.objPosY - objHeight/2 + 10;
      pushStyle();
      image(handgunUp, objPosX, objPosY);
      handgunUp.resize(35, 16);
      popStyle();
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
        cooldown = 0;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if (UI.ammoP > 0) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -=knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if (UI.ammoP > 0) {
        myPlayer.lookingLeft = true;
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if (UI.ammoP > 0) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Pistol.play();
        Pistol.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
