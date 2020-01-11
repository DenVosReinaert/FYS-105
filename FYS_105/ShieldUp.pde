class ShieldUp extends Powerups
{
  Timer powerUpLifeTimer = new Timer(10);


  ShieldUp(float objPosX, float objPosY)
  {
    
    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    println("SHIELDUP AT THIS LOCATION: " + tempObjPosX + " " + tempObjPosY);



    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    pushStyle();
    fill(0, 0, 200);
    ellipse(tempObjPosX, tempObjPosY, objWidth, objHeight);
    popStyle();

    if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
    {
      UI.shield ++;
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
  }
}
