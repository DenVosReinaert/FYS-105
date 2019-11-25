class Player
{
  PImage mainChar;

  boolean isLeft, isRight, isUp, isDown;
  float xPosition, yPosition;
  float playerSize, speed;
  float defaultSpeed = 5;
  float diaSpeed = (defaultSpeed * (sqrt(pow(10, 2) + pow(10, 2)) / 20)); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.

  Player() {
    mainChar = loadImage("/data/img/Last_Stand_Character_1_14x20.png");
    playerSize = 40;
    speed = defaultSpeed;
    xPosition = (width/2) - playerSize/2;
    yPosition = (height/2) - playerSize/2;
  }

  void display() {
    noStroke();
    fill(40, 40, 255);
    mainChar.resize(56,80);
    image(mainChar, xPosition, yPosition);
    //  rect(xPosition, yPosition, playerSize, playerSize);
  }

  void move() {
    if (isUp && isLeft || isLeft && isDown || isDown && isRight || isRight && isUp) {
      speed = diaSpeed;
    } else {
      speed = defaultSpeed;
    }
    xPosition = constrain(xPosition + speed*(int(isRight) - int(isLeft)), int(0), int(width) - playerSize);
    yPosition = constrain(yPosition + speed*(int(isDown)  - int(isUp)), int(0), int(height) - playerSize*2);
  }


  boolean setMove(final int keyy, final boolean bool) {
    switch (keyy) {
    case +'W':
      //case UP:
      return isUp = bool;

    case +'S':
      //case DOWN:
      return isDown = bool;

    case +'A':
      //case LEFT:
      return isLeft = bool;

    case +'D':
      //case RIGHT:
      return isRight = bool;

    default:
      return bool;
    }
  }
}
