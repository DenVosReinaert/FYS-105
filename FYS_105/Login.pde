// TE4M
// Quinn Koene


class Login {

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

  Login() {
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
    login.resize(width, height);
    image(login, 0, 0);
    // Turn everything off!
    myPlayer.shootingRight = false;
    myPlayer.shootingLeft = false;
    myPlayer.shootingUp = false;
    myPlayer.shootingDown = false;
    myPlayer.lookingLeft = false;
    myPlayer.lookingRight = false;
    myPlayer.lookingUp = false;
    myPlayer.lookingDown = true;

    // The dot under the letters depending on which state they are
    if (state == 1) {
<<<<<<< HEAD
      //circle(width/2-135, height/2 + 20, 10);
    }
    if (state == 2) {
      //circle(width/2 - 55, height/2 + 20, 10);
    }
    if (state == 3) {
      //circle(width/2 + 25, height/2 + 20, 10);
    }
    if (state == 4) {
=======
      image(arrow, width/2-125, height/2 - 100);
      //circle(width/2-135, height/2 + 20, 10);
    }
    if (state == 2) {
      image(arrow, width/2-45, height/2 - 100);
      //circle(width/2 - 55, height/2 + 20, 10);
    }
    if (state == 3) {
      image(arrow, width/2 + 35, height/2 - 100);
      //circle(width/2 + 25, height/2 + 20, 10);
    }
    if (state == 4) {
      image(arrow, width/2 + 115, height/2 - 100);
>>>>>>> parent of 6a5fb24... zucht
      //circle(width/2 + 105, height/2 + 20, 10);
    }

    // Make all letters writable (So you can write them with text)
    letter1 = letters[l1s]; 
    letter2 = letters[l2s];
    letter3 = letters[l3s];
    letter4 = letters[l4s];


    // Aline the letters in the middle

    xPos1 = width/2-120;
    xPos2 = width/2 - 40;
    xPos3 = width/2 + 40;
    xPos4 = width/2 + 120;

    // Draw all letters on screen
    pushStyle();
    textSize(80);
    textAlign(CENTER);
    fill(200);
    text(""+letter1, xPos1, height/2 - 20);
    text(""+letter2, xPos2, height/2 - 20);
    text(""+letter3, xPos3, height/2 - 20);
    text(""+letter4, xPos4, height/2 - 20);
<<<<<<< HEAD
    textSize(15);
    text("PRESS START TO LOG IN", width/2, height/2 + 50);
=======
>>>>>>> parent of 6a5fb24... zucht
    popStyle();
  }

  void keyPressed() {
    if (gamemngr.login) {
      if (key == '\n') {
        ascore.name = str(letters[l1s]) + str(letters[l2s]) + str(letters[l3s]) + str(letters[l4s]);
<<<<<<< HEAD
        println("name: " + ascore.name);
        User.idCheck();
        println("ID: " + User.currentUser);
        Friends.totalFriends();
        Friends.totalPlayers();
=======
        User.idCheck();
        //Friends.totalFriends();
        //Friends.totalPlayers();
>>>>>>> parent of 6a5fb24... zucht
        // If button ^ pressed then save all letters into ascore.name & run function ascore.saveScore
        //  for (int i = 0; i < bN; i++) {
        // if (ascore.name != blacklist[i] ) { Attempt for blacklist, not working yet!
        gamemngr.login = false;     
        gamemngr.home = true;
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
}
