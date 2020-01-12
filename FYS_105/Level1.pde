class Level1
{

  int tileSize = 100;

  int pillarCount = 4;
  int pillarInterval = tileSize * 2;
  Pillar[] pillars = new Pillar[pillarCount];


  void setup()
  {    
    for (int i = 0; i < pillarCount; i++)
    {
      pillars[i] = new Pillar();
    }
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
    flowerPatch.draw(-60 + tileSize * 1.5, -40 + tileSize * 2 + 8);
    flowerPatch.draw(-60 + tileSize * 1.5, -40 + tileSize * 5 - 8);
    flowerPatch.draw(-60 + tileSize * 8.5, -40 + tileSize * 2 + 8);
    flowerPatch.draw(-60 + tileSize * 8.5, -40 + tileSize * 5 - 8);
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

    pillars[0].draw(-60 + tileSize * 3, -40 + tileSize * 1.5);
    pillars[1].draw(-60 + tileSize * 10, -40 + tileSize * 1.5);
    pillars[2].draw(-60 + tileSize * 3, -40 + tileSize * 4.5 - 16);
    pillars[3].draw(-60 + tileSize * 10, -40 + tileSize * 4.5);
  }
}
