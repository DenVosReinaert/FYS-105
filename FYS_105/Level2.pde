<<<<<<< HEAD
=======
//Adriaan Pronk
>>>>>>> parent of 6a5fb24... zucht
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
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
  }
}
