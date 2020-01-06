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


    if (myPlayer.lookingLeft) {
      mrSpooksLeft.draw(objPosX, objPosY);
      mrSpooksLeft.update();
    } else if (myPlayer.lookingRight) {
      mrSpooksRight.draw(objPosX, objPosY);
      mrSpooksRight.update();
    } else if (myPlayer.lookingDown)
    {
      mrSpooksDown.draw(objPosX, objPosY);
      mrSpooksDown.update();
    }
    // rect(playerPosX, playerPosY, playerWidth, playerHeight);

    if (myPlayer.currentGun == pistoll)
      pistol.holdingGun();

    if (myPlayer.currentGun == shotgun)
      shotGun.holdingGun();

    if (myPlayer.currentGun == machinegun)
      machineGun.holdingGun();

    if (myPlayer.lookingUp) {
      mrSpooksUp.draw(objPosX, objPosY);
      mrSpooksUp.update();
    }

    //240

    //MOVEMENT
    moveVelX = defaultSpeed;
    moveVelY = defaultSpeed;


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


    //if (playerPosX < 0)
    //  playerPosX = 0;

    //if (playerPosX + playerWidth > width)
    //  playerPosX = width - playerWidth;

    //if (playerPosY < 0)
    //  playerPosY = 0;

    //if (playerPosY + playerHeight > height)
    //  playerPosY = height - playerHeight;



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

    if (currentGun > 3) {
      currentGun = 1;
    }
    if (currentGun < 1) {
      currentGun = 3;
    }




    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }





  void keyPressed() {

    if (keyCode == LEFT)
    {
      shootingLeft = true;
      shootingRight = false;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
    }
    if (keyCode == RIGHT)
    {
      shootingLeft = false;
      shootingRight = true;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
    }
    if (keyCode == UP)
    {
      shootingLeft = false;
      shootingRight = false;
      shootingDown = false;
      shootingUp = true;

      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;
    }
    if (keyCode == DOWN)
    {
      shootingLeft = false;
      shootingRight = false;
      shootingDown = true;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
    }


    if (key == 'a') {
      akey = true;
      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
    }
    if (key == 's') {
      skey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
    }
    if (key == 'd') {
      dkey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
    }
    if (key == 'w') {
      wkey = true;
      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;
    }
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;



    if (key == 'q')
    {
      currentGun--;
      //prevGun = true;
      //nextGun = false;
    }
    if (key =='e')
    {
      currentGun++;
      //prevGun = false;
      //nextGun = true;
    }
  }

  void keyReleased() {
    if (key == 'a') 
    {
      akey = false;
    }
    if (key == 's')
    {
      skey = false;
    }
    if (key == 'd') 
    {
      dkey = false;
    }
    if (key == 'w')
    {
      wkey = false;
    }
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
    if (keyCode == LEFT) shootingLeft = false;
    if (keyCode == RIGHT) shootingRight = false;
    if (keyCode == UP) shootingUp = false;
    if (keyCode == DOWN) shootingDown = false;
    if (key == 'q') prevGun = false;
    if (key == 'e') nextGun = false;
  }
}
