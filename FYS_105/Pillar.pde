class Pillar extends GameObject
{

  Pillar()
  {
    tag = "structure";
  }

  void draw(float pillarPosX, float pillarPosY)
  {

    pillarPosX += pillarWidth/6;

    image(pillar, pillarPosX, pillarPosY);

    rect(myPlayer.playerPosX, myPlayer.playerPosY, 5, 5);
    rect(myPlayer.playerPosX + myPlayer.playerWidth, myPlayer.playerPosY + myPlayer.playerHeight, 5, 5);
    rect(pillarPosX, pillarPosY, 5, 5);
    rect(pillarPosX + pillarWidth, pillarPosY + pillarHeight, 5, 5);


    //Collision statement

    if (myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillarWidth && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX && myPlayer.playerPosY + myPlayer.moveVelY < pillarPosY + pillarHeight && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarPosY)
    {
      if (myPlayer.playerPosX + myPlayer.moveVelX < pillarPosX + pillarWidth && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > pillarPosX)
      {

        myPlayer.defaultSpeed = 0;
        println("Collide X");
      }
      else
      if (myPlayer.playerPosY + myPlayer.moveVelY < pillarPosY + pillarHeight && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > pillarPosY)
      {      

        myPlayer.defaultSpeed = 0;
        println("CollideY");
      }
      else myPlayer.defaultSpeed = 5;
    }


    //BOUNDARIES
  }
}
