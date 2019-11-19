//Halleluyah we got GitHub


float vHoogte;
boolean game;
boolean dood;
boolean mainMenu;


Player thePlayer;
Moving_Platform platformM;
Highscore highscore;
healthBar healthbar;
Map map;
Game_Manager gamemngr;

void setup()
{
  size(1920, 1080);

  game = true;
  gamemngr = new Game_Manager();
  vHoogte = 1000f / 1080f * height;
  thePlayer = new Player();
  highscore = new Highscore();
  map = new Map();
  healthbar = new healthBar();

  pushStyle();
  fill(255);
  platformM = new Moving_Platform();
  popStyle();
}

void draw()
{
  clear();
  gamemngr.draw();
}
