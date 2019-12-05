//Ruben de Jager
class Enemies extends GameObject {

  float enemyPosX, enemyPosY, enemyW, enemyH, enemyHP, enemySpeedX, enemySpeedY;

  Enemies() {
  }//constructor Enemys

  void enemyShow() {
  }//enemyShow

  void enemyUpdate() {
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
  }//enemyUpdate

  void checkPulse() {//Checks the enemy's collision with the player's bullet
    if (dist(enemyPosX, enemyPosY, myPlayer.playerPosX, myPlayer.playerPosY) < 10) {
      healthbar.spelerhit();
      enemyHP = 0;
    }

    for (int i = 0; i < bengine.engine.size(); i ++)
    {
      if (bengine.engine.get(i).bulletPosX > 0 && bengine.engine.get(i).bulletPosY > 0) {

        if (bengine.engine.get(i).bulletPosX == 0)
          bengine.engine.get(i).bulletPosX = -10000;

        if (bengine.engine.get(i).bulletPosY == 0)
          bengine.engine.get(i).bulletPosY = -10000;

        if (dist(enemyPosX, enemyPosY, bengine.engine.get(i).bulletPosX, bengine.engine.get(i).bulletPosY) < 20) {
          enemyHP=enemyHP-1;
          ascore.score += 5;
          bengine.engine.remove(i);
          for (int j=0; j<5; j++) {
            gamemngr.AI.add(new Particle(enemyPosX, enemyPosY));
          }//for
        }
      }
    }
    //for (int i = 0; i > gamemngr.AI.size(); i++){
    //  GameObject thing = bengine.engine.get(i);
    //  if(thing instanceof Bullet){
    //    if(rectRect(enemyPosX,enemyPosY,enemyW,enemyH,thing.playerPosX,thing.playerPosY,5,5)){
    //      enemyHP=enemyHP-1;
    //      thing.hp=0;
    //      for(int j=0;j<5;j++){
    //      gamemngr.AI.add(new Particle(thing.playerPosX,thing.playerPosY));
    //      }//for
    //    }//if
    //  }//if
    //  i++; 
    //}//whileloop
  }//checkPulse

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
    enemyHP=random(20, 100);
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
