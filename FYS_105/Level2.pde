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
    image(background, 0, 0);
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
  }
}
