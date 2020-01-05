class Powerups extends GameObject {

  Timer PowerupSpd = new Timer(4);

  //initializing the coordinates of the powerup 'SpeedUp'.
  Powerups() {
    speedUpX = random(0, width);
    speedUpY = random(0, height);
    speedUpDia = 20;
  }

  void draw() {
    if (game) {
      pushStyle();
      fill(200, 0, 0);
      ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);
      popStyle();

      if (dist(myPlayer.playerPosX, myPlayer.playerPosY, speedUpX, speedUpY) < 20) {
        SpeedUp();
      }
    }
  }



  void SpeedUp() {
    PowerupSpd.Reset();
    myPlayer.bonusSpeed = 3;
    println("1: "+ myPlayer.defaultSpeed);
    if (PowerupSpd.TimerDone()) {
      myPlayer.bonusSpeed = 0;
      println("2: "+ myPlayer.defaultSpeed);
    }
  }
}
