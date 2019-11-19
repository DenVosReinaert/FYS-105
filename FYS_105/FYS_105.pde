//Halleluyah we got GitHub
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

int vHoogte;

Player thePlayer;
Highscore highscore;
Map map;

void setup()
{
  size(1920, 1080);

  vHoogte = 1000;
  thePlayer = new Player();
  highscore = new Highscore();
  map = new Map();

  pushStyle();
  fill(255);
  popStyle();
}

void draw()
{
  clear();
  map.mapDraw();

  highscore.draw();
  thePlayer.move();
  thePlayer.display();
}
void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  thePlayer.setMove(keyCode, true);
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  thePlayer.setMove(keyCode, false);
}
