class Pillar extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;

  Pillar()
  {
    tag = "structure";

    objWidth = pillar.width;
    objHeight = pillar.height;
  }

  void draw(float objPosX, float objPosY)                              //Draw the object on the location that was given.
  {
    objPosX += objWidth/4;

    bbSW = 10;                                                         //BoundingBox Side Width
    bbSH = objHeight/3 - 10;                                           //BoundingBox Side Height

    bbCW = objWidth - 10;                                              //BoundingBox Cap Width
    bbCH = bbSW;                                                       //BoundingBox cap Height


    //LEFT
    bbL.x = objPosX;                                                   //BoundingBox Left positioning
    bbL.y = objPosY + (objHeight/3 * 2) + 5;

    //RIGHT
    bbR.x = objPosX + objWidth - bbSW;                                 //BoundingBox Right positioning
    bbR.y = bbL.y;

    //TOP
    bbT.x = objPosX + 5;                                               //BoundingBox Top positioning
    bbT.y = bbL.y - 5;

    //BOTTOM
    bbB.x = bbT.x;                                                     //BoundingBox Bottom positiong
    bbB.y = objPosY + objHeight - bbCH + 5;




    image(pillar, objPosX, objPosY);


    //Collision statement Player & Enemy
    if ((myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX) > bbL.x && myPlayer.objPosX + myPlayer.moveVelX < bbL.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbL.y && myPlayer.objPosY + myPlayer.moveVelY < bbL.y + bbSH)
    {
      myPlayer.collRight = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbR.x && myPlayer.objPosX + myPlayer.moveVelX < bbR.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbR.y && myPlayer.objPosY + myPlayer.moveVelY < bbR.y + bbSH)
    {
      myPlayer.collLeft = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbB.x && myPlayer.objPosX + myPlayer.moveVelX < bbB.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbB.y && myPlayer.objPosY + myPlayer.moveVelY < bbB.y + bbCH)
    {
      myPlayer.collTop = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbT.x && myPlayer.objPosX + myPlayer.moveVelX < bbT.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbT.y && myPlayer.objPosY + myPlayer.moveVelY < bbT.y + bbCH)
    {
      myPlayer.collBott = true;
    }





    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {
      //Pillar Collision v Enemy
      if (GameObjectRef.gameObject.get(i).tag == "enemy")
      {
        if ((GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx) > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbL.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbL.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbL.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collRight = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbR.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbR.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbR.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collLeft = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbB.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbB.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbB.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbB.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collTop = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbT.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbT.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbT.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbT.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collBott = true;
        }
      }




      //Pillar Collision v Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).moveVelX > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).moveVelX < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).moveVelY > bbT.y && GameObjectRef.gameObject.get(i).objPosY + myPlayer.moveVelY < bbB.y + bbCH)
        {
          Remove(GameObjectRef.gameObject.get(i));
          ascore.ComboReset();
        }
      }
    }
  }
}
