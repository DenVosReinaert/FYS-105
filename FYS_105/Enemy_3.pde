//Ruben de Jager
class Heavy extends Grunt{
  
  Heavy(){
    enemyW=60;
    enemyH=50;
    enemyHP=6;
    enemySpeedX=0.45;
    enemySpeedY=0.45; 
  }//constructor Heavy
  void enemyShow(){
    fill(91,80,80);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  
}
