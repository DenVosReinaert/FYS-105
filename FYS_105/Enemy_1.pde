//Ruben de Jager
class Grunt extends GameObject {

  Grunt() {
    tag = "enemy";

    scoreGain = 5;

    enemyW=16;
    enemyH=20;
    hp=2;

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
  }//constructor Grunt





  void draw() {
    checkPulse();
pushStyle();
    fill(65, 17, 96);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
popStyle();
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
        UI.spelerhit();
        hp = 0;
      }

      if (GameObjectRef.gameObject.get(i).bulletPosX > 0 && GameObjectRef.gameObject.get(i).bulletPosY > 0) {
        if (GameObjectRef.gameObject.get(i).bulletPosX == 0)
          GameObjectRef.gameObject.get(i).bulletPosX = -10000;
        if (GameObjectRef.gameObject.get(i).bulletPosY == 0)
          GameObjectRef.gameObject.get(i).bulletPosY = -10000;
        if (dist(enemyPosX, enemyPosY, GameObjectRef.gameObject.get(i).bulletPosX, GameObjectRef.gameObject.get(i).bulletPosY) < 20) {
          hp=hp-1;
          Remove(GameObjectRef.gameObject.get(i));
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {
            ascore.score += scoreGain;
          }
          for (int j=0; j < 20; j++) {
            Add(new Particle(enemyPosX, enemyPosY));
          }//for
        }
      }
    }
  }

  boolean Dead() {
    return hp<=0;
  }//boolean Dead
}//class Grunt
