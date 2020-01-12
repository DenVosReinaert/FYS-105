class Turret extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;


  Turret ()
  {
    tag = "structure";

    objWidth = 87;
    objHeight = 154;
  }


  void setup()
  {
  }


  void draw(float objPosX, float objPosY)
  {
    objPosX += objWidth + 13;

    bbSW = 10;
    bbSH = objHeight/3 - 10;

    bbCW = objWidth - 10;
    bbCH = bbSW;

    //Collision Box Initialization
    //LEFT
    bbL.x = objPosX;
    bbL.y = objPosY + (objHeight/3 * 2) + 5;

    //RIGHT
    bbR.x = objPosX + objWidth - bbSW;
    bbR.y = bbL.y;

    //TOP
    bbT.x = objPosX + 5;
    bbT.y = bbL.y - 5;

    //BOTTOM
    bbB.x = bbT.x;
    bbB.y = objPosY + objHeight - bbCH + 5;



    //Collison Box Wireframes for checks
    //pushStyle();
    //noFill();
    //stroke(255);
    //rect(bbL.x, bbL.y, bbSW, bbSH);
    //rect(bbR.x, bbR.y, bbSW, bbSH);
    //rect(bbT.x, bbT.y, bbCW, bbCH);
    //rect(bbB.x, bbB.y, bbCW, bbCH);
    //popStyle();

    turret.draw(objPosX, objPosY);
    turret.update();


    //Collision statement Player & Enemy

    if ((myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX) > bbL.x && myPlayer.objPosX + myPlayer.moveVelX < bbL.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbL.y && myPlayer.objPosY + myPlayer.moveVelY < bbL.y + bbSH)
    {
      myPlayer.collRight = true;

      //for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      //{
      //  if (GameObjectRef.gameObject.get(i).tag == "enemy")
      //    GameObjectRef.gameObject.get(i).collRight = true;

      //  if (GameObjectRef.gameObject.get(i).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(i));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbR.x && myPlayer.objPosX + myPlayer.moveVelX < bbR.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbR.y && myPlayer.objPosY + myPlayer.moveVelY < bbR.y + bbSH)
    {
      myPlayer.collLeft = true;

      //for (int j = 0; j < GameObjectRef.gameObject.size(); j ++)
      //{
      //  if (GameObjectRef.gameObject.get(j).tag == "enemy")
      //    GameObjectRef.gameObject.get(j).collLeft = true;

      //  if (GameObjectRef.gameObject.get(j).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(j));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbB.x && myPlayer.objPosX + myPlayer.moveVelX < bbB.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbB.y && myPlayer.objPosY + myPlayer.moveVelY < bbB.y + bbCH)
    {
      myPlayer.collTop = true;

      //for (int k = 0; k < GameObjectRef.gameObject.size(); k ++)
      //{
      //  if (GameObjectRef.gameObject.get(k).tag == "enemy")
      //    GameObjectRef.gameObject.get(k).collTop = true;

      //  if (GameObjectRef.gameObject.get(k).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(k));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbT.x && myPlayer.objPosX + myPlayer.moveVelX < bbT.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbT.y && myPlayer.objPosY + myPlayer.moveVelY < bbT.y + bbCH)
    {
      myPlayer.collBott = true;

      //for (int l = 0; l < GameObjectRef.gameObject.size(); l ++)
      //{
      //  if (GameObjectRef.gameObject.get(l).tag == "enemy")
      //    GameObjectRef.gameObject.get(l).collBott = true;

      //  if (GameObjectRef.gameObject.get(l).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(l));
      //}
    }
  }
}
