class Bullet {

  float bulletPosX;
  float bulletPosY;
  float bulletWidth;
  float bulletFill;
  float bulletXVelocity;
  float bulletYVelocity;
  float velocity;
  PVector startPos;

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
  void draw() {
    //this is the bullet
    fill(bulletFill);
    rect(bulletPosX, bulletPosY, bulletWidth, bulletWidth);
    bulletPosX += bulletXVelocity;
    bulletPosY += bulletYVelocity;
  }

  void collision() {
  }
}
