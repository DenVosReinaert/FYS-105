//Halleluyah we got GitHub


float vHoogte;

Player thePlayer;
Moving_Platform platformM;
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
  platformM = new Moving_Platform();
  popStyle();
}

void draw()
{
  clear();
  map.mapDraw();

  platformM.draw((width/2 - platformM.sizeX/2) / 1920f * width, ((height/2 + 300f) / 1080f * height));
  highscore.draw();
  thePlayer.draw();
  thePlayer.keyReleased();
}
