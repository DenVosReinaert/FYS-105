// TE4M
// Quinn Koene


class GameOver {

  // char containing the letter on screen
  char letter1;
  char letter2;
  char letter3;
  char letter4;

  // All x positions of the letters
  int xPos1;
  int xPos2;
  int xPos3;
  int xPos4;

  int state = 1;
  // All letter states based on where they are in line
  int l1s;
  int l2s;
  int l3s;
  int l4s;


  // Array containing all available letters
  char letters[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

  //int bN;
  //int bList;
  //String blacklist[] = new String[bList];
  //String word;

  GameOver() {
    // Attempt blacklist, not working yet!
    //if (msql.connect() && bN < 10) { // Als geconnect is met database & Ans kleiner is dan 10
    //  msql.query( "SELECT * FROM blacklist");
    //  while ( msql.next() && bN < 10) {
    //    word = msql.getString("word"); // string name is 'name' uit database
    //    blacklist = append(blacklist, word); // Voeg name toe aan de array names
    //    bList++;
    //    bN++;
    //  }
    //} else { 
    //  println("ERROR: Couldn't fetch blacklist!");
    //}
  }

  void draw() {
    clear();
    if (gamemngr.dead) {
      gameMusic.pause();
      gameMusic.rewind();
      // Remove all enemies!
      for (int i = 0; i < GameObjectRef.gameObject.size(); i++)
      {
        GameObjectRef.gameObject.get(i).hp = 0;
        GameObjectRef.Remove(GameObjectRef.gameObject.get(i));
      }
      // Turn everything off!
      myPlayer.shootingRight = false;
      myPlayer.shootingLeft = false;
      myPlayer.shootingUp = false;
      myPlayer.shootingDown = false;
      myPlayer.lookingLeft = false;
      myPlayer.lookingRight = false;
      myPlayer.lookingUp = false;
      myPlayer.lookingDown = true;

      death.play();

      // The dot under the letters depending on which state they are
      if (state == 1) {
        circle(width/2-135, height/2 + 20, 10);
      }
      if (state == 2) {
        circle(width/2 - 55, height/2 + 20, 10);
      }
      if (state == 3) {
        circle(width/2 + 25, height/2 + 20, 10);
      }
      if (state == 4) {
        circle(width/2 + 105, height/2 + 20, 10);
      }

      // Make all letters writable (So you can write them with text)
      letter1 = letters[l1s]; 
      letter2 = letters[l2s];
      letter3 = letters[l3s];
      letter4 = letters[l4s];

      // Aline the letters I & J in the middle
      if (letter1 == 'I' || letter1  == 'J') {
        xPos1 = width/2-145;
      } else {
        xPos1 = width/2-160;
      }
      if (letter2 == 'I' || letter2 == 'J') {
        xPos2 = width/2 - 65;
      } else {
        xPos2 = width/2 - 80;
      }
      if (letter3 == 'I' || letter3 == 'J') {
        xPos3 = width/2 + 15;
      } else {
        xPos3 = width/2;
      }
      if (letter4 == 'I' || letter4 == 'J') {
        xPos4 = width/2 + 95;
      } else {
        xPos4 = width/2 + 80;
      }

      // Draw all letters on screen
      pushStyle();
      textSize(80);
      fill(200);
      text(""+letter1, xPos1, height/2 - 20);
      text(""+letter2, xPos2, height/2 - 20);
      text(""+letter3, xPos3, height/2 - 20);
      text(""+letter4, xPos4, height/2 - 20);
      textSize(15);
      text("Press ENTER to save name!", width/2 - 100, height/2 + 50);
      popStyle();
    }
  }

  void keyPressed() {
    if (gamemngr.dead) {
      if (key == '\n') {
        ascore.name = str(letters[l1s]) + str(letters[l2s]) + str(letters[l3s]) + str(letters[l4s]);
        // If button ^ pressed then save all letters into ascore.name & run function ascore.saveScore
        //  for (int i = 0; i < bN; i++) {
        // if (ascore.name != blacklist[i] ) { Attempt for blacklist, not working yet!
        ascore.saveScore();

        Reset();
        //NEEDS UPDATING
        // Reset everything back to how the game was in the beginning

        //  } else {
        // text("Try again..", width/2-150, height/8);
        //  }
        //}
      }
    }
    // Check what state & depending on state move through the letters upwards 
    if (key == 'w') {
      if (state == 1 && l1s < 36) {
        l1s++;
      }
      if (state == 1 && l1s > 35 ) {
        l1s = 0;
      }
      if (state == 2 && l2s < 36) {
        l2s++;
      }
      if (state == 2 && l2s > 35) {
        l2s = 0;
      }
      if (state == 3 && l3s < 36) {
        l3s++;
      }
      if (state == 3 && l3s > 35) {
        l3s = 0;
      }
      if (state == 4 && l4s < 36) {
        l4s++;
      }
      if (state == 4 && l4s > 35) {
        l4s = 0;
      }
    } 
    // Check what state & depending on state, lower state
    if (key == 'a') {
      if (state > 1) {
        state--;
      }
    }
    // Check what state & depending on state, make state higher
    if (key == 'd') {
      if (state < 4) {
        state++;
      }
    }
    // Check what state & depending on state move through the letters downwards 
    if (key == 's') {
      if (state == 1 && l1s > -1) {
        l1s--;
      }
      if (state == 1 && l1s < 0) {
        l1s = 36;
      }
      if (state == 2 && l2s > -1) {
        l2s--;
      }
      if (state == 2 && l2s < 0) {
        l2s = 36;
      }
      if (state == 3 && l3s > -1) {
        l3s--;
      }
      if (state == 3 && l3s < 0) {
        l3s = 36;
      }
      if (state == 4 && l4s > -1) {
        l4s--;
      }
      if (state == 4 && l4s < 0) {
        l4s = 36;
      }
    }
  }

  void Reset()
  {
    ascore.combo = 1;
    UI.levens = 3;
    gamemngr.hscoreA = 0;

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    Pistol.pause();
    Shotgun.pause();
    LMG.pause();

    UI.ammoM1 = 5;
    UI.magM1 = 30;
    UI.maxM1 = 300;
    UI.ammoP = 5;
    UI.ammoS1 = 5;
    UI.maxS1 = 20;
    UI.ammoP = 5;

    Pistol.rewind();
    Shotgun.rewind();
    LMG.rewind();

    l1s = 0;
    l2s = 0;
    l3s = 0;
    l4s = 0;
    ascore.score = 0;
    spawn.wave = 1;
    // print(UI.levens);
    gamemngr.dead = false;
    gamemngr.hscore = true;

    myPlayer.collLeft = false;
    myPlayer.collRight = false;
    myPlayer.collTop = false;
    myPlayer.collBott = false;

    myPlayer.akey = false;
    myPlayer.dkey = false;
    myPlayer.wkey = false;
    myPlayer.skey = false;
  }
}
