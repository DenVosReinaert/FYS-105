// TE4M
// Quinn Koene

class UI {
  int state = 2;
  //boolean controls;
  Timer hitStun = new Timer(0.1);
  boolean ableToBeHit = true;
  // Healthbar
  int levens = 3; // Amount of lives
  int shield = 0; // amount of shield
  int lX1 = width/35;
  int lX2 = lX1 + 6;
  int lY1 = height/35;
  int lY2 = lY1 + 10;
  int hitValue;
  int hitValueShield;

  // ammo machinegun
  int ammoM1 = 5;
  int magM1 = 30;
  int maxM1 = 300;
  int reloadM1 = 240;

  // ammo shotgun
  int ammoS1 = 5;
  int maxS1 = 20;
  int reloadS1 = 240;

  // Ammo Pistol
  int ammoP = 5;
  int ammoX = width/30;
  int ammoY = height/12;
  int ammoXs = 6;
  int ammoYs = 15;
  int reloadP = 120;

  int gun = 1;

  UI() {
    hitValueShield = 0;
    hitValue = 0;
  }

  void spelerhit() { // If called, lives -1
    if (ableToBeHit && hitStun.TimerDone()) {
      shield -= hitValueShield;
      levens -= hitValue;

      hitValueShield = 0;
      hitValue = 0;

      gamemngr.shakeAmount = 15;
      gamemngr.shake = true;
      damage.setGain(10);
      damage.play();
      damage.rewind();
      ableToBeHit = false;
      hitStun.Reset();
    }

    //if (!ableToBeHit && hitStun.TimerDone()) {
    //  ableToBeHit = true;
    //  println("TIMER IS DONE AND BEING RESET!");
    //  hitStun.Reset();
    //}
  }

