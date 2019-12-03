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
    if (myPlayer.playerPosX + myPlayer.playerWidth > pillarPosX)
    {
      myPlayer.playerPosX = pillarPosX - myPlayer.playerWidth;
    } else
      if (myPlayer.playerPosX < pillarPosX + pillarWidth)
      {
        myPlayer.playerPosX = pillarPosX + pillarWidth;
      }

    if (myPlayer.playerPosY + myPlayer.playerHeight > pillarBoundY)
    {
      myPlayer.playerPosY = pillarBoundY - myPlayer.playerHeight;
    } else
      if (myPlayer.playerPosY < pillarHeight)
      {
        myPlayer.playerPosY = pillarHeight;
      }
  }
}
