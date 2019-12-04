//Ruben de Jager
abstract class Enemies{
  
 float enemyPosX,enemyPosY,enemyW,enemyH,enemyHP,enemySpeedX,enemySpeedY;
  
  Enemies(){
  }//constructor Enemys
  
  void enemySpawn(){
    
  }
  
  void enemyShow(){
    
  }//enemyShow
  
  void enemyUpdate(){
    
  }//enemyUpdate
  
  void checkPulse(){//Checks the enemy's collision with the player's bullet
    
  }//checkPulse
  
  boolean Dead(){
    return false;
  }//boolean Dead
}//abstract class Enemys

class Particle extends Enemies{
  Particle(float incomingX,float incomingY){
    enemyPosX=incomingX;
    enemyPosY=incomingY;
    enemySpeedX=random(-5,5);
    enemySpeedY=random(-5,5);
    enemyHP=random(100,255);
    enemyW=5;
    enemyH=5;
  }//constructor Particle
  
  void enemyShow(){
    fill(219,8,8,enemyHP);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
    
  }//enemyShow
  
  void enemyUpdate(){
    enemyPosX=enemyPosX+enemySpeedX;
    enemyPosY=enemyPosY+enemySpeedY;
    
    enemyHP=enemyHP-2;
  }//enemyUpdate
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
}//class Particle
