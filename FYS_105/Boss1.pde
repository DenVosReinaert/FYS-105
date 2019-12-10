class Boss1 extends Grunt{

  Boss1(){
    enemyW=65;
    enemyH=80;
    enemyHP=20;
    enemySpeedX=0.03;
    enemySpeedY=0.03;
  }
  void enemyShow(){
    fill(255,0,0);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }//enemyShow
}
