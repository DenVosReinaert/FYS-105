//Ruben de Jager
class Heavy extends Enemys{
  
  Heavy(){
    enemyW=60;
    enemyH=60;
    enemyHP=80;
    enemySpeedX=0.75;
    enemySpeedY=0.75; 
  }//constructor Heavy
  void enemyShow(){
    fill(91,80,80);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  void enemyUpdate(){
    
  }//enemyUpdate
  
  void pulseCheck(){
    
  }//pulseCheck
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
}
