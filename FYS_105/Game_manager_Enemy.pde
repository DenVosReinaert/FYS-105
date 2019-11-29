ArrayList<Enemys> AI;
Player player;


void setup(){
  
  AI= new ArrayList<Enemys>(10000);
  player= new Player();
  size(1280,720);
  
}




void draw(){//This code draws the enemy in the game
  int i =AI.size()-1;
  while(i>=0){
  Enemys enm= AI.get(i);
  enm.enemyShow();
  enm.enemyUpdate();
  enm.checkPulse();
  if(enm.Dead()){
    AI.remove(i);
  }
  i--;
  }
}
