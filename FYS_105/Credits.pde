class Credits {

  void draw() {
    // the x and y position for the garfield sprites
    float garfieldX = 0, garfieldY = height - garfieldS.frameHeight;
    creditsBG.resize(width, height);
    image(creditsBG, 0, 0); // the background with our names
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
    // this is so you can go back to the main menu
    if (gamemngr.creditspage) {
      if (keyCode == DOWN) {
        gamemngr.creditspage = false;
        gamemngr.home = true;
      }
    }
  }
}
