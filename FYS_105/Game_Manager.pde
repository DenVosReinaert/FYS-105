class Game_Manager {
  boolean dead;

  Game_Manager() {
  }

  void draw() {
    if (game) {
      map.mapDraw();

      ascore.draw();
      thePlayer.move();
      thePlayer.display();
    }
    //if (dead) {
    //  game = false;
    //}
  }
}
