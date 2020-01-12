class Powerups extends GameObject {

  Timer powerUpLifeTimer = new Timer(10);

  int randomPowerUp;
  int totalPowerUps = 3;

  float tempObjPosX, tempObjPosY;

  //initiales the width and height of the powerups.
  Powerups(float objPosX, float objPosY) {

    powerUpChance = 0.1;

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    objWidth = 20;
    objHeight = 20;

    randomPowerUp = round(random(0, totalPowerUps));

    powerUpLifeTimer.Reset();
  }




  void draw()
  {

    if (powerUpLifeTimer.TimerDone())
      Remove(this);

    switch(randomPowerUp) {
    case 1:
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



    case 2:
      //HEALTH
      healthUp.draw(tempObjPosX, tempObjPosY);
      healthUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        UI.levens ++;
        uhoh.setGain(30);
        uhoh.play();
        uhoh.rewind();
        Remove(this);
      }
      break;



    case 3:
      //SPEEDUP
      speedUp.draw(tempObjPosX, tempObjPosY);
      speedUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        //powerUps.speedUpCollected = true;
        myPlayer.speedUpCollected = true;
        myPlayer.speedUpTimer.Reset();
        speedup.setGain(30);
        speedup.play();
        speedup.rewind();
        Remove(this);
      }
      break;
    }
  }
}





















































//Drops the Speed powerup
//void DropSpeedUp() {
//  pushStyle();
//  fill(0, 200, 0);
//  ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, speedUpX, speedUpY) < speedUpDia) {
//    SpeedUp();
//  }
//}

//Set normalSpeed to 2.1 (Standard value)
//void SpeedUpDone() {
//  //myPlayer.bonusSpeed = 0;
//  myPlayer.normalSpeed = 2.1;
//}

//How the Speed power-up works
//void SpeedUp() {
//  powerUpSpd.Reset();
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.bonusSpeed = 3;
//  } else {
//    myPlayer.bonusSpeed = 0;
//  }
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.normalSpeed = 4.2;
//  } else {
//    SpeedUpDone();
//  }
//}

//Drops the speed power-up
//void DropHealthUp() {
//  pushStyle();
//  fill(200, 0, 0);
//  ellipse(healthUpX, healthUpY, healthUpDia, healthUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, healthUpX, healthUpY) < healthUpDia) {
//    HealthUp();
//  }
//}

//How the Health power-up works
//void HealthUp() {
//  if (UI.levens < 2) {
//    UI.levens ++;
//  }     
//  else if (UI.levens < 3) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 4) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 5) {
//    UI.levens ++;
//  }

//  healthUpX = -100;
//  healthUpY = -100;

//}

//Drops the Shield power-up
//void DropShield() {
//  pushStyle();
//  fill(0, 200, 200);
//  ellipse(shieldX, shieldY, shieldDia, shieldDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, shieldX, shieldY) < shieldDia) {
//    ShieldUp();
//  }
//}









//How the shield power-up works
//void Shield............() {
//  //Shield in working
//  for (int i = 0; i <10; i++) {
//    UI.shield ++;
//    if (UI.shield > 2) {
//      UI.shield = 2;
//    }
//  }
//}
