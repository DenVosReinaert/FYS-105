class Boss1 extends GameObject {

  Boss1(int spawnLocation) {
    enemyW=65;
    enemyH=80;
    enemyHP=20;
    enemySpeedX=0.03;
    enemySpeedY=0.03;

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
  }



  void draw() {
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
  }//enemyShow
}
