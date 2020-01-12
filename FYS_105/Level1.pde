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
    //flowerpath on 2,4,8,10 X && 2,6 Y 
    //GardenPath
    pushStyle();

    gardenPathK.resize(width, height);
    image(gardenPathK, 0, 0);


    popStyle();

    //Pathing left to right
    for (int i = 0; i < 14; i++)
    {
      //Left to Right
      image(gardenPathC, -60 + tileSize * i, -40 + tileSize * 3);

      image(gardenPathD, -60 + tileSize * i, -40 + tileSize * 4);
    }

    for (int j = 0; j < 8; j ++)
    {
      //Top to Bottom
      image(gardenPathB, -60 + tileSize * 6, -40 + tileSize * j);
      image(gardenPathA, -60 + tileSize * 7, -40 + tileSize * j);
    }





    //Corners Bott
    image(gardenPathI, -60 + tileSize * 6, -40 + tileSize * 4);
    image(gardenPathJ, -60 + tileSize * 7, -40 + tileSize * 4);

    //Corners Top
    image(gardenPathH, -60 + tileSize * 6, -40 + tileSize * 3);
    image(gardenPathG, -60 + tileSize * 7, -40 + tileSize * 3);
  }


  void Layer2()
  {  
    for (int i = 0; i < 2; i ++)
    {

      for (int j = 0; j < 6; j++)
      {
        image(gardenPathF, -60 + tileSize * j, i * (-40 + tileSize * 7));
      }
    }


    gardenPathFlowerPatch.draw(-60 + tileSize * 2, -40 + tileSize * 2);
    gardenPathFlowerPatch.draw(-60 + tileSize * 2, -40 + tileSize * 5);
    gardenPathFlowerPatch.draw(-60 + tileSize * 11, -40 + tileSize * 2);
    gardenPathFlowerPatch.draw(-60 + tileSize * 11, -40 + tileSize * 5);

    gardenPathFlowerPatch.draw(-60 + tileSize * 4, -40 + tileSize * 2);
    gardenPathFlowerPatch.draw(-60 + tileSize * 4, -40 + tileSize * 5);
    gardenPathFlowerPatch.draw(-60 + tileSize * 9, -40 + tileSize * 2);
    gardenPathFlowerPatch.draw(-60 + tileSize * 9, -40 + tileSize * 5);
    gardenPathFlowerPatch.update();
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
    pillars[2].draw(-60 + tileSize * 3, -40 + tileSize * 4.5);
    pillars[3].draw(-60 + tileSize * 10, -40 + tileSize * 4.5);
  }
}
