abstract class GameObject {
  
<<<<<<< Updated upstream
  float x, y, dx, dy, w, h, hp;
=======
  float enemyPosX, enemyPosY;
  float bulletPosX, bulletPosY, bulletWidth, bulletHeight;
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, playerHP;
  float defaultSpeed = 5;
  float diaSpeed = (defaultSpeed * (sqrt(pow(10, 2) + pow(10, 2)) / 20)); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.
  
>>>>>>> Stashed changes
  
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
