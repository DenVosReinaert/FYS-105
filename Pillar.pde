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
    image(pillar, pillarPosX, pillarPosY);
    pushStyle();
    fill(0);
    rect(pillarPosX, pillarBoundY, pillarWidth, pillarHeight);
    popStyle();






    //BOUNDARIES
    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX)
    {
      myPlayer.moveVelX = 0;
    } else
      if (myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillarWidth)
      {
        myPlayer.moveVelX = 0;
      }

    if (myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarBoundY)
    {
      myPlayer.moveVelY = 0;
    } else
      if (myPlayer.playerPosY + myPlayer.moveVelY < pillarHeight)
      {
        myPlayer.moveVelY = 0;
      }
  }
}
