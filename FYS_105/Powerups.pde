class Powerups extends GameObject {

  Timer powerUpLifeTimer = new Timer(4);
  Timer powerUpEffectTimer = new Timer(3);
  int randomPowerUp;
  int totalPowerUps = 3;

  boolean speedUpCollected;

  //initiales the width and height of the powerups.
  Powerups(float objPosX, float objPosY) {
    randomPowerUp = round(random(0, totalPowerUps));


    objWidth = 20;
    objHeight = 20;

    speedUpCollected = false;


    switch(randomPowerUp) {
    case 1:
      Add(new ShieldUp(objPosX, objPosY));
      break;
    case 2:
      Add(new SpeedUp(objPosX, objPosY));
      break;
    case 3:
      Add(new HealthUp(objPosX, objPosY));
      break;
    }
  }

  void draw()
  {
    if (speedUpCollected && !powerUpEffectTimer.TimerDone())
      myPlayer.defaultSpeed += 3;
  }
}



class ShieldUp extends Powerups
{



  ShieldUp(float objPosX, float objPosY)
  {
    super(objPosX, objPosY);
    pushStyle();
    fill(0, 0, 200);
    ellipse(objPosX, objPosY, objWidth, objHeight);
    popStyle();

    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    if (objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
    {
      UI.shield ++;
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
  }
}




class HealthUp extends Powerups
{

  HealthUp(float objPosX, float objPosY)
  {
    super(objPosX, objPosY);
    pushStyle();
    fill(0, 200, 0);
    ellipse(objPosX, objPosY, objWidth, objHeight);
    popStyle();

    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    if (objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
    {
      UI.levens ++;
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
  }
}




class SpeedUp extends Powerups
{

  SpeedUp(float objPosX, float objPosY)
  {
    super(objPosX, objPosY);
    pushStyle();
    fill(200, 0, 0);
    ellipse(objPosX, objPosY, objWidth, objHeight);
    popStyle();

    powerUpLifeTimer.Reset();
  }

  void draw()
  {
    if (objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
    {
      powerUps.speedUpCollected = true;
      powerUps.powerUpEffectTimer.Reset();
      Remove(this);
    }

    if (powerUpLifeTimer.TimerDone())
      Remove(this);
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
