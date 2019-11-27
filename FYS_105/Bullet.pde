class Bullet {
  
  float bulletPosX;
  float bulletPosY;
  float bulletWidth;
  float bulletFill;
  float bulletXVelocity;
  float bulletYVelocity;
  float velocity;
  float timer;
  PVector startPos;
  
  boolean bulletHit = false;

  Bullet(PVector startPos) {
    this.startPos = startPos;
    velocity = 5;
    bulletWidth = 5;
    bulletFill = 0;
    bulletPosX = startPos.x;
    bulletPosY = startPos.y;

    //this changes the direction of the bullets depending on the button you press
    if (player.shootUp) {
      bulletYVelocity = -velocity;
    } else if (player.shootDown) {
      bulletYVelocity = velocity;
    } else if (player.shootRight) {
      bulletXVelocity = velocity;
    } else if (player.shootLeft) {
      bulletXVelocity = -velocity;
    }
  }

  Bullet(float incomingDX, float incomingDY) {
   // x = player.xPosition;  //x position of bullet begins on y position of player
  //  y = player.yPosition;  //y position of bullet begins on y position of player
//    dx = incomingDX;    
  //  dy = incomingDY;  // shooting bullet straight up
    bulletWidth = 20;
  }

  void draw() {
    //this is the bullet
    fill(bulletFill);
    rect(bulletPosX, bulletPosY, bulletWidth, bulletWidth);
    bulletPosX += bulletXVelocity;
    bulletPosY += bulletYVelocity;
    
    //ENTER BULLET COLLISION IN STATEMENT BELOW
    if(1 > 0)
    {
      bulletHit = true;
    }
    else bulletHit = false;
  }

  //void removeBullet() {

  //  int i = player.bulletList.size() - 1;
  //  while (i >= 0) {
  //    //GameObject thing = player.bulletList.get(i);
  //    GameObject thing = this.bulletList.get(i);
  //    thing.show();
  //    thing.act();
  //    if (thing.hasDied()) {
  //      player.bulletList.remove(i);
  //    }
  //    i--;
  //  }
  //}
}
