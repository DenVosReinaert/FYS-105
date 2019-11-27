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

    Bullet(float incomingDX, float incomingDY) {
    x = myPlayer.x;  //x position of bullet begins on y position of player
    y = myPlayer.y;  //y position of bullet begins on y position of player
    dx = incomingDX;    
    dy = incomingDY;  // shooting bullet straight up
    w = 20;
    h = 20;
  }

  void draw() {
    //this is the bullet
    fill(bulletFill);
    rect(bulletPosX, bulletPosY, bulletWidth, bulletWidth);
    bulletPosX += bulletXVelocity;
    bulletPosY += bulletYVelocity;
  }

  void removeBullet() {
  timer = timer + 1;
  
  int i = engine.size() - 1;
  while (i >= 0) {
    GameObject thing = engine.get(i);
    thing.show();
    thing.act();
    if (thing.hasDied()) {
      engine.remove(i);
    }
    i--;
  }

  }

  void collision() {
  }
