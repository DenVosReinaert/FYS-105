class Boss1 extends GameObject {

  Boss1() {
    tag = "enemy";
    idAchievement[1] = 3;
    objWidth=100;
    objHeight=146;
    hp=20;
    hpBarTotalInit = 100;
    hpBarTotal = hpBarTotalInit;
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
    EnemyHealthBar();

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
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);



    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;




    if (Dead())
    {
      spawn.totalEnemyCount--;
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

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        //shield will go down with 2 because you have 2 shield AND
        //levens will go down with 1
        if (UI.shield >= 2) {
          UI.hitValueShield = 2;
          UI.hitValue = 1;
        } 
        //shield will go down with 1 because you have 1 shield AND
        //levens will go down with 2
        else if (UI.shield == 1) {
          UI.hitValueShield = 1;
          UI.hitValue = 2;
        } 
        //levens will go down with 3 because you have no shield
        else if (UI.levens > 0 && UI.shield <=0) {
          UI.hitValue = 3;

        }
        hp = 0;
        UI.spelerhit();
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp--;

          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            //if (msql.connect())
            //{
            //  msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM User_has_Achievements INNER JOIN Achievements ON User_has_Achievements.Achievements_idAchievements = Achievements.idAchievement WHERE Achievements_idAchievements = '%s' AND User_idUser = '%s'", (chieves.bossCounter + 1), idAchievement[1], User.currentUser);

            //  chieves.UnlockAchievement(3);
            //}

            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleBoss(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  boolean Dead() {
    return hp<=0;
  }
}
