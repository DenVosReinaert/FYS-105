// TE4M
// Reno Bisschop
class MachineGun extends GameObject {



  Timer cooldownTimer = new Timer(0.2);


  MachineGun() 
  {
    knockback = 15;      //The knockback you get when you shoot with the MachineGun
    upgradeLevel = 1;    //Initializes the upgradeLevel of the MachineGun, which is 1
  }

  void holdingGun() {

    switch(upgradeLevel) {     //Using the switch so you can switch between upgradeLevels
    case 1:                    //First case in the switch
      if (myPlayer.lookingUp)  //This will draw the AR from upgradeLevel 1 if the player is looking up
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;   //Sets the position of the AR image
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;    
        image(arU, objPosX, objPosY);      //Draws the AR image on the position of the AR image

        myPlayer.muzzlePointX = objPosX + arU.width/2 - 2;  //Sets the muzzlepoint from the gun (for the bullet start position)
        myPlayer.muzzlePointY = objPosY + arU.height;
      } else if (myPlayer.lookingDown)     //This will draw the AR from upgradeLevel 1 if the player is looking down
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;   
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10; 
        image(arD, objPosX, objPosY);      

        myPlayer.muzzlePointX = objPosX + arU.width/2;       
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)     //This will draw the AR from upgradeLevel 1 if the player is looking right
      {
        objPosX = myPlayer.objPosX;    
        objPosY = myPlayer.objPosY + 10; 
        image(arR, objPosX, objPosY);  

        myPlayer.muzzlePointX = objPosX;      
        myPlayer.muzzlePointY = objPosY + 8;
      } else if (myPlayer.lookingLeft)      //This will draw the AR from upgradeLevel 1 if the player is looking left
      {
        objPosX = myPlayer.objPosX - 30;    
        objPosY = myPlayer.objPosY + 10;   
        image(arL, objPosX, objPosY);    

        myPlayer.muzzlePointX = objPosX;     
        myPlayer.muzzlePointY = objPosY + 8;
      }
      break; //stop the case
    case 2:          //Second case in the switch
      if (myPlayer.lookingUp)     //This will draw the AR from upgradeLevel 2 if the player is looking up
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        LMG1_up.resize(16, 70);      //Sets the LMG1 (AR lvl 2) to a size that's better looking ingame
        image(LMG1_up, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + arU.width/2;
        myPlayer.muzzlePointY = objPosY + 5;
      } else if (myPlayer.lookingDown)     //This will draw the AR from upgradeLevel 2 if the player is looking down
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2;
        pushStyle();
        LMG1_down.resize(16, 70);  
        image(LMG1_down, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + arU.width/2 + 1;
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)    //This will draw the AR from upgradeLevel 2 if the player is looking right
      {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 20;
        pushStyle();
        LMG1_right.resize(70, 16);   
        image(LMG1_right, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + 10;
        myPlayer.muzzlePointY = objPosY + 2;
      } else if (myPlayer.lookingLeft)     //This will draw the AR from upgradeLevel 2 if the player is looking left
      {
        objPosX = myPlayer.objPosX - 40;
        objPosY = myPlayer.objPosY + 20;
        pushStyle();
        LMG1_left.resize(70, 16);
        image(LMG1_left, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 3;
      }
      break;  //Stop the case
    case 3:      //Third case in the switch
      if (myPlayer.lookingUp)    //This will draw the AR from upgradeLevel 3 if the player is looking up
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2 - 10;
        pushStyle();
        LMG2_up.resize(16, 70);
        image(LMG2_up, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + arU.width/2;
        myPlayer.muzzlePointY = objPosY + 5;
      } else if (myPlayer.lookingDown)     //This will draw the AR from upgradeLevel 3 if the player is looking down
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2-10;
        pushStyle();
        LMG2_down.resize(16, 70);
        image(LMG2_down, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + arU.width/2 + 1;
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)    //This will draw the AR from upgradeLevel 3 if the player is looking right
      {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 15;
        pushStyle();
        LMG2_right.resize(70, 16);
        image(LMG2_right, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + 15;
        myPlayer.muzzlePointY = objPosY + 8;
      } else if (myPlayer.lookingLeft)     //This will draw the AR from upgradeLevel 3 if the player is looking left
      {
        objPosX = myPlayer.objPosX - 42;
        objPosY = myPlayer.objPosY + 15;
        pushStyle();
        LMG2_left.resize(70, 16);
        image(LMG2_left, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 8;
      }
      break;   //Stop the case
    }
  }


  void shoot() {

    switch(upgradeLevel)    //The capacity of the MachineGuns in the upgrades
    {
    case 1:
      UI.capacityM1 = 300;  

      break;
    case 2:
      UI.capacityM1 = 600;
      break;
    case 3:
      UI.capacityM1 = 900;
      break;
    }
    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {    //Shoots a bullet in the direction the player is looking at and ammo will be -1
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingUp = true;

        Add(new Bullet(random(-0.5, 0.5), random(-14.5, -15.5)));
        UI.ammoM1--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)  //The player gets knockback when there is no collision
          myPlayer.objPosY += knockback;

        AR1.play();      //Plays the AR sound
        AR1.rewind();
      } else {
        AR1Empty.play();      //Plays the AR empty sound
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {    //Shoots a bullet in the direction the player is looking at and ammo will be -1

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.5, 0.5), random(14.5, 15.5)));
        UI.ammoM1--;


        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -= knockback;

        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {    //Shoots a bullet in the direction the player is looking at and ammo will be -1
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingLeft = true;

        Add(new Bullet(random(-14.5, -15.5), random(-0.5, 0.5)));
        UI.ammoM1--;


        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;


        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {    //Shoots a bullet in the direction the player is looking at and ammo will be -1

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.5, 15.5), random(-0.5, 0.5)));
        UI.ammoM1--;


        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;


        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())    //
      cooldownTimer.Reset();
  }
}
