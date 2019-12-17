class Brute extends Enemies {

  Brute(int spawnLocation) {
    enemyW=30;
    enemyH=30;
    enemyHP=4;
    enemySpeedX=1;
    enemySpeedY=1;

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
  }//constructor Brute




  void draw() {
    fill(9, 36, 145);
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
  }
}
