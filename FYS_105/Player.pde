class Player extends GameObject {



  Pistol pistol = new Pistol();
  Shotgun shotGun = new Shotgun();
  MachineGun machineGun = new MachineGun();

  int currentGun, pistoll, shotgun, machinegun;



  Player() {
    playerPosX = width/2;
    playerPosY = height/2;

    moveVelX = 0;
    moveVelY = 0;

    playerWidth = 16;
    playerHeight = 20;

    tag = "player";


    pistoll = 1;
    shotgun = 2;
    machinegun = 3;
    //TO DO: als je 1 indrukt: BasicGun();,
    // als je 2 indrukt: MachineGun();,
    // als je 3 indrukt: Shotgun();.
  }





  void draw() {

    fill(255, 100, 0);
    if (lookingLeft) {
      playerLeft.resize(19, 36);
      image(playerLeft, playerPosX, playerPosY);
    }
    if (lookingRight) {
      playerRight.resize(19, 36);
      image(playerRight, playerPosX, playerPosY);
    }
    if (lookingUp) {
      playerBack.resize(19, 36);
      image(playerBack, playerPosX, playerPosY);
    }
    if (lookingDown) {
      playerFront.resize(19, 36);
      image(playerFront, playerPosX, playerPosY);
    }
    // rect(playerPosX, playerPosY, playerWidth, playerHeight);
  }

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

    moveVelX = 0;
    moveVelY = 0;
    //240
    if (akey) {
      if ((playerPosX + moveVelX < playerWidth/2) || (playerPosX + moveVelX < 16 && (playerPosY < 280 || playerPosY > 440)) || playerPosX + moveVelX < 580 + playerWidth && (playerPosY < 16 || playerPosY + playerHeight > height - 16))
      {
        moveVelX = 0;
      } else

        moveVelX = -defaultSpeed;
    }

    if (dkey) {
      if ((playerPosX + moveVelX > width - playerWidth/2) || (playerPosX + playerWidth/2 + moveVelX > width - 16 && (playerPosY < 280 || playerPosY > 440)) || playerPosX + playerWidth/2 + moveVelX > 700 && (playerPosY < 16 || playerPosY + playerHeight > height - 16))
      {
        moveVelX = 0;
      } else 
      moveVelX = defaultSpeed;
    }

    if (wkey) {
      if ((playerPosY + moveVelY < playerHeight/2) || (playerPosY + moveVelY < 280 && (playerPosX < 16 || playerPosX > width - 16)) || playerPosY + moveVelY < 16 && (playerPosX < 580 || playerPosX > 700))
      {
        moveVelY = 0;
      } else 
      moveVelY = -defaultSpeed;
    }

    if (skey) {
      if ((playerPosY + moveVelY > height - playerHeight/2) || (playerPosY + moveVelY > 440 && (playerPosX < 16 || playerPosX > width - 16)) || playerPosY + playerHeight + moveVelY > height - 16 && (playerPosX < 580 || playerPosX + playerWidth > 700))
      {
        moveVelY = 0;
      } else 
      moveVelY = defaultSpeed;
    }

    //sets the speed of the player to a different speed when moving diagonally so it moves at the same rate as the single axises
    if ((wkey && akey) || (akey && skey) || (skey && dkey) || (dkey && wkey)) {
      defaultSpeed = diaSpeed;
    } else defaultSpeed = 5;

    if (spacekey) {
      if (currentGun == pistoll)
        pistol.shoot();
      if (currentGun == machinegun)
        machineGun.shoot();
      if (currentGun == shotgun)
        shotGun.shoot();
    }

    playerPosX += moveVelX;
    playerPosY += moveVelY;

    //pistol.recharge();
    //machineGun.recharge();
    //shotGun.recharge();
  }






  void keyPressed() {
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
    if (key == ' ') spacekey = true;
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
  }

  void keyReleased() {
    if (key == 'a') akey = false;
    if (key == 's') skey = false;
    if (key == 'd') dkey = false;
    if (key == 'w') wkey = false;
    if (key == ' ') spacekey = false;
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
  }
}
