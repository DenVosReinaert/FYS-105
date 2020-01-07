class Powerups extends GameObject {

  Timer powerUpSpd = new Timer(4);

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
      ellipse(speedUpX, speedUpY, speedUpDia/2, speedUpDia/2);
      popStyle();

      if (dist(myPlayer.objPosX, myPlayer.objPosY, speedUpX, speedUpY) < speedUpDia/2) {
        SpeedUp();
      }
    }
  }



  void SpeedUp() {
    powerUpSpd.Reset();
    if (!powerUpSpd.TimerDone())
      myPlayer.bonusSpeed = 3;
    else
      myPlayer.bonusSpeed = 0;
  }
}
