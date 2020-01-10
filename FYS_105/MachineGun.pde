// TE4M
// Dylan Vermeulen
class MachineGun extends GameObject {



  Timer cooldownTimer = new Timer(0.2);


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
    } else if (myPlayer.lookingDown) 
    {
      objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
      objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
      image(arD, objPosX, objPosY);
    } else if (myPlayer.lookingRight)
    {
      objPosX = myPlayer.objPosX;
      objPosY = myPlayer.objPosY + 10;
      image(arR, objPosX, objPosY);
    } else if (myPlayer.lookingLeft) 
    {
      objPosX = myPlayer.objPosX - 30;
      objPosY = myPlayer.objPosY + 10;
      image(arL, objPosX, objPosY);
    }
  }


  void shoot() {

    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY + 8;

    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {
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
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {

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
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {
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
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {

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
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
