class Game_Manager {
  boolean dead;
  ArrayList<Enemies> AI;
  boolean home;
  boolean hscore;
  boolean shake;
  int hscoreA;
  int shakeAmount;
  
  Game_Manager() {
    AI= new ArrayList<Enemies>(30);
  }

  void draw() {
    if (home) {
      UI.draw();
      game = false;
      dead = false;
      int time = 0;
      homeSnd.play();
      if (time == 31140 ) {
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
      if (UI.levens <= 0) {
        gamemngr.dead = true;
      }
      homeSnd.pause();

      lvlMngr.lvlNum = 1;

      bengine.draw();
      ascore.draw();

      spawn.spawnerShow();
      spawn.spawnerUpdate();

      int i = AI.size()-1;
      while (i >= 0) {
        // print(AI);
        Enemies enm= AI.get(i);
        enm.enemyShow();
        enm.enemyUpdate();
        enm.checkPulse();
        if (enm.Dead()) {
          AI.remove(i);
        }
        i--;
      }
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
  //screenshake
  void screenShake() {
   translate(-shakeAmount, shakeAmount); 
    shake = false;
  }
}
