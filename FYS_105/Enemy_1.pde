//Ruben de Jager
class Grunt extends Enemies {

  Grunt(int spawnLocation) {
    tag = "enemy";

    enemyW=16;
    enemyH=20;
    enemyHP=2;

    enemySpeedX=2;
    enemySpeedY=2;

    if (spawnLocation == 0)
    {
      enemyPosX = spawn.spawnerPos0.x;
      enemyPosY = spawn.spawnerPos0.y;
    }

    if (spawnLocation == 1)
    {
      enemyPosX = spawnerPos1.x;
      enemyPosY = spawnerPos1.y;
    }

    if (spawnLocation == 2)
    {
      enemyPosX = spawnerPos2.x;
      enemyPosY = spawnerPos2.y;
    }

    if (spawnLocation == 3)
    {
      enemyPosX = spawnerPos3.x;
      enemyPosY = spawnerPos3.y;
    }
  }//constructor Grunt





  void draw() {

    fill(65, 17, 96);
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
  }//enemyShow

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}//class Grunt
