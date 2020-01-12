class Turret extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;

  String turretType;

  Timer fireTimer = new Timer(10);

  Turret (String type)
  {
    tag = "structure";

    turretType = type;

    objWidth = 87;
    objHeight = 154;

    fireTimer.Reset();
  }


  void setup()
  {
  }


  void draw(float objPosX, float objPosY)
  {


    objPosX += objWidth + 13;

    if (turretType == "regular")
    {


      turret.draw(objPosX, objPosY);
      turret.update();

      if (spawn.waveInProgress && fireTimer.TimerDone())
      {
        Add( new EnemyProjectile(objPosX+ objWidth/2, objPosY + objHeight/2, "static"));
        fireTimer.Reset();
      }
    } else
      if (turretType == "homing")
      {
        if (spawn.waveInProgress && fireTimer.TimerDone())
        {
          Add(new EnemyProjectile(objPosX+ objWidth/2, objPosY + objHeight/2, "homing"));
          fireTimer.Reset();
        }
      }

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
