class stats { 
  int textX = 155;
  int totalFriends;
  int totalPlayers;
  int aPlayers;
  int aFriends;
  String selected;
  String[] players = new String[aPlayers];
  String[] friends = new String[aFriends];
  int cursorPosY = 0;
  int cursorPosY2 = -1;

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
      } else {
        for (int i = 0; i < totalFriends; i++) {
          textSize(20);
          text("" + friends[i], 900, 220 + (totalFriends * 20 * i/2) );
          pushStyle();
          if (cursorPosY == i) {
            fill(100, 0, 0);
          }
          text("REMOVE", 810, 220 + (totalFriends * 20 * i/2) );
          popStyle();
        }
      }
      for (int i = 0; i < totalPlayers; i++) {
        textSize(20);
        text("" + players[i], 900, (260 + (totalFriends * 30)) + (30 * i));
        pushStyle();
        if (cursorPosY2 == i) {
          fill(0, 200, 0);
          selected = players[i];
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
        //if () {
        //  selected = Friends.pName;
        //  Friends.getID();
        //  Friends.removeFriend();
        //}
        //if () {
        //  selected = Friends.pName;
        //  Friends.getID();
        //  Friends.addFriend();
        //}
      }
      if (key == 'w') {
        if (cursorPosY > 0 && cursorPosY < totalFriends-1) {
         cursorPosY--; 
        }
        
      }
      if (key == 's') {
        if (cursorPosY < totalFriends-1) { // if cursorPosY is tinier than totalFriends-1 (stops cursorPosY from moving beyond totalFriends)
          cursorPosY++; // add numbers to cursorPosY
        } else {
          cursorPosY = totalFriends; // Keeps cursorPosY at totalFriends
          cursorPosY2++; // CursorPosY2 goes down towards totalPlayers-1
        }
        if (cursorPosY2 > totalPlayers-1 ) { // if cursorPosY2 is tinier than totalPlayers-1 (stops cursorPosY from moving beyond totalFriends)
          cursorPosY2 = totalPlayers-1; // add number to cursorPosY2
        }
      }
    }
  }
}
