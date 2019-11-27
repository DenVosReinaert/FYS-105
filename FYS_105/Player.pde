class Player { 
  float xPosition, yPosition;
  float playerSize, speed;
  float defaultSpeed = 5;
  float diaSpeed = (defaultSpeed * (sqrt(pow(10, 2) + pow(10, 2)) / 20)); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.

  boolean isLeft, isRight, isUp, isDown;
  boolean shootLeft, shootRight, shootUp, shootDown;

  int bulletCount = 19;
  int cooldown = 20;

  Bullet bulletO;
  ArrayList  <Bullet> bulletList = new ArrayList<Bullet>();

  Player() {
    bulletCount = 20;
    playerSize = 25;
    speed = defaultSpeed;
    xPosition = (width/2) - playerSize/2;
    yPosition = (height/2) - playerSize/2;
  }

  void draw() {

    move();
    pushStyle();
    stroke(200, 90, 90);
    fill(40, 40, 255);
    rect(xPosition, yPosition, playerSize, playerSize);
    popStyle();

    //cooldown makes sure you can't fire a bullet every frame
    cooldown--;
    //checks if the button is pressed and the cooldown allows another bullet, then makes a new bullet
    if (keyPressed && keyCode  == UP && cooldown <= 0) {
      bulletList.add(new Bullet(new PVector (xPosition + playerSize/2, yPosition + playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == DOWN && cooldown <= 0) {
      bulletList.add(new Bullet(new PVector (xPosition + playerSize/2, yPosition + playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == LEFT && cooldown <= 0) {
      bulletList.add(new Bullet(new PVector (xPosition + playerSize/2, yPosition + playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == RIGHT && cooldown <= 0) {
      bulletList.add(new Bullet(new PVector (xPosition + playerSize/2, yPosition + playerSize/2)));
      cooldown = 20;
    }
    //draws every bullet independendly
    for (Bullet bullets : bulletList) {
      bullets.draw();
    }
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

  boolean outOfBounds(boolean outOfScreen) {
    if (bullet.bulletPosX > width || bullet.bulletPosX > 0 || bullet.bulletPosY > height || bullet.bulletPosY < 0 || (bullet.bulletXVelocity == 0 && bullet.bulletYVelocity == 0)) {
      outOfScreen = true;
    } else { 
      return false;
    }
    return outOfScreen;
  }

  void collision() {
    //Checks if the bullet is out of the screen and removes those that are.
    for (int i = bulletList.size() -1; i >= 0; i--) {
      Bullet b = bulletList.get(i);
      if (b.outOfBounds()) {
        bulletList.remove(i);
      }
    }
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

  boolean setDirection(final int keyyS, final boolean boolS) {
    switch (keyyS) {
      //case +'W':
    case UP:
      return shootUp = boolS;

      //case +'S':
    case DOWN:
      return shootDown = boolS;

      //case +'A':
    case LEFT:
      return shootLeft = boolS;

      //case +'D':
    case RIGHT:
      return shootRight = boolS;

    default:
      return boolS;
    }
  }
}
