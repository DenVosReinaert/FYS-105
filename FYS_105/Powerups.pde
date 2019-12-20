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

<<<<<<< Updated upstream
    if (dist(playerPosX, playerPosY, speedUpX, speedUpY) < 20) {
=======
    if (dist(myPlayer.playerPosX, myPlayer.playerPosY, speedUpX, speedUpY) < 20) {
>>>>>>> Stashed changes
      SpeedUp();
    }
  }

  void SpeedUp() {

    int speedUpSpeed = 3;

<<<<<<< Updated upstream
    defaultSpeed = defaultSpeed + speedUpSpeed;

    //WAIT FOR 10 SECONDS, THEN TURN SPEED BACK TO NORMAL;

    defaultSpeed = defaultSpeed - speedUpSpeed;
=======
    myPlayer.defaultSpeed += speedUpSpeed;
>>>>>>> Stashed changes
  }
}
