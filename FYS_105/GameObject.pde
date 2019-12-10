abstract class GameObject {


  ArrayList<GameObject> gameObject = new ArrayList();

  float cooldown, threshold;

  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;

  boolean lookingUp, lookingLeft, lookingRight = false;
  boolean lookingDown = true;

  String tag;

  float bulletPosX, bulletPosY;
  float enemyPosX, enemyPosY, enemyW, enemyH, enemyHP, enemySpeedX, enemySpeedY;
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, hp;
  float defaultSpeed = 5;
  float diaSpeed = (sqrt(pow(defaultSpeed, 2) + pow(defaultSpeed, 2)) / 2); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.
  GameObject() {
  }

  void show() {
  }

  void act() {
  }

  boolean hasDied() {
    return false;
  }

  float x, y, dx, dy, w, h, hp;

  float enemyPosX, enemyPosY;
  float bulletPosX, bulletPosY, bulletWidth, bulletHeight;
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, playerHP;
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
