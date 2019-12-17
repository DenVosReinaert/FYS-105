// TE4M
// Quinn Koene

class UI {
  int state = 2;
  //boolean controls;
  //int timer = 0;

  // Healthbar
  int levens = 3; // Standard amount of lives
  int lX1 = width/35;
  int lX2 = 40;
  int lY1 = height/20;
  int lY2 = 10;


  int ammoM1 = 5;
  int magM1 = 30;
  int maxM1 = 300;
  // Ammo Pistol
  int ammoP = 5;
  int ax = width/40;
  int ay = height/10;
  int axs = 5;
  int ays = 15;
  int reloadP = 120;

  int gun = 1;

  UI() {
  }

  void spelerhit() { // If called, lives -1
    levens--;
  }

  void draw() {

    if (game) {
      // Pistol ammo cooldown
      if (ammoP == 0) {
        reloadP--;
        if (reloadP <= 0) {
          ammoP = 5;
          reloadP = 120;
        }
      }
      // Pistol ammo
      if (ammoP > 0 && gun == 1) {
        fill(226, 197, 1);
        rect(ax, ay, axs, ays);
        if (ammoP > 1 && gun == 1) {
          fill(226, 197, 1);
          rect(ax+6, ay, axs, ays);
          if (ammoP > 2 && gun == 1) {
            fill(226, 197, 1);
            rect(ax+12, ay, axs, ays);
          }
          if (ammoP > 3 && gun == 1) {
            fill(226, 197, 1);
            rect(ax+18, ay, axs, ays);
          }
          if (ammoP > 4 && gun == 1) {
            fill(226, 197, 1);
            rect(ax+24, ay, axs, ays);
          }
        }
      }

      // MachineGun ammo
      if (maxM1 == -30) {
        maxM1 = 0;
      }
      if (ammoM1 <= 0 && magM1 > 0) {
        magM1 -= 5;
        ammoM1 = 5;
      }
      if (magM1 == 0 && maxM1 > 0 && key == 'r') {
        magM1 = 30;
        maxM1 -= 30;
      }

      if (gun == 2) {
        textSize(20);
        text(""+ maxM1, ax, ay+40);
      }
      if (ammoM1 > 0 && gun == 2) {
        fill(226, 197, 1);
        rect(ax, ay, axs, ays);
        if (ammoM1 > 1 && gun == 2) {
          fill(226, 197, 1);
          rect(ax+6, ay, axs, ays);
          if (ammoM1 > 2 && gun == 2) {
            fill(226, 197, 1);
            rect(ax+12, ay, axs, ays);
          }
          if (ammoM1 > 3 && gun == 2) {
            fill(226, 197, 1);
            rect(ax+18, ay, axs, ays);
          }
          if (ammoM1 > 4 && gun == 2) {
            fill(226, 197, 1);
            rect(ax+24, ay, axs, ays);
          }
        }
      }

      // Health
      if (levens > 0) {
        fill(0, 255, 0);
        rect(lX1, lY1, lX2, lY2);
        if (levens > 1) {
          fill(0, 255, 0);
          rect(lX1 + lX2 +lY2, lY1, lX2, lY2);
          if (levens > 2) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*2 +lY2*2), lY1, lX2, lY2);
          }
          if (levens > 3) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*3 +lY2*3), lY1, lX2, lY2);
          }
          if (levens > 4) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*4 +lY2*4), lY1, lX2, lY2);
          }
        }
      }

      if (levens == 0) { // if lives == 0
        gamemngr.dead = true; // set player to dead
      }
    }
    // show depending on boolean
    if (gamemngr.home) {
      main.resize(width, height);
      // show line under buttons depending what state is
      image(main, 0, 0);
      if (state == 1) {
        fill(200);
        rect(276, 480, 280, 5);
      }
      if (state == 2) {
        fill(200);
        rect(640, 486, 300, 5);
      }
      if (state == 3) {
        fill(200);
        rect(1002, 480, 280, 5);
      }
      if (state == 4) {
        fill(200);
        rect(640, 525, 145, 5);
      }
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
      if (key == '\n') {
        if (state == 1) {
        }
        if (state == 4) {
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
