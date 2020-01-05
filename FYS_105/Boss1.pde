class Boss1 extends GameObject {

  Boss1() {
    tag = "enemy";
    enemyW=100;
    enemyH=146;
    hp=20;
    moveVelX=1;
    moveVelY=1;

    scoreGain = 100;

    float r = random(-1, 3);
    if (r <= 0) {
      enemyPosX = spawn.spawnerPos0.x - enemyW/2;
      enemyPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      enemyPosX = spawn.spawnerPos1.x - enemyW/2;
      enemyPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      enemyPosX = spawn.spawnerPos2.x;
      enemyPosY = spawn.spawnerPos2.y - enemyH/2;
    } else if (r > 2 && r <= 3) {
      enemyPosX = spawn.spawnerPos3.x;
      enemyPosY = spawn.spawnerPos3.y - enemyH/2;
    }
  }



  void draw() {
    checkPulse();
    pushStyle();
    noFill();
    stroke(255);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
    popStyle();

    enemyVector = new PVector(enemyPosX+enemyW/2, enemyPosY+enemyH/2);
    playerVector = new PVector(myPlayer.playerPosX+myPlayer.playerWidth/2, myPlayer.playerPosY+myPlayer.playerHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75 && angleBetweenVector < 0.75) {
      boss1U.draw(enemyPosX, enemyPosY);
      boss1U.update();
    }

    if ( (angleBetweenVector > 2.25 && angleBetweenVector < 3.2) || (angleBetweenVector < -2.25 && angleBetweenVector > -3.2) ) {
      boss1D.draw(enemyPosX, enemyPosY);
      boss1D.update();
    }

    //ENEMY MOVEMENT
    dx = myPlayer.playerPosX - enemyPosX;
    dy = myPlayer.playerPosY - enemyPosY;

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);


    enemyPosX += dx;
    enemyPosY += dy;



    if (Dead())
    {
      Remove(this);
    }
  }//enemyShow


  void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player
      if (enemyPosX < myPlayer.playerPosX + myPlayer.playerWidth && enemyPosX + enemyW > myPlayer.playerPosX && enemyPosY < myPlayer.playerPosY + myPlayer.playerHeight && enemyPosY + enemyH > myPlayer.playerPosY)
      {
        UI.spelerhit();
        hp = 0;
      }

      //Collision with Bullet
      if (enemyPosX < GameObjectRef.gameObject.get(i).bulletPosX + GameObjectRef.gameObject.get(i).bulletWidth && enemyPosX + enemyW > GameObjectRef.gameObject.get(i).bulletPosX && enemyPosY < GameObjectRef.gameObject.get(i).bulletPosY + GameObjectRef.gameObject.get(i).bulletHeight && enemyPosY + enemyH > GameObjectRef.gameObject.get(i).bulletPosY)
      {
        hp=hp-1;
        Remove(GameObjectRef.gameObject.get(i));
        gamemngr.shakeAmount = 3;
        gamemngr.shake = true;
        if (hp == 0) {
          ascore.score += scoreGain;
        }
        for (int j=0; j < 20; j++) {
          Add(new Particle(enemyPosX + enemyW/2, enemyPosY + enemyH/2));
        }//for
      }
    }
  }



  boolean Dead() {
    return hp<=0;
  }
}
