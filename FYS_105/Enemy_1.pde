//Ruben de Jager
class Grunt extends Enemies {

  Grunt() {
    enemyW=40;
    enemyH=40;
    enemyHP=2;
    enemySpeedX=2;
    enemySpeedY=2;
  }//constructor Grunt

  void enemySpawn() {
    //dit moet in een array, de float "r" moet in draw want die moet veranderen, maar de enemies moeten 1 keer spawnen
    float r = random(-1, 3);
    if (r <= 0) {
      enemyPosX = spawn.spawnerPosX0;
      enemyPosY = spawn.spawnerPosY0;
    } else if (r > 0 && r <= 1) {
      enemyPosX = spawn.spawnerPosX1;
      enemyPosY = spawn.spawnerPosY1;
    } else if (r > 1 && r <= 2) {
      enemyPosX = spawn.spawnerPosX2;
      enemyPosY = spawn.spawnerPosY2;
    } else if (r > 2 && r <= 3) {
      enemyPosX = spawn.spawnerPosX3;
      enemyPosY = spawn.spawnerPosY3;
    }
  }
  void enemyShow() {
    fill(65, 17, 96);
    rect(enemyPosX, enemyPosY, enemyW, enemyH);
  }//enemyShow
  
  void enemyUpdate(){
   if (dist(myPlayer.x, myPlayer.y, enemyPosX, enemyPosY) < 1000) { 
      if (myPlayer.x > enemyPosX) {
        enemyPosX += enemySpeedX;
        
      }//if
      if(myPlayer.x < enemyPosX) {
        enemyPosX -= enemySpeedX;
        
      }//if
      if (myPlayer.y < enemyPosY) {
        enemyPosY -= enemySpeedY;
        
      } //if
      else {
        enemyPosY += enemySpeedY;
        
      }//else
      
    }//if 
  }

void pulseCheck(){
  for (int i = 0; i > gamemngr.AI.size(); i++){
      GameObject thing = bengine.engine.get(i);
      if(thing instanceof Bullet){
        if(rectRect(enemyPosX,enemyPosY,enemyW,enemyH,thing.x,thing.y,5,5)){
          enemyHP=enemyHP-1;
          thing.hp=0;
          for(int j=0;j<5;j++){
          gamemngr.AI.add(new Particle(thing.x,thing.y));
          }//for
        }//if
      }//if
      i++; 
    }//whileloop
}//pulseCheck

  boolean Dead() {
    return enemyHP<=0;
  }//boolean Dead
}//class Grunt
