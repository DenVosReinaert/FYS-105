class Pillar extends GameObject
{

  Pillar()
  {
    tag = "structure";
  }

  void draw(float pillarPosX, float pillarPosY)
  {
    pillarPosX += pillar.width/6;
    pillarPosY += pillar.height;

    image(pillar, pillarPosX, pillarPosY);


    if (myPlayer.playerPosX + myPlayer.playerWidth > pillarPosX && myPlayer.playerPosX < pillarPosX + pillar.width) {
      if (myPlayer.playerPosY< pillarPosY && myPlayer.playerPosY + myPlayer.playerHeight  > pillarPosY - pillar.height/3)
        println("OVERLAPPING!!!");
    }

    //BOUNDARIES
  }
}
