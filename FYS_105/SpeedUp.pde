class SpeedUp extends Powerups
{
  Timer powerUpLifeTimer = new Timer(10);

  SpeedUp(float objPosX, float objPosY)
  {

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;



    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    pushStyle();
    fill(200, 0, 0);
    ellipse(tempObjPosX, tempObjPosY, objWidth, objHeight);
    popStyle();

    if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
    {
      //powerUps.speedUpCollected = true;
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
  }
}
