class MachineGun extends GameObject {

  MachineGun() 
  {
    threshold = 8;
    cooldown = 0;
    knockback = 15;
  }


  void holdingGun() {


    if (myPlayer.lookingUp) 
    {
      objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
      objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
      image(arU, objPosX, objPosY);
      // handgunUp.resize(8, 35);
    } else if (myPlayer.lookingDown) 
    {
      objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
      objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
      image(arD, objPosX, objPosY);
      //handgunDown.resize(8, 35);
    } else if (myPlayer.lookingRight)
    {
      objPosX = myPlayer.objPosX;
      objPosY = myPlayer.objPosY + 10;
      image(arR, objPosX, objPosY);
      //handgunRight.resize(35, 16);
    } else if (myPlayer.lookingLeft) 
    {
      objPosX = myPlayer.objPosX - 30;
      objPosY = myPlayer.objPosY + 10;
      image(arL, objPosX, objPosY);
      //handgunLeft.(35, 16);
    }
  }


  void shoot() {

    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY + 8;

    if (cooldown == threshold && myPlayer.shootingUp) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingUp = true;

        Add(new Bullet(random(-0.5, 0.5), random(-14.5, -15.5)));
        UI.ammoM1--;
        cooldown = 0;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.5, 0.5), random(14.5, 15.5)));
        UI.ammoM1--;
        cooldown = 0;


        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -= knockback;

        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingLeft = true;

        Add(new Bullet(random(-14.5, -15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;


        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;


        LMG.play();
        LMG.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.5, 15.5), random(-0.5, 0.5)));
        UI.ammoM1--;
        cooldown = 0;


        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;


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
