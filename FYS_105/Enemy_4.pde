class Brute extends Grunt{

  Brute(){
    enemyW=30;
    enemyH=30;
    enemyHP=4;
    enemySpeedX=1;
    enemySpeedY=1;

  }//constructor Brute

  void enemyShow(){
    fill(9,36,145);
    rect(enemyPosX,enemyPosY,enemyW,enemyH);
  }

}
