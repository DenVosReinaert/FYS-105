class Pillar extends GameObject
{

  Pillar()
  {
    tag = "structure";
  }

  void draw(float pillarPosX, float pillarPosY)
  {
    println(pillar.height);

    pillarPosX += pillar.width/6;

    image(pillar, pillarPosX, pillarPosY);


    rect(myPlayer.playerPosX + myPlayer.playerWidth, myPlayer.playerPosY + myPlayer.playerHeight, 5, 5);
    rect(pillarPosX, pillarPosY, 5, 5);
    rect(pillarPosX + pillar.width, pillarPosY + pillar.height, 5, 5);


    //Collision statement
    if (myPlayer.playerPosX < pillarPosX + pillar.width && myPlayer.playerPosX + myPlayer.playerWidth > pillarPosX && myPlayer.playerPosY < pillarPosY + pillar.height && myPlayer.playerPosY + myPlayer.playerHeight > pillarPosY)
    {
      if(myPlayer.playerPosX < pillarPosX + pillar.width && myPlayer.playerPosX + myPlayer.playerWidth > pillarPosX)
      {
      myPlayer.moveVelX = 0;
      println("Collide X");
      }
      
      if (myPlayer.playerPosY < pillarPosY + pillar.height && myPlayer.playerPosY + myPlayer.playerHeight > pillarPosY)
      {
        myPlayer.moveVelY = 0;
        println("CollideY");
      }
      
    }

    //BOUNDARIES
  }
}
