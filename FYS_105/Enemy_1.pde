class Enemy1 {

  float spawnX=width-50;
  float spawnY=height-height/9;
  float enemyPosX, enemyPosY, playerPosX, playerPosY;
  float radius=50;
  float move=4;
  float run=7;
  float moveUp;
  float eyeSight=50;
  boolean lockedOn = false;
  Enemy1() {
  }



  void show() {
    fill(255);
    ellipse(spawnX, spawnY, radius, radius);
  }  
  void update() {
    spawnX=spawnX-move;//Beweegt de enemy binnen het scherm

    //Player visible?
    if (playerPosX > enemyPosX - eyeSight || playerPosX < enemyPosX + radius + eyeSight)
      lockedOn = true;

    if (lockedOn)
    {
      if ( enemyPosX != playerPosX && (enemyPosX < playerPosX || enemyPosX > playerPosX))//Als de enemy de speler ''ziet'', gaat hij de speler volgen
      {
        if (enemyPosX < playerPosX)
        {
          enemyPosX += run;
        } else if (enemyPosX > playerPosX)
        {
          enemyPosX -= run;
        } else ijsbeer();
      }
    }
  } 

  void edge() {
    if (spawnX + radius>width) {
      move=-move;
    }
    if (spawnX - radius < 0) {
      move=-move;
    }
    if (spawnY<0) {
    }
    if (spawnY+radius>height) {
    }
  }  


  void kill() {
  }  

  void ijsbeer() {
    enemyPosX=enemyPosX+move;
    if (!lockedOn) {
      move=-move;
    }
  }
}
