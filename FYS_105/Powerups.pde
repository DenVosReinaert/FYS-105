//Reno Bisschop

class Powerups extends GameObject {

  int speedUpX;
  int speedUpY;
  int speedUpDia;

  //initializing the coordinates of the powerup 'SpeedUp'.
  Powerups() {
    speedUpX = 640;
    speedUpY = 360;
    speedUpDia = 20;
  }

  void draw() {

    speedUpX = width/2;
    speedUpY = height/2;

    ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);

    if (dist(playerPosX, playerPosY, speedUpX, speedUpY) < 20) {
      SpeedUp();
    }
  }

  void SpeedUp() {

    int speedUpSpeed = 3;

    defaultSpeed = defaultSpeed + speedUpSpeed;

    //WAIT FOR 10 SECONDS, THEN TURN SPEED BACK TO NORMAL;

    defaultSpeed = defaultSpeed - speedUpSpeed;
  }
}
