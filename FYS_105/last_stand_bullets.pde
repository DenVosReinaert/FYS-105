final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
Player player;
Bullet bullet;

void setup() {
  size(1280, 720);
  player = new Player();
}

void draw() {
  background(255);
  player.draw();
}
void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  player.setMove(keyCode, true);
  player.setDirection(keyCode, true);
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  player.setMove(keyCode, false);
  player.setDirection(keyCode, false);
}
