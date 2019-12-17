//Ruben de Jager
class Heavy extends Enemies {

  Heavy(int spawnLocation) {
    tag = "enemy";

    enemyW=60;
    enemyH=60;
    enemyHP=80;
    enemySpeedX=0.75;
    enemySpeedY=0.75;

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
  }//constructor Heavy




  void draw() {
    fill(91, 80, 80);
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
}
