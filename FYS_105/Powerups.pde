// Reno Bisschop
class Powerups extends GameObject {

  Timer powerUpLifeTimer = new Timer(10);  //How long the powerup will stay on the the screen

  int randomPowerUp;
  int totalPowerUps = 4;

  float tempObjPosX, tempObjPosY;

  //initializes the width and height of the powerups.
  Powerups(float objPosX, float objPosY) { 

    powerUpChance = 2;

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    objWidth = 20;
    objHeight = 20;

    randomPowerUp = round(random(0.5, totalPowerUps+0.5));  //Sets the randomPowerUp to a random number

    powerUpLifeTimer.Reset();
  }

  void draw()
  {

    if (powerUpLifeTimer.TimerDone()) {
      Remove(this);
    }

    //4 possible powerups that can drop when an enemy dies.
    switch(randomPowerUp) {
    case 1:
      //SPEEDUP
      speedUp.draw(tempObjPosX, tempObjPosY);
      speedUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {

        myPlayer.speedUpCollected = true;
        myPlayer.speedUpTimer.Reset();
        speedup.setGain(30);
        speedup.play();
        speedup.rewind();
        Remove(this);
      }
      break;

    case 2:
      //HEALTH
      healthUp.draw(tempObjPosX, tempObjPosY);
      healthUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        UI.levens ++;
        Remove(this);
      }
      break;

    case 3:
      //SHIELDS
      shieldUp.draw(tempObjPosX, tempObjPosY);
      shieldUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {    
        UI.shield ++;
        shieldup.setGain(30);
        shieldup.play();
        shieldup.rewind();
        Remove(this);
      }
      break;

    case 4:
      //MULTIPLIER
      multiplierUp.draw(tempObjPosX, tempObjPosY);
      multiplierUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        ascore.combo *= 2;
        Remove(this);
      }
    }
  }
}