  void draw() {

    if (game) {

      // the shield won't get above 2
      if (UI.shield >= 2) {
        UI.shield = 2;

        // the shield won't get below 0
        if (UI.shield <= 0) {
          UI.shield = 0;
        }

        // the 'levens' won't get above 5
        if (UI.levens >= 5) {
          UI.levens = 5;
        }
      }

      if (!ableToBeHit && hitStun.TimerDone())
      {
        ableToBeHit = true;
      }


      // Pistol ammo cooldown
      if (myPlayer.currentGun == myPlayer.pistoll) {
        if (ammoP == 0) {
          reloadP--;
          if (reloadP <= 0) {
            ammoP = 5;
            reloadP = 120;
          }
        }
      }
      // Pistol ammo (draw the five yellow lines left top)
      if (ammoP > 0 && myPlayer.currentGun == myPlayer.pistoll) {
        image(bullet, ammoX, ammoY);
        if (ammoP > 1 && myPlayer.currentGun == myPlayer.pistoll) {
          image(bullet, ammoX + ammoXs, ammoY);
          if (ammoP > 2 && myPlayer.currentGun == myPlayer.pistoll) {
            image(bullet, ammoX + (ammoXs * 2), ammoY);
          }
          if (ammoP > 3 && myPlayer.currentGun == myPlayer.pistoll) {
            image(bullet, ammoX + (ammoXs * 3), ammoY);
          }
          if (ammoP > 4 && myPlayer.currentGun == myPlayer.pistoll) {
            image(bullet, ammoX + (ammoXs * 4), ammoY);
          }
        }
      }

      // MachineGun Reload ammo
      if (maxM1 == -30) {
        maxM1 = 0;
      }
      if (ammoM1 <= 0 && magM1 > 0) {
        magM1 -= 5;
        ammoM1 = 5;
      }
      if (myPlayer.currentGun == myPlayer.machinegun) {
        if (magM1 == 0 && maxM1 > 0) {
          reloadM1--;
          if (reloadM1 <= 0) {
            magM1 = 30;
            maxM1 -= 30;
            reloadM1 = 240;
          }
        }
      }

      if (myPlayer.currentGun == myPlayer.machinegun) {
        textSize(20);
        text(""+ maxM1, ammoX, ammoY+40);
      }
      // MachineGun ammo (draw the five yellow lines left top)
      if (ammoM1 > 0 && myPlayer.currentGun == myPlayer.machinegun) { 
        image(bullet, ammoX, ammoY);
        if (ammoM1 > 1 && myPlayer.currentGun == myPlayer.machinegun) {
          image(bullet, ammoX + ammoXs, ammoY);
          if (ammoM1 > 2 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 2), ammoY);
          }
          if (ammoM1 > 3 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 3), ammoY);
          }
          if (ammoM1 > 4 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 4), ammoY);
          }
        }
      }

      // Shotgun ammo cooldown
      if (myPlayer.currentGun == myPlayer.shotgun) {
        if (ammoS1 == 0 && maxS1 > 0) {
          reloadS1--;
          if (reloadS1 <= 0) {
            ammoS1 = 5;
            maxS1 -= 5;
            reloadS1 = 240;
          }
        }
      }
      if (myPlayer.currentGun == myPlayer.shotgun) {
        textSize(20);
        text(""+ maxS1, ammoX, ammoY+40);
      }
      // Shotgun ammo (draw the five yellow lines left top)
      if (ammoS1 > 0 && myPlayer.currentGun == myPlayer.shotgun) {
        image(shotgunS, ammoX, ammoY);
        if (ammoS1 > 1 && myPlayer.currentGun == myPlayer.shotgun) {
          image(shotgunS, ammoX + ammoXs, ammoY);
          if (ammoS1 > 2 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 2), ammoY);
          }
          if (ammoS1 > 3 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 3), ammoY);
          }
          if (ammoS1 > 4 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 4), ammoY);
          }
        }
      }

      // Health
      image(healthbarSb, lX1, lY1);
      image(shieldbarSb, lX1+ (57 * 5), lY1);

      if (levens == 1 && shield == 0) {
        image(healthP, lX2, lY2);
      }
      if (levens == 1 && shield == 1 ) {
        image(healthP, lX2, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }  
      if (levens == 1 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }
      if (levens == 2 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
      }
      if (levens == 2 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 2 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }   
      if (levens == 3 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
      }
      if (levens == 3 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 3 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }   
      if (levens == 4 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
      }
      if (levens == 4 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 4 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }  
      if (levens >= 5 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);
      }
      if (levens >= 5 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens >= 5 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }

      image(healthbarS, lX1, lY1);
      image(shieldbarS, lX1 + (57 * 5), lY1);

      if (levens == 0) { // if lives == 0
        gamemngr.dead = true; // set player to dead
      }
    }
    // Main menu
    // show depending on boolean
    if (gamemngr.home) {
      pushStyle();
      main.resize(width, height);
      // show line under buttons depending what state is
      image(main, 0, 0);
      if (state == 1) {
        fill(200);
        rect(134, 477, 285, 5);
      }
      if (state == 2) {
        fill(200);
        rect(480, 482, 319, 5);
        // rect(640, 486, 300, 5); // IF RECTMODE(CENTER)
      }
      if (state == 3) {
        fill(200);
        rect(860, 477, 285, 5);
        // rect(1002, 480, 280, 5); // IF RECTMODE(CENTER)
      }
      if (state == 4) {
        fill(200);
        rect(563, 522, 153, 5);
        // rect(640, 525, 145, 5); // IF RECTMODE(CENTER)
      }
      popStyle();
    }
    //if (controls) {
    //  controlImg.resize(width, height);
    //  image(controlImg, 0, 0);
    //  print(timer);
    //  timer++;
    //  if (timer > 10 ) {
    //    circle(1162, 698, 3);
    //  }
    //  if (timer > 20) {
    //    circle(1166, 698, 3);
    //  }
    //  if (timer > 30) {
    //    circle(1170, 698, 3);
    //  }
    //  if (timer > 40) {
    //    game = true;
    //    controls = false;
    //    timer = 0;
    //  }
    //}
  }
  void keyPressed() {
    if (gamemngr.home) {
      if (keyCode == DOWN)
      {
        homeSnd.pause();
        homeSnd.rewind();

        if (!loginMusic.isPlaying())
        {
          loginMusic.play();
          loginMusic.rewind();
        }

        gamemngr.home = false;
        gamemngr.hscore = false;
        gamemngr.login = true;
      }
      if (key == 'd' && state < 3) {
        state++;
      }
      if (key == 'a' && state > 1) {
        state--;
      }
      if (key == 's') {
        state = 4;
      }
      if (state == 4 && key == 'w') {
        state = 2;
      }

      if (keyCode == RIGHT) {
        if (state == 1) { // Stats button
          gamemngr.statspage = true;
        }
        if (state == 4) { // Credits button
          // credits = true;
        }
        // if state == 2 (Play button) then start game
        if (state == 2) {
          gamemngr.home = false;
          game = true;
        }
        // if state == 3 (Highscore button) then go to highscore page
        if (state == 3) {
          gamemngr.home = false;
          gamemngr.hscore = true;
        }
      }
    }
  }
}
