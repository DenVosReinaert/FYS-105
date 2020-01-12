class stats { 
  int textX = 155;
  int totalFriends;
  int totalPlayers;
  int aPlayers;
  int aFriends;
  String selected;
  String[] players = new String[aPlayers];
  String[] friends = new String[aFriends];
  int cursorPosY = 1;
  int cursorPosY2 = 0;

  void setup() {
  }

  void draw() { 
    if (gamemngr.statspage) {
      if (cursorPosY < 1) {
        cursorPosY = 1;
      }
      if (cursorPosY2 < 1) {
        cursorPosY2 = 1;
      }
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
      } else {
        for (int i = 0; i < totalFriends; i++) {
          textSize(20);
          text("" + friends[i], 900, 220 + (totalFriends * 20 * i/2) );
          pushStyle();
          if (cursorPosY2 < totalPlayers) {
            if (cursorPosY == i) {
              fill(100, 0, 0);
            }
          }
          text("REMOVE", 810, 220 + (totalFriends * 20 * i/2) );
          popStyle();
        }
      }
      for (int i = 0; i < totalPlayers; i++) {
        textSize(20);
        text("" + players[i], 900, (260 + (totalFriends * 30)) + (30 * i));
        pushStyle();
        if (cursorPosY > totalFriends) {
          if (cursorPosY2 == i) {
            fill(0, 200, 0);
            selected = players[i];
          }
        }
        text("ADD", 820, (260 + (totalFriends * 30)) + (30 * i) );
        popStyle();
      }
    }
  }
  void keyPressed() {
    if (gamemngr.statspage) {
      if (keyCode == DOWN) {
        gamemngr.statspage = false;
        gamemngr.home = true;
      }
      if (keyCode == RIGHT) {
        selected = Friends.pName;
        Friends.getID();
        print(Friends.pID);
        print(Friends.pName);
        Friends.addFriend();
      }
      if (key == 'w') {
        if (cursorPosY2 < totalPlayers) {
          cursorPosY--;
        }
        if (cursorPosY > totalFriends) {
          cursorPosY2--;
        }
      }
      if (key == 's') {
        if (cursorPosY2 < totalPlayers) {
          cursorPosY++;
        }
        if (cursorPosY > totalFriends) {
          cursorPosY2++;
        }
      }
    }
  }
}
