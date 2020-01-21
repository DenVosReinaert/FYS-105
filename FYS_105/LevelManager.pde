class LevelManager
{
  int lvlNum = 1;
  int lvlCount = 9;
  int tileSize = 100;

  Level1 lvl1 = new Level1();                                  //Initialization of each currently existin level
  Level2 lvl2 = new Level2();
  Level3 lvl3 = new Level3();
  Level4 lvl4 = new Level4();
  Level5 lvl5 = new Level5();
  Level6 lvl6 = new Level6();
  Level7 lvl7 = new Level7();
  Level8 lvl8 = new Level8();
  Level9 lvl9 = new Level9();

  boolean apActive = false;                                    //Set the arrow pointers to inactive;

  PVector apU, apD, apL, apR;                                  //Position vectors for each arrow pointer


  int turretCount = 4;
  Turret[] turrets = new Turret[turretCount];

  int pillarCount = 4;
  Pillar[] pillars = new Pillar[pillarCount];

  void setup()
  {
    lvl1.setup();
    lvl2.setup();
    lvl3.setup();
    lvl4.setup();
    lvl5.setup();
    lvl6.setup();
    lvl7.setup();
    lvl8.setup();
    lvl9.setup();

    apU = new PVector(width/2 - 33/2, 0);                     //Specify the values in the arrowpointer position vectors
    apD = new PVector(width/2 - 33/2, height - 49);
    apL = new PVector(0, height/2 - 38/2);
    apR = new PVector(width - 49, height/2 - 38/2);

    for (int i = 0; i < pillarCount; i++)
    {
      pillars[i] = new Pillar();
    }

    for (int i = 0; i < turretCount; i++)
    {
      turrets[i] = new Turret("regular");
    }
  }

  void draw()
  {

    if (lvlNum < 1)
      lvlNum = 1;


    switch(lvlNum) {                                        //Run the draw function of the level corresponding to the current number of the level
    case 1:
      lvl1.draw();
      break;
    case 2:
      lvl2.draw();
      break;
    case 3:
      lvl3.draw();
      break;
    case 4:
      lvl4.draw();
      break;
    case 5:
      lvl5.draw();
      break;
    case 6:
      lvl6.draw();
      break;
    case 7:
      lvl7.draw();
      break;
    case 8:
      lvl8.draw();
      break;
    case 9:
      lvl9.draw();
      break;
    }

    if (apActive)
    {
      arrowPU.draw(apU.x, apU.y);
      arrowPD.draw(apD.x, apD.y);
      arrowPL.draw(apL.x, apL.y);
      arrowPR.draw(apR.x, apR.y);

      arrowPU.update();
      arrowPD.update();
      arrowPL.update();
      arrowPR.update();

      if ((myPlayer.objPosX + myPlayer.moveVelX < apU.x + 33 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apU.x && myPlayer.objPosY + myPlayer.moveVelY < apU.y + 49 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apU.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apD.x + 33 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apD.x && myPlayer.objPosY + myPlayer.moveVelY < apD.y + 49 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apD.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apL.x + 49 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apL.x && myPlayer.objPosY + myPlayer.moveVelY < apL.y + 38 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apL.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apR.x + 49 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apR.x && myPlayer.objPosY + myPlayer.moveVelY < apR.y + 38 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apR.y))
      {
        spawn.NextWave();                                      //If the player steps onto one of the arrow pointers run the NextWave function in the Spawner class
      }
    }
  }
}
