//Ruben de Jager
class Heavy extends Grunt{
  
  Heavy(){
    enemyW=60;
    enemyH=60;
    enemyHP=4;
    enemySpeedX=0.45;
    enemySpeedY=0.45; 
  }//constructor Heavy
  void enemyShow(){
    fill(91,80,80);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
}
