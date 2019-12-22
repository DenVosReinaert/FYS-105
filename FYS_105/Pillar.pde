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
    if (myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillar.width && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX && myPlayer.playerPosY + myPlayer.moveVelY < pillarPosY + pillar.height && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarPosY)
    {
      if (myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillar.width && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX)
      {
        myPlayer.pillarColX = true;
        println("Collide X");
      } else myPlayer.pillarColX = false;

      if (myPlayer.playerPosY + myPlayer.moveVelY < pillarPosY + pillar.height && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarPosY)
      {
        myPlayer.pillarColY = true;
        println("CollideY");
      } else myPlayer.pillarColY = false;
    }

    //BOUNDARIES
  }
}
