//Halleluyah we got GitHub


float vHoogte;

Player thePlayer;
Platform platform;
Highscore highscore;
Map map;

void setup()
{
  size(1920, 1080);

  vHoogte = 1000f / 1080f * height;
  thePlayer = new Player();
  highscore = new Highscore();
  map = new Map();

  pushStyle();
  fill(255);
  platform = new Platform();
  popStyle();
}

void draw()
{
  clear();
  map.mapDraw();

  platform.draw((width/2 - platform.sizeX/2) / 1920f * width, ((height/2 + 300f) / 1080f * height));
  highscore.draw();
  thePlayer.draw();
  thePlayer.keyReleased();
  thePlayer.Move();
}
