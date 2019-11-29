int vHoogte;

Player thePlayer;
Moving_Platform platform;
Highscore highscore;
Map map;
ArrayList<Bullet> theBullet;

void setup()
{
  size(1920, 1080);

  vHoogte = 1000;
  thePlayer = new Player();
  highscore = new Highscore();
  map = new Map();
  theBullet = new ArrayList<Bullet>();

  pushStyle();
  fill(255);
  platform = new Moving_Platform();
  popStyle();
}

void draw()
{
  clear();
  map.mapDraw();

  platform.draw(width/2 - platform.sizeX/2, height/2 + 300);
  highscore.draw();
  thePlayer.draw();
  thePlayer.keyReleased();
  displayBullet();
}

void keyPressed(){
  keybullet();
}//keypressed
