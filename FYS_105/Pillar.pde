class Pillar extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float  bbLH, bbRH, bbTW, bbBW;
  float bbWS, bbHC;

  Pillar()
  {
    tag = "structure";
  }

  void draw(float pillarPosX, float pillarPosY)
  {
    bbWS = 10;
    bbHC = bbWS;

    bbTW = pillarWidth;
    bbBW = bbTW;

    bbLH = pillarHeight/3;
    bbRH = bbLH;

    //LEFT
    bbL.x = pillarPosX;
    bbL.y = pillarPosY + (pillarHeight/3 * 2);

    //RIGHT
    bbR.x = pillarPosX + pillarWidth - bbWS;
    bbR.y = bbL.y;

    //TOP
    bbT.x = pillarPosX;
    bbT.y = bbL.y;

    //BOTTOM
    bbB.x = bbT.x;
    bbB.y = pillarPosY + pillarHeight - bbHC;

    pillarPosX += pillarWidth/6;

    image(pillar, pillarPosX, pillarPosY);

    rect(myPlayer.playerPosX, myPlayer.playerPosY, 5, 5);
    rect(myPlayer.playerPosX + myPlayer.playerWidth, myPlayer.playerPosY + myPlayer.playerHeight, 5, 5);
    rect(pillarPosX, pillarPosY, 5, 5);
    rect(pillarPosX + pillarWidth, pillarPosY + pillarHeight, 5, 5);


    //Collision statement

    if (myPlayer.playerPosX + myPlayer.moveVelX < bbL.x + bbWS && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbL.x && myPlayer.playerPosY + myPlayer.moveVelY < bbL.y + bbLH && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbL.y)
    {
      myPlayer.collRight = true;
    }

    if (myPlayer.playerPosX + myPlayer.moveVelX < bbR.x + bbWS && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbR.x && myPlayer.playerPosY + myPlayer.moveVelY < bbR.y + bbRH && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbR.y)
    {
      myPlayer.collLeft = true;
    }

    if (myPlayer.playerPosX + myPlayer.moveVelX < bbB.x + bbBW && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbB.x && myPlayer.playerPosY + myPlayer.moveVelY < bbB.y + bbHC && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbB.y)
    {
      myPlayer.collTop = true;
    }

    //Alleen deze nog!
    if (myPlayer.playerPosX + myPlayer.moveVelX < bbT.x + bbTW && myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbT.x && myPlayer.playerPosY + myPlayer.moveVelY < bbT.y + bbHC && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbT.y)
    {
      myPlayer.collBott = true;
    }


    //BOUNDARIES
  }
}
