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
  int clipM1 = 6;
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
        clipM1--;
      }
      if (myPlayer.currentGun == myPlayer.machinegun) {
        if (magM1 == 0 && maxM1 > 0) {
          reloadM1--;
          if (reloadM1 <= 0) {
            magM1 = 30;
            maxM1 -= 30;
            clipM1 = 6;
            AR1Reload.rewind();
            reloadM1 = 240;
          }
        }
      }

      if (myPlayer.currentGun == myPlayer.machinegun) {
        textSize(20);
        text(""+ maxM1, ammoX, ammoY *2.2);
      }
      // MachineGun ammo (draw the six yellow lines left top)
      if (clipM1 > 0 && myPlayer.currentGun == myPlayer.machinegun) { 
        image(bullet, ammoX, ammoY + (ammoY /2));
        if (clipM1 > 1 && myPlayer.currentGun == myPlayer.machinegun) {
          image(bullet, ammoX + ammoXs, ammoY + (ammoY /2));
          if (clipM1 > 2 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 2), ammoY + (ammoY /2));
          }
          if (clipM1 > 3 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 3), ammoY + (ammoY /2));
          }
          if (clipM1 > 4 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 4), ammoY + (ammoY /2));
          }
          if (clipM1 > 5 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 5), ammoY + (ammoY /2));
          }
        }
      }

      // MachineGun ammo (draw the five yellow lines under the other ones)
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
      //tutorial();
      pushStyle();
      main.resize(width, height);
      // show line under buttons depending what state is
      image(main, 0, 0);
      textSize(31);
      text("TUTORIAL", 563, 150);
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
      if (state == 5) {
        fill(200);
        rect(563, 150, 153, 5);
        // rect(640, 525, 145, 5); // IF RECTMODE(CENTER)
      }
      popStyle();
    }

    chieves.draw();
  }

  //void tutorial() {
  //  if (gamemngr.tutorialVideo) {
  //    println("frame rate: " + tutorial.frameRate);
  //    tutorial.frameRate(1);
  //    homeSnd.pause();
  //    tutorial.play();
  //    if (keyCode == ENTER) {
  //      gamemngr.tutorialVideo = false;
  //      tutorial.stop();
  //      homeSnd.play();
  //    }
  //  }
  //}

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
      if (key == 's' && state <= 3) {
        state = 4;
      }
      if (key == 'w' && state == 4) {
        state = 2;
      }
      //stat 5 for tutorial
      if (key == 'w' && state <= 3) {
        state = 5;
      }
      if (key == 's' && state == 5) {
        state = 2;
      }
      if (key == 'w' && state == 4) {
        state = 2;
      }

      if (keyCode == RIGHT) {
        if (state == 1) { // Stats button
          gamemngr.statspage = true;
        }
        if (state == 4) { // Credits button
          gamemngr.creditspage = true;
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
        // Tutorial button
        //if (state == 5) { 
        //  gamemngr.tutorialVideo = true;
        //}
      }
    }
  }
}
