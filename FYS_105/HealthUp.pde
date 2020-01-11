class HealthUp extends Powerups
{

  Timer powerUpLifeTimer = new Timer(10);

  HealthUp(float objPosX, float objPosY)
  {

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;



    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    pushStyle();
    fill(0, 200, 0);
    ellipse(tempObjPosX, tempObjPosY, objWidth, objHeight);
    popStyle();

    if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
    {
      UI.levens ++;
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
  }
}
