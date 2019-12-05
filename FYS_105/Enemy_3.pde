//Ruben de Jager
class Heavy extends Enemies{
  
  Heavy(){
    enemyW=60;
    enemyH=50;
    enemyHP=6;
    enemySpeedX=0.75;
    enemySpeedY=0.75; 
  }//constructor Heavy
  void enemyShow(){
    fill(91,80,80);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
}
