class Pillar
{


  float pillarWidth, pillarHeight, pillarBoundY;

  void setup()
  {
    pillarWidth = Calculate("x", 75);
    pillarHeight = Calculate("y", 150);

    pillarBoundY = Calculate("y", pillarHeight/2);
  }



  void draw(float pillarPosX, float pillarPosY)
  {
    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX && myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillarWidth)
    {
      myPlayer.moveVelX = 0;
    }

    if (myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarHeight/2 && myPlayer.playerPosY + myPlayer.moveVelY < pillarPosY + pillarHeight)
    {
      myPlayer.moveVelY = 0;
    }

    image(pillar, pillarPosX, pillarPosY);
    pushStyle();
    fill(0);
    rect(pillarPosX, pillarBoundY, pillarWidth, pillarHeight);
    popStyle();






    //BOUNDARIES
  }
}
