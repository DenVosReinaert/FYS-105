//Ruben de Jager
class Speedster extends GameObject {

  Speedster() {
    tag = "enemy";

    enemyW=20;
    enemyH=24;
    enemyHP=1;
    enemySpeedX=2;
    enemySpeedY=2;

    float spawnLocation = random (-1, 3);

    if (spawnLocation == 0)
    {
      enemyPosX = spawn.spawnerPos0.x;
      enemyPosY = spawn.spawnerPos0.y;
    }

    else if (spawnLocation == 1)
    {
      enemyPosX = spawnerPos1.x;
      enemyPosY = spawnerPos1.y;
    }

    else if (spawnLocation == 2)
    {
      enemyPosX = spawnerPos2.x;
      enemyPosY = spawnerPos2.y;
    }

    else if (spawnLocation == 3)
    {
      enemyPosX = spawnerPos3.x;
      enemyPosY = spawnerPos3.y;
    }
  }//constructor Speedster




  void draw() {
    checkPulse();

    fill(229, 143, 23);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);

    //ENEMY MOVEMENT
    if (dist(myPlayer.playerPosX, myPlayer.playerPosY, enemyPosX, enemyPosY) < 2000) { 
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
        healthbar.spelerhit();
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
  }//boolean Dead
}
