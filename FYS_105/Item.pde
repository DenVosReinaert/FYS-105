class Item extends GameObject {

  Timer voicelineTimer = new Timer(0.5);

  int randomPowerUp;
  int totalPowerUps = 3;

  float tempObjPosX, tempObjPosY;
  int vlCantBuy, vlCanBuy;


  //initiales the width and height of the powerups.
  Item(float objPosX, float objPosY, int shopItemNumberInput)
  {
    tag = "item";

    shopItemNumber = shopItemNumberInput;

    if (shopItemNumber < 1)
      shopItemNumber = 1;

    if (shopItemNumber > 2)
      shopItemNumber = 2;

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    //
    if (msql.connect())
    {
      msql.query("SELECT priceItemBase FROM Items WHERE idItem = '%s'", shopItemNumber);
      while (msql.next())
      {
        itemPrice = parseInt(msql.getString("priceItemBase")) * spawn.wave;
      }
    }
  }


  void draw()
  {
    if(spawn.wave % 2 != 0)
    Remove(this);
    
    switch(shopItemNumber) {
    case 1:
      //HEALTH
      healthUp.draw(tempObjPosX, tempObjPosY);
      healthUp.update();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.levens ++;
          uhoh.setGain(30);
          uhoh.play();
          uhoh.rewind();

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
          }
      }
      break;



    case 2:
      //SPEEDUP
      speedUp.draw(tempObjPosX, tempObjPosY);
      speedUp.update();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          //powerUps.speedUpCollected = true;
          myPlayer.speedUpCollected = true;
          myPlayer.speedUpTimer.Reset();
          speedup.setGain(30);
          speedup.play();
          speedup.rewind();

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;
    }


    switch(vlCanBuy)
    {
    case 1:
      buying1.setGain(100);
      buying1.play();
      buying1.rewind();
      break;
    case 2:
      buying2.setGain(100);
      buying2.play();
      buying2.rewind();
      break;
    case 3:
      buying3.setGain(100);
      buying3.play();
      buying3.rewind();
      break;
    case 4:
      buying4.setGain(100);
      buying4.play();
      buying4.rewind();
      break;
    case 5:
      buying5.setGain(100);
      buying5.play();
      buying5.rewind();
      break;
    case 6:
      buying6.setGain(100);
      buying6.play();
      buying6.rewind();
      break;
    case 7:
      buying7.setGain(100);
      buying7.play();
      buying7.rewind();
      break;
    }

    switch(vlCantBuy)
    {
    case 1:
      cantbuy1.setGain(100);
      if (!cantbuy2.isPlaying())
      {
        cantbuy1.play();
        cantbuy1.rewind();
      }
      break;
    case 2:
      cantbuy2.setGain(100);
      if (!cantbuy1.isPlaying())
      {
        cantbuy2.play();
        cantbuy2.rewind();
      }
      break;
    }

    pushStyle();
    fill(255);
    text(itemPrice, tempObjPosX, tempObjPosY + objHeight * 2);
    popStyle();
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
