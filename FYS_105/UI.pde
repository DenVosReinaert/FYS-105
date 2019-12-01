class UI {
  PImage main; //controlImg;
  int state = 2;
  //boolean controls;
  //int timer = 0;

  UI() {
    //  controlImg = loadImage("/data/img/controls.png");
    main = loadImage("/data/img/LastStand-MainMenu.png");
  }
  void draw() {
    if (gamemngr.home) {
      main.resize(width, height);
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
      if (key == 'e') {
        if (state == 1) {
        }
        if (state == 4) {
         // credits = true;
        }
        if (state == 2) {
          gamemngr.home = false;
          game = true;
        }
        if (state == 3) {
          gamemngr.home = false;
          gamemngr.hscore = true;
        }
      }
    }
  }
}
