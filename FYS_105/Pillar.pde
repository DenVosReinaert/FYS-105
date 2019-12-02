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
    if (thePlayer.playerPosX + thePlayer.playerWidth > pillarPosX)
    {
      thePlayer.playerPosX = pillarPosX - thePlayer.playerWidth;
    } else
      if (thePlayer.playerPosX < pillarPosX + pillarWidth)
      {
        thePlayer.playerPosX = pillarPosX + pillarWidth;
      }

    if (thePlayer.playerPosY + thePlayer.playerHeight > pillarBoundY)
    {
      thePlayer.playerPosY = pillarBoundY - thePlayer.playerHeight;
    } else
      if (thePlayer.playerPosY < pillarHeight)
      {
        thePlayer.playerPosY = pillarHeight;
      }
  }
}
