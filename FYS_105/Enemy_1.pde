//Ruben de Jager
class Grunt extends Enemys{
  
  
  Grunt(){
    enemyW=40;
    enemyH=40;
    enemyHP=30;
    enemySpeedX=2;
    enemySpeedY=2;
  }//constructor Grunt
    void enemyShow(){
    fill(65,17,96);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
  
  void enemyUpdate(){
    
  }//enemyUpdate
  
  void pulseCheck(){
    
  }// pulseCheck
  
  boolean Dead(){
    return enemyHP<=0;
  }//boolean Dead
  
}//class Grunt
