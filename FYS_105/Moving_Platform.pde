class Moving_Platform {
  boolean playerOnPlatform, hitLimitLeft;
  float pSpeed, sizeX, sizeY, limitLeft, limitRight, posX, posY;

  Moving_Platform() {
    sizeX = 250;
    sizeY = 20;
    pSpeed = 4;
    hitLimitLeft = true;
  }

  void draw(float posXInit, float posYInit) {
    fill(0);
    rect(posXInit, posYInit, sizeX, sizeY); // Platform

    posX = posXInit;
    posY = posYInit;
  }

  void move()
  {
    if (posX < limitRight && hitLimitLeft)
    {
      posX += pSpeed;
    } else if ( posX < limitLeft && !hitLimitLeft)
    {
      posX -= pSpeed;
    }

    //posX += pSpeed;
    //if (posX > 800) {
    //  pSpeed = -pSpeed;
    //}
    //if (posX < 1400) {
    //  pSpeed = -pSpeed;
    //}

    if (hitLimitLeft && posX + sizeX >= limitRight)
      hitLimitLeft = !hitLimitLeft;
    else if (!hitLimitLeft && posX < limitLeft)
      hitLimitLeft = !hitLimitLeft;
  }
}
