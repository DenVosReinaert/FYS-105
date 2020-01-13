class Item extends GameObject {

  Timer voicelineTimer = new Timer(0.5);

  int randomPowerUp;
  int totalItems = 13;

  float tempObjPosX, tempObjPosY;
  int vlCantBuy, vlCanBuy;


  //initiales the width and height of the powerups.
  Item(float objPosX, float objPosY, int shopItemNumberInput)
  {
    tag = "item";

    shopItemNumber = shopItemNumberInput;


    //Cant buy machine gun upgrades if you already have them / are missing the previous
    if (shopItemNumber == 8 && (myPlayer.machineGun.upgradeLevel == 2 || myPlayer.machineGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 9 && (myPlayer.machineGun.upgradeLevel == 1 || myPlayer.machineGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));

    //Cant buy shotgun upgrades if you already have them / are missing the previous
    if (shopItemNumber == 10 && (myPlayer.shotGun.upgradeLevel == 1 || myPlayer.shotGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 11 && (myPlayer.shotGun.upgradeLevel == 1 || myPlayer.shotGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));

    //Cant buy pistol upgrades if you already have them / are missing the previous
    if (shopItemNumber == 12 && (myPlayer.pistol.upgradeLevel == 1 || myPlayer.pistol.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 13 && (myPlayer.pistol.upgradeLevel == 1 || myPlayer.pistol.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));



    if (shopItemNumber < 1)
      shopItemNumber = 1;

    if (shopItemNumber > totalItems)
      shopItemNumber = totalItems;

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
    if (spawn.wave % 2 != 0)
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
          //uhoh.setGain(30);
          //uhoh.play();
          //uhoh.rewind();


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
      // Ammo MG 1 load
      image(arLoad, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 30;

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

    case 3:
      //Ammo MG 2 load

      image(arLoad2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 60;

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

    case 4:
      //Ammo MG 2 load

      image(arFullLoad, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 300;

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

    case 5:
      //Shotgun 1 load

      image(shotg_load, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 5;

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

    case 6:
      //Shotgun 2 load

      image(shotg_load2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 10;

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

    case 7:
      //Shotgun full load

      image(shotg_load2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 20;

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

    case 8:
      // MachineGun Upgrade 2
      pushStyle();
      LMG1_right.resize(70, 16);
      image(LMG1_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.machineGun.upgradeLevel = 2;

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

    case 9:
      // MachineGun Final Upgrade

      pushStyle();
      LMG2_right.resize(70, 16);
      image(LMG2_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.machineGun.upgradeLevel = 3;

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

    case 10:
      // Shotgun Upgrade 2

      image(pumpR, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.shotGun.upgradeLevel = 2;

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

    case 11:
      // Shotgun Final Upgrade

      pushStyle();
      shotg_right.resize(50, 45);
      image(shotg_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.shotGun.upgradeLevel = 3;

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

    case 12:
      // Pistol second Upgrade

      image(rayGunP_right, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.pistol.upgradeLevel = 2;

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

    case 13:
      // Pistol final Upgrade

      image(treeGun_right, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.pistol.upgradeLevel = 3;

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
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying1.setGain(100);
        buying1.play();
        buying1.rewind();
      }
      break;
    case 2:
      if (!buying1.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying2.setGain(100);
        buying2.play();
        buying2.rewind();
      }
      break;
    case 3:
      if (!buying2.isPlaying() || !buying1.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying3.setGain(100);
        buying3.play();
        buying3.rewind();
      }
      break;
    case 4:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying1.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying4.setGain(100);
        buying4.play();
        buying4.rewind();
      }
      break;
    case 5:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying1.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying5.setGain(100);
        buying5.play();
        buying5.rewind();
      }
      break;
    case 6:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying1.isPlaying() || !buying7.isPlaying() ) {
        buying6.setGain(100);
        buying6.play();
        buying6.rewind();
      }
      break;
    case 7:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying1.isPlaying() ) {
        buying7.setGain(100);
        buying7.play();
        buying7.rewind();
      }
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
    textSize(20);
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
