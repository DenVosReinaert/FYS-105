class gameMngr {
  PImage backgr;

  gameMngr() {
    backgr = loadImage("./img/mainMenu_backgr.jpg");
    backgr.resize(width, height);
  }

  void draw() {
    if (game) {
      map.mapDraw();

      platformM.draw((width/2 - platformM.sizeX/2) / 1920f * width, ((height/2 + 300f) / 1080f * height));
      highscore.draw();
      thePlayer.draw();
      thePlayer.keyReleased();
      healthbar.draw();
      thePlayer.Move();
      dood = false;
      mainMenu = false;
    }
    if (dood) {
      game = false;
      mainMenu = false;
      background(0);
      textSize(40);
      text("You died", width/2, height/2);
    }
    if (mainMenu) {
      image(backgr, 0, 0);
    }
  }
}
