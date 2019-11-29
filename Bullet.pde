class Bullet extends GameObject {
  
  Bullet() {
    x = myPlayer.x;  //x position of bullet begins on y position of player
    y = myPlayer.y;  //y position of bullet begins on y position of player
    dx = 0;    
    dy = -15;   // shooting bullet straight up
    //hp = 1;
    w = 20;
    h = 20;
  }
  
    Bullet(float incomingDX, float incomingDY) {
    x = myPlayer.x;  //x position of bullet begins on y position of player
    y = myPlayer.y;  //y position of bullet begins on y position of player
    dx = incomingDX;    
    dy = incomingDY;
    //hp = 1;
    w = 15;
    h = 15;
  }
  
  void show() {
  fill(255);
  rect(x, y, 5, 5);
  }
  
  void act() {
    x = x + dx;
    y = y + dy;
  }
  
    boolean hasDied() {
      return y < 0 || y > height || x < 0 || x > width;
    }
}
