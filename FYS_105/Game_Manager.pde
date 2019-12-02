class Game_Manager {
  boolean dead;
  boolean home;
  boolean hscore;
  int hscoreA;

  Game_Manager() {
  }

  void draw() {
    if (home) {
      UI.draw();
      game = false;
      dead = false;
    }
    if (hscore) {
      if (hscoreA == 0) {
        hscorel = new hScorelijst();
      }
      hscoreA = 1;
      hscorel.draw();
    }
    if (game) {
      bengine.draw();
      ascore.draw();
      healthbar.draw();
    }
    if (dead) {
      game = false;
      gameover.draw();
    }
  }
  void keyPressed() {
    if (hscore) {
      if (key == 'r') {
        hscore = false;
        home = true;
      }
    }
    if (dead) {
      gameover.keyPressed();
    }
    if (game) {
      bengine.keyPressed();
    }
    if (home) {
      UI.keyPressed();
    }
  }
  void keyReleased() {
    if (game) {
      bengine.keyReleased();
    }
  }
}
