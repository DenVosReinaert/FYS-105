abstract class GameObject {
  
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, hp;
  float defaultSpeed = 5;
  float diaSpeed = (defaultSpeed * (sqrt(pow(10, 2) + pow(10, 2)) / 20)); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.
  GameObject(){
    
  }
  
  void show() {
    
  }
  
  void act() {
    
  }
  
  boolean hasDied() {
    return false;
  }
  
}
