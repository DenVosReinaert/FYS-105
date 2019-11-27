// TE4M
// Quinn Koene

class healthBar {
  int levens = 3; // Standaard aantal levens
  int lX1 = width/35;
  int lX2 = 40;
  int lY1 = height/20;
  int lY2 = 10;

  void spelerhit() { // Als speler geraakt word dan gaan er levens van af
    levens--;
  }

  void draw() {

    if (!ascore.dead) {
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
      if (levens == 0) { // Is het aantal levens 0?
        // highscore = score;// NEW EDIT, dit heette 'score' in mijn versie van begin dus geen idee of dit werkt zo.. // haalt de current highscore erbij
        // highscore.saveScore(); // roept de saveScore functie op
        ascore.dead = true;
        levens = -1; // Zet levens op -1 zodat ie niet continue dit blijft doen :)
      }
    }
    //  highscore = score;
    //  highscore.saveScore();
  }
}
