//Ruben de Jager
class Speedster extends Enemies{
 
  Speedster(){
    enemyW=40;
    enemyH=40;
    enemyHP=20;
    enemySpeedX=5;
    enemySpeedY=5;
  }//constructor Speedster
    void enemyShow(){
    fill(229,143,23);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
  
}
