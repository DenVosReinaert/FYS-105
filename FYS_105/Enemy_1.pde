//Ruben de Jager
class Grunt extends GameObject {

  Grunt() {
    tag = "enemy";

    scoreGain = 5;

    objWidth=28;
    objHeight=40;
    hp=2;

    moveVelX=1;
    moveVelY=1;

    hitValue = 1;



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
  }//constructor Grunt





  void draw() {
    checkPulse();



    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75 && angleBetweenVector < 0.75) {
      gruntU.draw(objPosX, objPosY);
      gruntU.update();
    }
    if (angleBetweenVector > 0.75 && angleBetweenVector < 2.25) {
      gruntL.draw(objPosX, objPosY);
      gruntL.update();
    }
    if ( (angleBetweenVector > 2.25 && angleBetweenVector < 3.2) || (angleBetweenVector < -2.25 && angleBetweenVector > -3.2) ) {
      gruntD.draw(objPosX, objPosY);
      gruntD.update();
    }
    if (angleBetweenVector > -2.25 && angleBetweenVector < -0.75) {
      gruntR.draw(objPosX, objPosY);
      gruntR.update();
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
        UI.spelerhit();
        UI.levens -= hitValue;
        hp = 0;
      }      
      if (objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        UI.spelerhit();
        if (UI.levens >0 && UI.shield == 0) {
          UI.levens-= hitValue;
          hp = 0;
        } 
        if (UI.shield > 0) {
          UI.shield-= hitValue;
        }
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hp=hp-1;
          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          println("combo increase!");
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {
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
  }//boolean Dead
}//class Grunt
