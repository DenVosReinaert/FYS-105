class Brute extends GameObject {

  Brute() {
    tag = "enemy";

    scoreGain = 7;

    enemyW=30;
    enemyH=30;
    hp=4;
    moveVelX=1;
    moveVelY=1;

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
  }//constructor Brute




  void draw() {
    checkPulse();
    pushStyle();
    fill(9, 36, 145);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
    popStyle();
    //ENEMY MOVEMENT
    if (dist(myPlayer.playerPosX + myPlayer.playerWidth/2, myPlayer.playerPosY + myPlayer.playerHeight/2, enemyPosX + enemyW/2, enemyPosY + enemyH/2) < 2000) { 
      if (myPlayer.playerPosX > enemyPosX) {
        enemyPosX += moveVelX;
      }//if
      if (myPlayer.playerPosX < enemyPosX) {
        enemyPosX -= moveVelX;
      }//if
      if (myPlayer.playerPosY < enemyPosY) {
        enemyPosY -= moveVelY;
      } //if
      else {
        enemyPosY += moveVelY;
      }//else
    }

    if (Dead())
    {
      Remove(this);
    }
  }


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
        ascore.combo += 0.1;
        println("combo increase!");
        gamemngr.shakeAmount = 3;
        gamemngr.shake = true;
        if (hp == 0) {
          ascore.score += scoreGain * ascore.combo;
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
