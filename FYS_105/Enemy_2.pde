//Ruben de Jager
class Speedster extends Enemys{
 
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
  
  void enemyUpdate(){
    
  }//enemyUpdate
  
  void pulseCheck(){
    
  }//pulseCheck
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
  
}
