class Level1
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
    //image(background, 0, 0);

    //Pillars

    lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5);
    lvlMngr.pillars[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 1.5);
    lvlMngr.pillars[2].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 4.5 - 16);
    lvlMngr.pillars[3].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 4.5 - 16);
  }
}
