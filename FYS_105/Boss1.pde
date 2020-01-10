class Boss1 extends GameObject {

  Boss1() {
    tag = "enemy";
    idAchievement[1] = 3;
    objWidth=100;
    objHeight=146;
    hp=20;
    moveVelX=1;
    moveVelY=1;

    scoreGain = 100;

    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }



  void draw() {
    checkPulse();


    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75 && angleBetweenVector < 0.75) {
      boss1U.draw(objPosX, objPosY);
      boss1U.update();
    }

    if ( (angleBetweenVector > 2.25 && angleBetweenVector < 3.2) || (angleBetweenVector < -2.25 && angleBetweenVector > -3.2) ) {
      boss1D.draw(objPosX, objPosY);
      boss1D.update();
    }
    if (angleBetweenVector > 0.75 && angleBetweenVector < 2.25) {
      boss1L.draw(objPosX, objPosY);
      boss1L.update();
    }
    if (angleBetweenVector > -2.25 && angleBetweenVector < -0.75) {
      boss1R.draw(objPosX, objPosY);
      boss1R.update();
    }

    //ENEMY MOVEMENT
    dx = myPlayer.objPosX - objPosX;
    dy = myPlayer.objPosY - objPosY;

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);



    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;




    if (Dead())
    {
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }//enemyShow


  void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player
      if (objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        if (UI.levens >0 && UI.shield <= 0) {
          UI.hitValue = 3;
          //UI.levens-= hitValue;
          hp = 0;
          UI.spelerhit();
        } else if (UI.shield > 0) {
          UI.shield -= 2;
        }
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hp-=1;
          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          println("combo increase!");
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            if (msql.connect())
            {
              msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM User_has_Achievements WHERE Achievements_idAchievements = '%s', User_idUser = '%s'", (chieves.bossCounter + 1), idAchievement[1], User.currentUser);

              msql.query("SELECT collectedAchievements FROM Achievements INNERJOIN User_has_Achievements WHERE idAchievements = '%s', User_idUser = '%s'", idAchievement[1], User.currentUser);
              if (parseInt(msql.getString("collectedAchievements")) >= 1)
              {
                msql.query("UPDATE Achievements SET collectedAchievements = '%s' FROM User_has_Achievements WHERE idAchievements = '%s', User_idUser = '%s'", 1, idAchievement[1], User.currentUser);
              }
            }

            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new Particle(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }



  boolean Dead() {
    return hp<=0;
  }
}
