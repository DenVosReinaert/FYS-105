class Game_Manager {
  boolean dead;
  ArrayList<Enemies> AI;

  Game_Manager() {
    AI= new ArrayList<Enemies>(30);
  }

  void draw() {
    if (mainmenu) {
      game = false;
      dead = false;
    }
    if (game) {
      bengine.draw();
      ascore.draw();
      healthbar.draw();
      spawn.spawnerShow();
      spawn.spawnerUpdate();

      int i = AI.size()-1;
      while (i >= 0) {
        print(AI);
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
    if (dead) {
      gameover.keyPressed();
    }
    if (game) {
      bengine.keyPressed();
    }
  }
  void keyReleased() {
    if (game) {
      bengine.keyReleased();
    }
  }
}
