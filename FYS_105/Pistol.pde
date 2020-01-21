class Pistol extends GameObject {

  Timer cooldownTimer = new Timer(1);

  Pistol() {
    knockback = 5;       //The knockback you get when you shoot with the MachineGun
    upgradeLevel = 1;    //Initializes the upgradeLevel of the MachineGun, which is 1
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
      image(handgunDown, objPosX, objPosY);
      handgunDown.resize(8, 35);
      popStyle();
    } else if (myPlayer.lookingRight)
    {
      objPosX = myPlayer.objPosX + objWidth + 20;
      objPosY = myPlayer.objPosY - objHeight/2 + 10;
      pushStyle();
      image(handgunRight, objPosX, objPosY);
      handgunRight.resize(35, 15);
      popStyle();
    } else if (myPlayer.lookingLeft) 
    {
      objPosX = myPlayer.objPosX - objWidth - 30;
      objPosY = myPlayer.objPosY - objHeight/2 + 10;
      pushStyle();
      image(handgunLeft, objPosX, objPosY);
      handgunLeft.resize(35, 15);
      popStyle();
    }
  }


  void shoot() {
    //Sets the muzzlepoint on the position of the gun, so the bullet starts from the gun
    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY;


    //Shoot at the direction based on which way the player is facing
    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {


      if (UI.ammoP > 0) {
        myPlayer.lookingUp = true;
        Add(new Bullet(random(-0.25, 0.25), random(-14.75, -15.25)));
        UI.ammoP--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    }
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if (UI.ammoP > 0) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -=knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } 
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if (UI.ammoP > 0) {
        myPlayer.lookingLeft = true;
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } 
    //Shoot at the direction based on which way the player is facing
    else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if (UI.ammoP > 0) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())  //When you shoot, the cooldowntimer resets so you can't shoot immediately
      cooldownTimer.Reset();
  }
}
