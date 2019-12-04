//Ruben de Jager
class Speedster extends Grunt{
 
  Speedster(){
    enemyW=40;
    enemyH=40;
    enemyHP=1;
    enemySpeedX=4;
    enemySpeedY=4;
  }//constructor Speedster
    void enemyShow(){
    fill(229,143,23);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
  
}
