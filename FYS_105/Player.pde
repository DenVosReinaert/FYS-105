class Player
{
  PImage mainChar;


  float xPosition, yPosition;
  float playerSize, speed;
  float defaultSpeed = 4;
  float diaSpeed = (defaultSpeed * (sqrt(pow(10, 2) + pow(10, 2)) / 20)); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.

  boolean isLeft, isRight, isUp, isDown;
  boolean shootLeft, shootRight, shootUp, shootDown;

  int bulletCount = 19;


  ArrayList  <Bullet> bulletList = new ArrayList<Bullet>();

  Player() {

    bulletCount = 20;
    mainChar = loadImage("/data/img/Last_Stand_Character_1_14x20.png");
    playerSize = 0;
    speed = defaultSpeed;
    xPosition = (width/2) - playerSize/2;
    yPosition = (height/2) - playerSize/2;

    myGun = new Pistol();

    //TO DO: als je 1 indrukt: BasicGun();,
    // als je 2 indrukt: MachineGun();,
    // als je 3 indrukt: Shotgun();.
  }

  void draw() {

    move();
    //bullet.removeBullet();
    pushStyle();
    stroke(200, 90, 90);
    fill(40, 40, 255);
    mainChar.resize(56, 80);
    image(mainChar, xPosition, yPosition);

    rect(xPosition, yPosition, playerSize, playerSize);
    popStyle();

    //cooldown makes sure you can't fire a bullet every frame

    //checks if the button is pressed and the cooldown allows another bullet, then makes a new bullet

    //ANY BULLET HAS BULLETHIT == TRUE THEN REMOVE BULLET
    if (1>0)
    {
    }
    ////////////
  }

  void move() {
    //sets the speed of the player to a different speed when moving diagonally so it moves at the same rate as the single axises
    if (isUp && isLeft || isLeft && isDown || isDown && isRight || isRight && isUp) {
      speed = diaSpeed;
    } else {
      speed = defaultSpeed;
    }
    xPosition = constrain(xPosition + speed*(int(isRight) - int(isLeft)), int(0), int(width) - playerSize);
    yPosition = constrain(yPosition + speed*(int(isDown)  - int(isUp)), int(0), int(height) - playerSize);
  }

  void act() {

    if (onekey) {
      myGun = new Pistol();
      onekey = false;
    } else if (twokey) {
      myGun = new MachineGun();
      twokey = false;
    } else if (threekey) {
      myGun = new Shotgun();
      threekey = false;
    }

<<<<<<< Updated upstream
    if (leftKey) {
=======
    if (bengine.lookingUp) {
>>>>>>> Stashed changes
      myGun.shoot();
    } else if (bengine.lookingDown) {
     myGun.shoot(); 
    } else if (bengine.lookingRight) {
     myGun.shoot(); 
    }else if (bengine.lookingLeft) {
     myGun.shoot(); 
    }

    if (rightKey) {
      myGun.shoot();
    }
    if (upKey) {
      myGun.shoot();
    }
    if (downKey) {
      myGun.shoot();
    }

    myGun.recharge();
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
