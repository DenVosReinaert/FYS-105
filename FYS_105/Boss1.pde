class Boss1 extends GameObject {

  Boss1() {
    tag = "enemy";
    enemyW=65;
    enemyH=80;
    enemyHP=20;
    enemySpeedX=1;
    enemySpeedY=1;


    float r = random(-1, 3);
    if (r <= 0) {
      enemyPosX = spawn.spawnerPos0.x;
      enemyPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      enemyPosX = spawn.spawnerPos1.x;
      enemyPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      enemyPosX = spawn.spawnerPos2.x;
      enemyPosY = spawn.spawnerPos2.y;
    } else if (r > 2 && r <= 3) {
      enemyPosX = spawn.spawnerPos3.x;
      enemyPosY = spawn.spawnerPos3.y;
    }
  }



  void draw() {
    checkPulse();
    fill(255, 0, 0);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);

    //ENEMY MOVEMENT
    if (dist(myPlayer.playerPosX, myPlayer.playerPosY, enemyPosX, enemyPosY) < 1000) { 
      if (myPlayer.playerPosX > enemyPosX) {
        enemyPosX += enemySpeedX;
      }//if
      if (myPlayer.playerPosX < enemyPosX) {
        enemyPosX -= enemySpeedX;
      }//if
      if (myPlayer.playerPosY < enemyPosY) {
        enemyPosY -= enemySpeedY;
      } //if
      else {
        enemyPosY += enemySpeedY;
      }//else
    }

    if (Dead())
    {
      Remove(this);
    }
  }//enemyShow


  void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {
      if (dist(enemyPosX, enemyPosY, myPlayer.playerPosX, myPlayer.playerPosY) < 10) {
        UI.spelerhit();
        enemyHP = 0;
      }

      if (GameObjectRef.gameObject.get(i).bulletPosX > 0 && GameObjectRef.gameObject.get(i).bulletPosY > 0) {
        if (GameObjectRef.gameObject.get(i).bulletPosX == 0)
          GameObjectRef.gameObject.get(i).bulletPosX = -10000;
        if (GameObjectRef.gameObject.get(i).bulletPosY == 0)
          GameObjectRef.gameObject.get(i).bulletPosY = -10000;
        if (dist(enemyPosX, enemyPosY, GameObjectRef.gameObject.get(i).bulletPosX, GameObjectRef.gameObject.get(i).bulletPosY) < 20) {
          enemyHP=enemyHP-1;
          Remove(GameObjectRef.gameObject.get(i));
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (enemyHP == 0) {
            ascore.score += 5;
          }
          for (int j=0; j < 20; j++) {
            Add(new Particle(enemyPosX, enemyPosY));
          }//for
        }
      }
    }
  }



  boolean Dead() {
    return enemyHP<=0;
  }
}
