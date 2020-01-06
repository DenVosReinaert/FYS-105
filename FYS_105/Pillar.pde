class Pillar extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;

  Pillar()
  {
    tag = "structure";

    pillarWidth = pillar.width;
    pillarHeight = pillar.height;
  }

  void draw(float pillarPosX, float pillarPosY)
  {
    pillarPosX += pillarWidth/4;

    bbSW = 10;
    bbSH = pillarHeight/3 - 10;

    bbCW = pillarWidth - 10;
    bbCH = bbSW;


    //LEFT
    bbL.x = pillarPosX;
    bbL.y = pillarPosY + (pillarHeight/3 * 2) + 5;

    //RIGHT
    bbR.x = pillarPosX + pillarWidth - bbSW;
    bbR.y = bbL.y;

    //TOP
    bbT.x = pillarPosX + 5;
    bbT.y = bbL.y - 5;

    //BOTTOM
    bbB.x = bbT.x;
    bbB.y = pillarPosY + pillarHeight - bbCH + 5;



    //


    image(pillar, pillarPosX, pillarPosY);

    //rect(myPlayer.playerPosX, myPlayer.playerPosY, 5, 5);
    //rect(myPlayer.playerPosX + myPlayer.playerWidth, myPlayer.playerPosY + myPlayer.playerHeight, -5, -5);


    //Collision statement Player & Enemy

    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbL.x && myPlayer.playerPosX + myPlayer.moveVelX < bbL.x + bbSW && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbL.y && myPlayer.playerPosY + myPlayer.moveVelY < bbL.y + bbSH)
    {
      myPlayer.collRight = true;

      for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      {
        if (GameObjectRef.gameObject.get(i).tag == "enemy")
          GameObjectRef.gameObject.get(i).collRight = true;

        if (GameObjectRef.gameObject.get(i).tag == "bullet")
          Remove(GameObjectRef.gameObject.get(i));
      }
    }



    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbR.x && myPlayer.playerPosX + myPlayer.moveVelX < bbR.x + bbSW && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbR.y && myPlayer.playerPosY + myPlayer.moveVelY < bbR.y + bbSH)
    {
      myPlayer.collLeft = true;

      for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      {
        if (GameObjectRef.gameObject.get(i).tag == "enemy")
          GameObjectRef.gameObject.get(i).collLeft = true;

        if (GameObjectRef.gameObject.get(i).tag == "bullet")
          Remove(GameObjectRef.gameObject.get(i));
      }
    }



    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbB.x && myPlayer.playerPosX + myPlayer.moveVelX < bbB.x + bbCW && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbB.y && myPlayer.playerPosY + myPlayer.moveVelY < bbB.y + bbCH)
    {
      myPlayer.collTop = true;

      for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      {
        if (GameObjectRef.gameObject.get(i).tag == "enemy")
          GameObjectRef.gameObject.get(i).collTop = true;

        if (GameObjectRef.gameObject.get(i).tag == "bullet")
          Remove(GameObjectRef.gameObject.get(i));
      }
    }



    if (myPlayer.playerPosX + myPlayer.playerWidth + myPlayer.moveVelX > bbT.x && myPlayer.playerPosX + myPlayer.moveVelX < bbT.x + bbCW && myPlayer.playerPosY + myPlayer.playerHeight + myPlayer.moveVelY > bbT.y && myPlayer.playerPosY + myPlayer.moveVelY < bbT.y + bbCH)
    {
      myPlayer.collBott = true;

      for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      {
        if (GameObjectRef.gameObject.get(i).tag == "enemy")
          GameObjectRef.gameObject.get(i).collBott = true;

        if (GameObjectRef.gameObject.get(i).tag == "bullet")
          Remove(GameObjectRef.gameObject.get(i));
      }
    }

    //Collision box visualisation
    //pushStyle();
    //noFill();
    //stroke(255);
    //rect(bbT.x, bbT.y, bbCW, bbCH);
    //rect(bbB.x, bbB.y, bbCW, bbCH);
    //rect(bbR.x, bbR.y, bbSW, bbSH);
    //rect(bbL.x, bbL.y, bbSW, bbSH);
    //popStyle();

    //BOUNDARIES
  }
}
