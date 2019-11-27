class Player extends GameObject {

  Gun myGun;

  Player() {
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    w = 50;
    h = 50;
    myGun = new Pistol();
    
    //TO DO: als je 1 indrukt: BasicGun();,
    // als je 2 indrukt: MachineGun();,
    // als je 3 indrukt: Shotgun();.
  }

  void show() {
    fill(255, 100, 0);
    rect(x, y, 50, 50);
  }

  void act() {
    
    if (onekey) {
      myGun = new Pistol();
      onekey = false;
    }
    
    else if (twokey) {
      myGun = new MachineGun();
      twokey = false;
    }
    
    else if (threekey) {
      myGun = new Shotgun();
      threekey = false;
    }

    
    dx = 0;
    dy = 0;

    if (akey) {
      dx = -5;
    }
    
    if (dkey) {
      dx = 5;
    }
    if (wkey) {
      dy = -5;
    }
    if (skey) {
      dy = 5;
    }
    if (spacekey) {
      myGun.shoot();      
    }
    
      x = x + dx;
      y = y + dy;
      myGun.recharge();
    }
  }
