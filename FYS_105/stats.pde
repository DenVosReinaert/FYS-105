class stats { 
  int textX = 155;
  int totalFriends;
  int totalPlayers;
  String[] players;
  String[] friends;

  void setup() {
  }

  void draw() { 
    if (gamemngr.statspage) {
      pushStyle();
      statsBg.resize(width, height);
      image(statsBg, 0, 0);
      textSize(50);
      text("" + ascore.name, 300, textX);
      text("'S", 440, textX);
      text("STATS", 520, textX);
      text("FRIENDS", 810, textX);
      fill(28, 28, 28);
      rect(781, 192, 259, 30 + (totalFriends * 30));
      rect(781, 229 + (totalFriends * 30), 259, 397 - (totalFriends * 30));
      popStyle();
      if (totalFriends <= 0) {
        textSize(20);
        text("NO FRIENDS FOUND", 810, 215);
      } 
    }
  }
  void keyReleased() {
    if (gamemngr.statspage) {
      if (keyCode == DOWN) {
        gamemngr.statspage = false;
        gamemngr.home = true;
      }
    }
  }
}
