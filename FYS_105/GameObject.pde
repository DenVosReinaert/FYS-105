abstract class GameObject {


  ArrayList<GameObject> gameObject;

  float cooldown, threshold;

  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;

  boolean lookingUp, lookingLeft, lookingRight = false;
  boolean lookingDown = true;

  String tag;

  float bulletPosX, bulletPosY, bulletWidth, bulletHeight;
  float enemyPosX, enemyPosY, enemyW, enemyH, enemyHP, enemySpeedX, enemySpeedY;
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, hp;
  float defaultSpeed = 5;
  float diaSpeed = (sqrt(pow(defaultSpeed, 2) + pow(defaultSpeed, 2)) / 2); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.



  GameObject() {
 gameObject = new ArrayList<GameObject>(200);
  }


  void draw()
  {    
    //ENEMY MOVEMENT
    if (dist(myPlayer.playerPosX, myPlayer.playerPosY, enemyPosX, enemyPosY) < 1000) { 
      if (myPlayer.playerPosX > enemyPosX) {
        enemyPosX += enemySpeedX;
      }//if
      if (myPlayer.playerPosX < enemyPosX) {
        enemyPosX -= enemySpeedX;
      }//if
      if (myPlayer.playerPosY < enemyPosY) {
        enemyPosY -= enemySpeedY;
      } //if
      else {
        enemyPosY += enemySpeedY;
      }//else
    }
  }//enemyUpdate

  boolean Dead() {
    return false;
  }
}
