class Pillar extends GameObject
{
  
  PVector bbL, bbR, bbT, bbB;
  float bbW, bbLH, bbRH, bbTH, bbBH;

  Pillar()
  {
    tag = "structure";
    
    bbW = 10;
    
    bbL.x = 0;
    bbL.y = pillarPosY + (pillarHeight/3 * 2);
    bbLH = pillarHeight/3;
    
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

    }


    //BOUNDARIES
  }
}
