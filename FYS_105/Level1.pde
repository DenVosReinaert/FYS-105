class Level1
{

  int tileSize = 100;

  int pillarCount = 4;
  int pillarInterval = tileSize * 2;
  Pillar[] pillars = new Pillar[pillarCount];

  int xLoc, yLoc;

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
    myPlayer.draw();
    Layer3();
  }


  void Layer1()
  {
    //flowerpath on 2,4,8,10 X && 2,6 Y 
    //GardenPath
    pushMatrix();

    gardenPathK.resize(width, height);
    image(gardenPathK, 0, 0);


    popMatrix();

    //Pathing left to right
    for (int i = 0; i < 13; i++)
    {
      //Left to Right
      image(gardenPathC, -10 + tileSize * i, -90 + tileSize * 3);

      image(gardenPathD, -10 + tileSize * i, -90 + tileSize * 5);
    }

    for (int j = 0; j < 8; j ++)
    {
      //Top to Bottom
      image(gardenPathB, -10 + tileSize * 5, -90 + tileSize * j);
      image(gardenPathA, -10 + tileSize * 7, -90 + tileSize * j);
    }





    //Corners Bott
    image(gardenPathI, -10 + tileSize * 5, -90 + tileSize * 5);
    image(gardenPathJ, -10 + tileSize * 7, -90 + tileSize * 5);

    //Corners Top
    image(gardenPathH, -10 + tileSize * 5, -90 + tileSize * 3);
    image(gardenPathG, -10 + tileSize * 7, -90 + tileSize * 3);
  }


  void Layer2()
  {  
    for (int i = 0; i < 13; i ++)
    {
      image(gardenPathE, -10 + tileSize * i, -90 + tileSize * 4);
    }
    for (int j = 0; j < 8; j++)
    {
      image(gardenPathE, -10 + tileSize * 6, -90 + tileSize * j);
    }


    gardenPathFlowerPatch.draw(-10 + tileSize * 2, -90 + tileSize * 2);
    gardenPathFlowerPatch.update();
  }



  void Layer3()
  {
    //image(background, 0, 0);

    //Pillars
    //for (int i = 0; i < pillarCount; i++)
    //{
    //  pillars[i] = new Pillar();
    //  pillars[i].draw(-10 + tileSize * 3 + i * pillarInterval + pillars[i].pillarWidth * i, -90 + tileSize * 2);
    //}

    //for (int j = 0; j < pillarCount; j++)
    //{
    //  pillars[j] = new Pillar();
    //  pillars[j].draw(-10 + tileSize * 3 + j * pillarInterval + pillars[j].pillarWidth * j, -90 + tileSize * 5);
    //}
  }
}
