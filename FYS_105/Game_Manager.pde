class Game_Manager {
  boolean dead;
  boolean home;
  boolean hscore;
  boolean shake;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  Game_Manager() {
  }

  void draw() {
    if (home) {
      UI.draw();
      game = false;
      dead = false;
      homeSnd.setGain(0);
      if (!homeSnd.isPlaying() ) {
        homeSnd.play();
        homeSnd.rewind();
      }
    }
    if (hscore) {
      if (hscoreA == 0) {
        hscorel = new hScorelijst();
      }
      hscoreA = 1;
      hscorel.draw();
    }

    if (game) {
      
      gameMusic.setGain(0);
      if(!gameMusic.isPlaying()){
      gameMusic.play();
      gameMusic.rewind();
      }
      
      if (UI.levens <= 0) {
        gamemngr.dead = true;
      }

      homeSnd.pause();

      lvlMngr.lvlNum = 1;

      ascore.draw();

      spawn.draw();
    }





    if (dead) {
      game = false;
      gameover.draw();
    }
  }
  void screenShake() {
    translate(-shakeAmount, shakeAmount);
    shake = false;
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
      myPlayer.keyPressed();
    }
    if (home) {
      UI.keyPressed();
    }
  }
  void keyReleased() {
    if (game) {
      myPlayer.keyReleased();
    }
  }
}
