// Reno Bisschop
class stats { 
  int textX = 155;
  int totalFriends;
  int totalPlayers;
  int aPlayers;
  int aFriends;
  String[] players = new String[aPlayers];
  String[] friends = new String[aFriends];
  int cursorPosY = 0;
  int cursorPosY2 = -1;
  boolean nextEntry, prevEntry, selectEntry;
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
      for (int j = 0; j < players.length; j++) {
        textSize(20);
        text("" + players[j], 900, (255 + (totalFriends * 30)) + (30 * j));
        pushStyle();
        if (cursorPosY2 == j) {
          fill(0, 200, 0);
        }
        text("ADD", 820, (255 + (totalFriends * 30)) + (30 * j) );
        popStyle();
      }

      if (cursorPosY > friends.length)
        cursorPosY = friends.length + 1;
      if (cursorPosY < 0)
        cursorPosY = 0;

      if (cursorPosY2 < -1)
        cursorPosY2 = -1;
      if (cursorPosY2 > players.length)
        cursorPosY2 = players.length;


      println(nextEntry);

      if (nextEntry)
      {
        if (cursorPosY <= friends.length && cursorPosY2 == -1)
        {
          cursorPosY++;
        }
        if ((cursorPosY2 <= players.length && cursorPosY == friends.length + 1))
        {
          cursorPosY2++;
        }
      }

      if (prevEntry)
      {
        if (cursorPosY >= 1 && cursorPosY2 == -1)
        {
          cursorPosY--;
        }
        if (cursorPosY2 >= 0 && cursorPosY == friends.length + 1)
        {
          cursorPosY2--;
        }
      }

      if (selectEntry)
      {
        if (cursorPosY != friends.length + 1 && cursorPosY2 == -1) {
          Friends.getID();
          Friends.removeFriend();
        }
        if (cursorPosY2 != -1 && cursorPosY == friends.length + 1) {
          Friends.getID();
          Friends.addFriend();
        }
      }
    }
  }
  void keyPressed()
  {
    if (gamemngr.statspage)
    {
      switch(keyCode)
      {
      case RIGHT:
        selectEntry = true;
        break;
      }

      switch(key)
      {
      case 's':
        nextEntry = true;
        break;
      case 'w':
        prevEntry = true;
        break;
      }
    }
  }

  void keyReleased() {
    if (gamemngr.statspage) {

      switch(keyCode)
      {
      case RIGHT:
        selectEntry = false;
        break;
      case DOWN:
        gamemngr.statspage = false;
        gamemngr.home = true;
        break;
      }

      switch(key)
      {
      case 's':
        nextEntry = false;
        break;
      case 'w':
        prevEntry = false;
        break;
      }
    }
  }
}
