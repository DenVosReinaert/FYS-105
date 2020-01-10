class Powerups extends GameObject {

  Timer powerUpSpd = new Timer(4);

  //initializing the coordinates of the powerup 'SpeedUp'.
  Powerups() {
    speedUpX = random(0, width);
    speedUpY = random(0, height);
    speedUpDia = 20;

    healthUpX = random(0, width);
    healthUpY = random(0, height);
    healthUpDia = 20;

    shieldX = random(0, width);
    shieldY = random(0, height);
    shieldDia = 20;
    shieldOnPlayerDia = 65;
  }

  void draw() {
    if (game) {
      DropSpeedUp();
      DropHealthUp();
      DropShield();
      println(UI.levens + " = levens");
      println(UI.shield + " = shield");
    }
  }

  //Drops the Speed powerup
  void DropSpeedUp() {
    pushStyle();
    fill(0, 200, 0);
    ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);
    popStyle();

    if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, speedUpX, speedUpY) < speedUpDia) {
      SpeedUp();
    }
  }

  //Set normalSpeed to 2.1 (Standard value)
  void SpeedUpDone() {
    //myPlayer.bonusSpeed = 0;
    myPlayer.normalSpeed = 2.1;
  }

  //How the Speed power-up works
  void SpeedUp() {
    powerUpSpd.Reset();
    if (!powerUpSpd.TimerDone()) {
      myPlayer.bonusSpeed = 3;
    } else {
      myPlayer.bonusSpeed = 0;
    }
    if (!powerUpSpd.TimerDone()) {
      myPlayer.normalSpeed = 4.2;
    } else {
      SpeedUpDone();
    }
  }

  //Drops the speed power-up
  void DropHealthUp() {
    pushStyle();
    fill(200, 0, 0);
    ellipse(healthUpX, healthUpY, healthUpDia, healthUpDia);
    popStyle();

    if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, healthUpX, healthUpY) < healthUpDia) {
      HealthUp();
    }
  }

  //How the Health power-up works
  void HealthUp() {
    if (UI.levens < 2) {
      UI.levens ++;
    }     
    else if (UI.levens < 3) {
      UI.levens ++;
    }    
    else if (UI.levens < 4) {
      UI.levens ++;
    }    
    else if (UI.levens < 5) {
      UI.levens ++;
    }
    
    healthUpX = -100;
    healthUpY = -100;
    
  }

  //Drops the Shield power-up
  void DropShield() {
    pushStyle();
    fill(0, 200, 200);
    ellipse(shieldX, shieldY, shieldDia, shieldDia);
    popStyle();

    if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, shieldX, shieldY) < shieldDia) {
      Shield();
    }
  }

  //How the shield power-up works
  void Shield() {
    //Shield in working
    for (int i = 0; i <10; i++) {
      UI.shield ++;
      if (UI.shield > 2) {
        UI.shield = 2;
      }
    }
  }
}
