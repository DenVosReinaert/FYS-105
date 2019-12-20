class Player extends GameObject {

  Timer weaponSwapPrevTimer = new Timer(1);
  Timer weaponSwapNextTimer = new Timer(1);

  Pistol pistol = new Pistol();
  Shotgun shotGun = new Shotgun();
  MachineGun machineGun = new MachineGun();

  int currentGun, pistoll, shotgun, machinegun;

  boolean nextGun, prevGun, swapable;


  Player() {



    playerWidth = 25;
    playerHeight = 40;
    playerPosX = (width/2) - playerWidth/2;
    playerPosY = (height/2) - playerHeight/2;

    tag = "player";


    pistoll = 1;
    shotgun = 2;
    machinegun = 3;

    currentGun = pistoll;
  }


  void draw() {

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
      mrSpooksLeft.draw(playerPosX, playerPosY);
      mrSpooksLeft.update();
    } else if (myPlayer.lookingRight) {
      mrSpooksRight.draw(playerPosX, playerPosY);
      mrSpooksRight.update();
    } else if (myPlayer.lookingDown) {
      mrSpooksDown.draw(playerPosX, playerPosY);
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
      mrSpooksUp.draw(playerPosX, playerPosY);
      mrSpooksUp.update();
    }



    moveVelX = 0;
    moveVelY = 0;


    //240

    if ((wkey && akey) || (akey && skey) || (skey && dkey) || (dkey && wkey)) {
      defaultSpeed = diaSpeed;
    } else defaultSpeed = 5;

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


    if (playerPosX < 0)
      playerPosX = 0;

    if (playerPosX + playerWidth > width)
      playerPosX = width - playerWidth;

    if (playerPosY < 0)
      playerPosY = 0;

    if (playerPosY + playerHeight > height)
      playerPosY = height - playerHeight;



    if (akey)
    {
      if (playerPosX + moveVelX < 0)
      {
        moveVelX = 0;
      } else
        playerPosX -= defaultSpeed;
    }

    if (dkey)
    {
      if (playerPosX + playerWidth > width)
      {
        moveVelX = 0;
      } else
        playerPosX += defaultSpeed;
    }

    if (wkey)
    {
      if (playerPosY + moveVelY < 0)
      {
        moveVelY = 0;
      } else
        playerPosY -= defaultSpeed;
    }

    if (skey)
    {
      if (playerPosY + moveVelY > height)
      {
        moveVelY = 0;
      } else
        playerPosY += defaultSpeed;
    }


    if (prevGun) {
      weaponSwapPrevTimer.Timerr();

      swapable = true;

      if (swapable && !weaponSwapNextTimer.TimerDoneWithoutReset())
      {
        for (int i = 0; i < 1; i++)
        {
          if (currentGun >= 1)
          {
            currentGun --;
          } else if (currentGun < 1) currentGun = 3;
        }

        swapable = false;
      }

      if (weaponSwapNextTimer.TimerDoneWithoutReset())
      {
        swapable = true;
        weaponSwapNextTimer.TimerReset();
      }
    }


    if (nextGun) {
      weaponSwapNextTimer.Timerr();

      swapable = true;

      if (swapable && !weaponSwapNextTimer.TimerDoneWithoutReset())
      {
        for (int j = 0; j < 1; j++)
        {
          if (currentGun <= 3)
          {
            currentGun ++;
          } else if (currentGun > 3) currentGun = 1;
        }

        swapable = false;
      }

      if (weaponSwapNextTimer.TimerDoneWithoutReset())
      {
        swapable = true;
        weaponSwapNextTimer.TimerReset();
      }
    }


    playerPosX += moveVelX;
    playerPosY += moveVelY;
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
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;


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
    if (key == 'q')
    {
      prevGun = true;
      nextGun = false;
    }
    if (key =='e')
    {
      prevGun = false;
      nextGun = true;
    }
  }

  void keyReleased() {
    if (key == 'a') akey = false;
    if (key == 's') skey = false;
    if (key == 'd') dkey = false;
    if (key == 'w') wkey = false;
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
