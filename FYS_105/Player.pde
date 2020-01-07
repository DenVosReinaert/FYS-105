// TE4M
// Dylan Vermeulen

class Player extends GameObject {

  Timer weaponSwapPrevTimer = new Timer(1);
  Timer weaponSwapNextTimer = new Timer(1);

  Pistol pistol = new Pistol();
  Shotgun shotGun = new Shotgun();
  MachineGun machineGun = new MachineGun();

  int currentGun, pistoll, shotgun, machinegun;

  float muzzlePointX, muzzlePointY;

  boolean nextGun, prevGun, swapable;

  Player() {

    objWidth = 28;
    objHeight = 40;
    objPosX = (width/2) - objWidth/2;
    objPosY = (height/2) - objHeight/2;


    tag = "player";


    pistoll = 1;
    shotgun = 2;
    machinegun = 3;

    // Default gun is pistol
    currentGun = pistoll;
  }


  void draw() {

    if (objPosX + moveVelX < 0)
      collLeft = true;

    if (objPosX + objWidth + moveVelX > width)
      collRight = true;

    if (objPosY + moveVelY < 0)
      collTop = true;

    if (objPosY + objHeight + moveVelY > height)
      collBott = true;


    if (onekey) {
      currentGun = pistoll;
      onekey = false;
    } else if (twokey) {
      currentGun = machinegun;
      twokey = false;
    } else if (threekey) {
      currentGun = shotgun;
      threekey = false;
    }

    // Draws player sprite depending on the direction they look
    if (myPlayer.lookingLeft) {
      mrSpooksLeft.draw(objPosX, objPosY);
      mrSpooksLeft.update();
    } else if (myPlayer.lookingRight) {
      mrSpooksRight.draw(objPosX, objPosY);
      mrSpooksRight.update();
    } else if (myPlayer.lookingUp) {
      mrSpooksUp.draw(objPosX, objPosY);
      mrSpooksUp.update();
    } else if (myPlayer.lookingDown) {
      mrSpooksDown.draw(objPosX, objPosY);
      mrSpooksDown.update();
    }

    // 
    if (myPlayer.currentGun == pistoll)
      pistol.holdingGun();

    if (myPlayer.currentGun == shotgun)
      shotGun.holdingGun();

    if (myPlayer.currentGun == machinegun)
      machineGun.holdingGun();

    //240

    // Assigns value to movementspeed
    moveVelX = defaultSpeed;
    moveVelY = defaultSpeed;

    // 
    if ((wkey && akey) || (akey && skey) || (skey && dkey) || (dkey && wkey)) {
      defaultSpeed = diaSpeed;
    } else defaultSpeed = 2.1;

    if (myPlayer.shootingUp || myPlayer.shootingDown || myPlayer.shootingRight || myPlayer.shootingLeft) {
      if (currentGun == pistoll)
      {
        pistol.shoot();
        pistol.recharge();
      }
      if (currentGun == machinegun)
      {
        machineGun.shoot();
        machineGun.recharge();
      }
      if (currentGun == shotgun)
      {
        shotGun.shoot();
        shotGun.recharge();
      }
    }

    // Check collision with the pillars and stops you from moving over it
    if (akey && !collLeft)
    {
      objPosX -= moveVelX;
    }

    if (dkey && !collRight)
    {
      objPosX += moveVelX;
    }

    if (wkey && !collTop)
    {
      objPosY -= moveVelY;
    }

    if (skey && !collBott)
    {
      objPosY += moveVelY;
    }

    // Makes sure the cycle keeps cycleing between 1 and 3
    if (currentGun > 3) {
      currentGun = 1;
    }
    if (currentGun < 1) {
      currentGun = 3;
    }

    // Prevents collision catch
    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }

  // The defining controlls section \/\/\/\/
  void keyPressed() {
    // Controls for shooting in all directions and looking in all directions
    switch(keyCode) {
    case LEFT:
      shootingLeft = true;
      shootingRight = false;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
      break;
    case RIGHT:
      shootingLeft = false;
      shootingRight = true;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
      break;
    case UP:
      shootingLeft = false;
      shootingRight = false;
      shootingDown = false;
      shootingUp = true;

      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;
      break;
    case DOWN:
      shootingLeft = false;
      shootingRight = false;
      shootingDown = true;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
      break;
    }

    // Controlls for walking in all directions
    switch(key) {
    case 'a':
      akey = true;
      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
      break;
    case 's':
      skey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
      break;
    case 'd':
      dkey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
      break;
    case 'w':
      wkey = true;
      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;

      // Controls for switching weapons on desktop
      if (key == '1') onekey = true;
      if (key == '2') twokey = true;
      if (key == '3') threekey = true;

      // Controls for switching weapons on a cycle with snes controller
      if (key == 'q')
      {
        currentGun--;
      }
      if (key =='e')
      {
        currentGun++;
      }
    }
  }
  void keyReleased() {

    // Release for the walking directions   
    switch(key) {
    case 'a':
      akey = false;  
      break;
    case 's':
      skey = false;
      break;
    case 'd':
      dkey = false;
      break;
    case 'w':
      wkey = false;
      break;
    }

    // Release for controlls for whooting in all directions.
    switch(keyCode) {
    case LEFT:
      shootingLeft = false;
      break;
    case RIGHT:
      shootingRight = false;
      break;
    case UP:
      shootingUp = false;
      break;
    case DOWN:
      shootingDown = false;
      break;
    }

    // Release for controls for switching weapons on desktop
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;

    // Release for controls for switching weapons on a cycle with snes controller 
    if (key == 'q') prevGun = false;
    if (key == 'e') nextGun = false;
  }
}
