//Ruben de Jager
class Enemies extends GameObject {



  Enemies() {
  }//constructor Enemys

  void enemyShow() {
  }//enemyShow

  void enemyUpdate() {
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
  }//enemyUpdate

  //void checkPulse(){//Checks the enemy's collision with the player's bullet
  //  for (int i = 0; i > gamemngr.AI.size(); i++){
  //    GameObject thing = bengine.engine.get(i);
  //    if(thing instanceof Bullet){
  //      if(rectRect(enemyPosX,enemyPosY,enemyW,enemyH,thing.playerPosX,thing.playerPosY,5,5)){
  //        enemyHP=enemyHP-1;
  //        thing.hp=0;
  //        for(int j=0;j<5;j++){
  //        gamemngr.AI.add(new Particle(thing.playerPosX,thing.playerPosY));
  //        }//for
  //      }//if
  //    }//if
  //    i++; 
  //  }//whileloop
  //}//checkPulse

  boolean Dead() {
    return false;
  }//boolean Dead
}//abstract class Enemys

class Particle extends Enemies {
  Particle(float incomingX, float incomingY) {
    enemyPosX=incomingX;
    enemyPosY=incomingY;
    enemySpeedX=random(-5, 5);
    enemySpeedY=random(-5, 5);
    enemyHP=random(100, 255);
    enemyW=5;
    enemyH=5;
  }//constructor Particle

  void enemyShow() {
    fill(219, 8, 8, enemyHP);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
  }//enemyShow

  void enemyUpdate() {
    enemyPosX=enemyPosX+enemySpeedX;
    enemyPosY=enemyPosY+enemySpeedY;

    enemyHP=enemyHP-2;
  }//enemyUpdate

  void checkPulse() {
  }//checkPulse

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}//class Particle
