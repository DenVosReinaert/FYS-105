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

      lvlMngr.lvlNum = 1;

      ascore.draw();
      healthbar.draw();

      spawn.draw();
      //if (GameObjectRef.gameObject.size() >= 1)
      //{
      //  int i = GameObjectRef.gameObject.size()-1;
      //  while (i >= 0) {
      //    // print(AI);
      //    if (GameObjectRef.gameObject.get(i).tag == "enemy")
      //    {
      //      GameObjectRef.gameObject.get(i).draw();
      //    }
      //    //enm.checkPulse();
      //    if (GameObjectRef.gameObject.get(i).Dead()) {
      //      GameObjectRef.gameObject.remove(i);
      //    }
      //    i--;
      //  }
      //}
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
