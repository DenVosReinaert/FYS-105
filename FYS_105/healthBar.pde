// TE4M
// Quinn Koene

class healthBar {
  int levens = 3; // Standard amount of lives
  int lX1 = width/35;
  int lX2 = 40;
  int lY1 = height/20;
  int lY2 = 10;

  aScore ascore;

  void spelerhit() { // If called, lives -1
    levens--;
  }

  void draw() {

    if (game) {
      if (levens > 0) {
        fill(0, 255, 0);
        rect(lX1, lY1, lX2, lY2);
        if (levens > 1) {
          fill(0, 255, 0);
          rect(lX1 + lX2 +lY2, lY1, lX2, lY2);
          if (levens > 2) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*2 +lY2*2), lY1, lX2, lY2);
          }
          if (levens > 3) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*3 +lY2*3), lY1, lX2, lY2);
          }
          if (levens > 4) {
            fill(0, 255, 0);
            rect(lX1 + (lX2*4 +lY2*4), lY1, lX2, lY2);
          }
        }
      }

      if (levens == 0) { // if lives == 0
        gamemngr.dead = true; // set player to dead
      }
    }
  }
}
