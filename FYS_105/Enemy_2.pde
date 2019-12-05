//Ruben de Jager
class Speedster extends Grunt{
 
  Speedster(){
    enemyW=20;
    enemyH=24;
    enemyHP=1;
    enemySpeedX=4;
    enemySpeedY=4;
  }//constructor Speedster
    void enemyShow(){
    fill(229,143,23);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  
  
}
