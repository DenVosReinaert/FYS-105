//Ruben de Jager
class Grunt extends Enemies {

  Grunt() {
    tag = "enemy";

    enemyW=16;
    enemyH=20;
    enemyHP=2;

    enemySpeedX=2;
    enemySpeedY=2;
  }//constructor Grunt



  void setup() {
    //dit moet in een array, de float "r" moet in draw want die moet veranderen, maar de enemies moeten 1 keer spawnen
    float r = random(0, 3);

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
