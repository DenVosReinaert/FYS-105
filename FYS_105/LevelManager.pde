class LevelManager
{
  int lvlNum = 0;
  Level1 lvl1 = new Level1();
  Level2 lvl2 = new Level2();

  boolean apActive = false;

  PVector apU, apD, apL, apR;

  void setup()
  {
    lvl1.setup();
    lvl2.setup();

    apU = new PVector(width/2 - 33/2, 0);
    apD = new PVector(width/2 - 33/2, height - 49);
    apL = new PVector(0, height/2 - 38/2);
    apR = new PVector(width - 49, height/2 - 38/2);
  }

  void draw()
  {
    switch(lvlNum) {
    case 1:
      lvl1.draw();
      break;
    case 2:
      lvl2.draw();
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
        NextLevel();
        garfield.pause();
      }
    }
  }

  void NextLevel()
  {

    apActive = false;

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    for (int i = 0; i < 1; i++)
    {
      lvlNum = (int) random(0, 3);
    }

    spawn.NextWave();
  }
}
