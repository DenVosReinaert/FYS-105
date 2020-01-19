//Dylan Vermeulen
class Credits {
  void draw() {
    float garfieldX = 0, garfieldY = height - garfieldS.frameHeight;
    creditsBG.resize(width, height);
    image(creditsBG, 0, 0);
    if (gamemngr.trackNumber == 4) {
      garfieldSansS.update();
      garfieldSansS.draw(garfieldX, garfieldY);
      garfieldSansS.draw(garfieldX + garfieldS.frameWidth * 2, garfieldY);
    } else {
      garfieldS.update();
      garfieldS.draw(garfieldX, garfieldY);
      garfieldS.draw(garfieldX + garfieldS.frameWidth * 2, garfieldY);
    }
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
