class Game_Manager {
  boolean dead;
  ArrayList<Enemies> AI;
  boolean home;
  boolean hscore;
  int hscoreA;
  
    int timer = 0;
    int sectime =0;
  int mintime = 0;

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
      homeSnd.pause();

      if (timer > 59) {
        timer = 0;
        sectime += 1;
      }
      if (mintime > 59) {
       sectime = 0;
       mintime += 1;
      }
      timer++;
     // fill(0);
     // text("" + mintime + ":" + sectime, width/20, height/10);

      lvlMngr.lvlNum = 1;

      bengine.draw();
      ascore.draw();
      healthbar.draw();

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
}
