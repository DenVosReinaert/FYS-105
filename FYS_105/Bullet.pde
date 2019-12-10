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

}
