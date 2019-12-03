class Player extends GameObject {

  Player() {
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    w = 35;
    h = 35;
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
    
    if (bengine.onekey) {
      myGun = new Pistol();
      bengine.onekey = false;
    }
    
    else if (bengine.twokey) {
      myGun = new MachineGun();
      bengine.twokey = false;
    }
    
    else if (bengine.threekey) {
      myGun = new Shotgun();
      bengine.threekey = false;
    }
    
    dx = 0;
    dy = 0;

    if (bengine.akey) {
      dx = -5;
    }
    
    if (bengine.dkey) {
      dx = 5;
    }
    if (bengine.wkey) {
      dy = -5;
    }
    if (bengine.skey) {
      dy = 5;
    }
    if (bengine.spacekey) {
      myGun.shoot();      
    }
      x = x + dx;
      y = y + dy;
      myGun.recharge();
    }
  }
