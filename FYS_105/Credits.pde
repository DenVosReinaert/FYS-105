class Credits {
  void draw() {
      statsBg.resize(width, height);
      image(statsBg, 0, 0);
  }
  void keyReleased() {
    if (gamemngr.creditspage) {
      if (keyCode == DOWN) {
        gamemngr.creditspage = false;
        gamemngr.home = true;
      }
    }
  }
}
