
class Player extends GameObject {

  Gun myGun;

  Player() {
    playerPosX = width/2;
    playerPosY = height/2;
    playerWidth = 16;
    playerHeight = 20;
    myGun = new Pistol();

    //TO DO: als je 1 indrukt: BasicGun();,
    // als je 2 indrukt: MachineGun();,
    // als je 3 indrukt: Shotgun();.
  }

  void show() {
    fill(255, 100, 0);
    rect(playerPosX, playerPosY, 50, 50);
  }

  void act() {

    if (bengine.onekey) {
      myGun = new Pistol();
      bengine.onekey = false;
    } else if (bengine.twokey) {
      myGun = new MachineGun();
      bengine.twokey = false;
    } else if (bengine.threekey) {
      myGun = new Shotgun();
      bengine.threekey = false;
    }
    
    

    if (bengine.akey) {
      if (playerPosX + moveVelX < playerWidth/2)
      {
        moveVelX = 0;
      } else

        moveVelX = -defaultSpeed;
    }

    if (bengine.dkey) {
      if (playerPosX + moveVelX > width - playerWidth/2)
      {
        moveVelX = 0;
      } else 
      moveVelX = defaultSpeed;
    }

    if (bengine.wkey) {
      if (playerPosY + moveVelY < playerHeight/2)
      {
        moveVelY = 0;
      } else 
      moveVelY = -defaultSpeed;
    }

    if (bengine.skey) {
      if (playerPosY + moveVelY > height - playerHeight/2)
      {
        moveVelY = 0;
      } else 
      moveVelY = defaultSpeed;
    }

    //sets the speed of the player to a different speed when moving diagonally so it moves at the same rate as the single axises
    if (bengine.wkey && bengine.akey || bengine.akey && bengine.skey || bengine.skey && bengine.dkey || bengine.dkey && bengine.wkey) {
      defaultSpeed = diaSpeed;
    }

    if (bengine.spacekey) {
      myGun.shoot();
    }

    myGun.recharge();
  }
}
