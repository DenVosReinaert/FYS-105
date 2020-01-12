class Level2
{
  void setup()
  {
  }


  void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  void Layer2()
  {
  }

  void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 1, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize);
  }
}
