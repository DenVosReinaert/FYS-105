class Platform {
  boolean playerOnPlatform, moveRight;
  float pSpeed, sizeX, sizeY, limitLeft, limitRight, posX, posY;

  Platform() {
    sizeX = 250 / 1920f * width;
    sizeY = 20 / 1080f * height;
  }

  void draw(float posX, float posY) {

    rect(posX, posY, sizeX, sizeY);

    if (thePlayer.playerPosX + thePlayer.sizeX > posX && thePlayer.playerPosX < posX + sizeX)
    {
      if (thePlayer.playerPosY + thePlayer.sizeY > posY && thePlayer.playerPosY + thePlayer.sizeY < posY + sizeY)
      {
        playerOnPlatform = true;
      } else
        playerOnPlatform = false;
    } else
      playerOnPlatform = false;
  }
}
