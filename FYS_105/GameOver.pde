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
  char letters[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

  GameOver() {
  }

  void draw() {
    clear();
    if (gamemngr.dead) {
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
      textSize(80);
      fill(200);
      text(""+letter1, xPos1, height/2 - 20);
      text(""+letter2, xPos2, height/2 - 20);
      text(""+letter3, xPos3, height/2 - 20);
      text(""+letter4, xPos4, height/2 - 20);
      textSize(15);
      text("Press ENTER to save name!", width/2 - 100, height/2 + 50);
    }
  }

  void keyPressed() {
    if (gamemngr.dead) {
      if (key == '\n') {
        // If button ^ pressed then save all letters into ascore.name & run function ascore.saveScore
        ascore.name = str(letters[l1s]) + str(letters[l2s]) + str(letters[l3s]) + str(letters[l4s]);
        ascore.saveScore();
        // Reset everything back to how the game was in the beginning
        UI.levens = 3;
        gamemngr.hscoreA = 0;
        l1s = 0;
        l2s = 0;
        l3s = 0;
        l4s = 0;
        spawn.timer = 0;
        ascore.score = 0;
        // print(UI.levens);
        gamemngr.dead = false;
        gamemngr.hscore = true;
      }
    }
    // Check what state & depending on state move through the letters upwards 
    if (key == 'w') {
      if (state == 1 && l1s < 25) {
        l1s++;
      }
      if (state == 1 && l1s > 24 ) {
        l1s = 0;
      }
      if (state == 2 && l2s < 25) {
        l2s++;
      }
      if (state == 2 && l2s > 24) {
        l2s = 0;
      }
      if (state == 3 && l3s < 25) {
        l3s++;
      }
      if (state == 3 && l3s > 24) {
        l3s = 0;
      }
      if (state == 4 && l4s < 25) {
        l4s++;
      }
      if (state == 4 && l4s > 24) {
        l4s = 0;
      }
    } 
    // Check what state & depending on state, lower state (move left)
    if (key == 'a') {
      if (state > 1) {
        state--;
      }
    }
    // Check what state & depending on state, make state higher (move right)
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
        l1s = 25;
      }
      if (state == 2 && l2s > -1) {
        l2s--;
      }
      if (state == 2 && l2s < 0) {
        l2s = 25;
      }
      if (state == 3 && l3s > -1) {
        l3s--;
      }
      if (state == 3 && l3s < 0) {
        l3s = 25;
      }
      if (state == 4 && l4s > -1) {
        l4s--;
      }
      if (state == 4 && l4s < 0) {
        l4s = 25;
      }
    }
  }
}
