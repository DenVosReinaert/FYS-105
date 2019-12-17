class Player extends GameObject {


  Pistol pistol = new Pistol();
  Shotgun shotGun = new Shotgun();
  MachineGun machineGun = new MachineGun();

  int currentGun, pistoll, shotgun, machinegun;


  Player() {



    playerWidth = 14;
    playerHeight = 20;
    playerPosX = (width/2) - playerWidth/2;
    playerPosY = (height/2) - playerHeight/2;

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
    rect(playerPosX, playerPosY, playerWidth, playerHeight);

    //int i = gameObject.size() - 1;
    //while (i >= 0) {
    //  GameObject thing = gameObject.get(i);
    //  thing.show();
    //  thing.act();
    //  if (thing.hasDied()) {
    //    this.gameObject.remove(i);
    //  }
    //  i--;
    //}

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
      playerLeft.resize(14, 20);
      image(playerLeft, playerPosX, playerPosY);
    } else if (myPlayer.lookingRight) {
      playerRight.resize(14, 20);
      image(playerRight, playerPosX, playerPosY);
    } else if (myPlayer.lookingUp) {
      playerBack.resize(14, 20);
      image(playerBack, playerPosX, playerPosY);
    } else if (myPlayer.lookingDown) {
      playerFront.resize(14, 20);
      image(playerFront, playerPosX, playerPosY);
    }
    // rect(playerPosX, playerPosY, playerWidth, playerHeight);


    moveVelX = 0;
    moveVelY = 0;


    //240

    if ((wkey && akey) || (akey && skey) || (skey && dkey) || (dkey && wkey)) {
      defaultSpeed = diaSpeed;
    } else defaultSpeed = 5;

    if (myPlayer.shootingUp || myPlayer.shootingDown || myPlayer.shootingRight || myPlayer.shootingLeft) {
      if (currentGun == pistoll)
        pistol.shoot();
        pistol.recharge();
      if (currentGun == machinegun)
        machineGun.shoot();
        machineGun.recharge();
      if (currentGun == shotgun)
        shotGun.shoot();
        shotGun.recharge();
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
    if (key == ' ') spacekey = true;
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
