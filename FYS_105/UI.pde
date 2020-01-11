// TE4M
// Quinn Koene

class UI {
  int state = 2;
  //boolean controls;
<<<<<<< Updated upstream
  //int timer = 0;
=======
  Timer hitStun = new Timer(1);
  boolean ableToBeHit = true;
  // Healthbar
  int levens = 3; // Standard amount of lives
  int shield = 0;
  int lX1 = width/35;
  int lX2 = lX1 + 6;
  int lY1 = height/35;
  int lY2 = lY1 + 10;
  int hitValue;

  // ammo machinegun
  int ammoM1 = 5;
  int magM1 = 30;
  int maxM1 = 300;
  int reloadM1 = 240;
  
  // ammo LMG
  int ammoLM1=5;
  int magLM1=100;
  int maxLM1=600;
  int reloadLM=400;
  
  // ammo Minigun
  int ammoMN1=10;
  int magLMN=250;
  int maxLMN=1500;
  int reloadMN=650;

  // ammo shotgun
  int ammoS1 = 5;
  int maxS1 = 20;
  int reloadS1 = 240;
  
  // ammo DubbleBarrelShotgun
  int ammoDBS = 1;
  int maxDBS = 40;
  int reloadDBS = 120;
  
  // ammo DubbleBarrelShotgun
  int ammoAS = 6;
  int magAS= 32;
  int maxAS = 192;
  int reloadAS = 345;

  // Ammo Pistol
  int ammoP = 5;
  int ammoX = width/30;
  int ammoY = height/12;
  int ammoXs = 6;
  int ammoYs = 15;
  int reloadP = 60;

  int gun = 1;
>>>>>>> Stashed changes

  UI() {
  }
  void draw() {
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
