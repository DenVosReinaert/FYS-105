
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Halleluyah we got GitHub
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
boolean game;

// DIT MOET NOG ERGENS ANDERS :D
String dbHost = "oege.ie.hva.nl"; // if you are using a using a local database, this should be fine
String dbPort = "3306"; // replace with database port, MAMP standard is 8889
String dbUser = "koeneqt"; // replace with database username, MAMP standard is "root"
String dbPass = "7EwwK5+iBmUXUd";  // replace with database password, MAMP standard is "root"
String dbName = "zkoeneqt"; // replace with database name
//


LevelManager lvlMngr;

hScorelijst hscorel;
healthBar healthbar;
UI UI;
GameOver gameover;
aScore ascore;
Game_Manager gamemngr;
MySQL msql;
BulletEngine bengine;
Player myPlayer;
Gun myGun;
Spawner spawn;



void setup()
{
  size(1280, 720);
  minim = new Minim(this);

  LoadAssets();

  myPlayer = new Player();
  UI = new UI();
  bengine = new BulletEngine();
  spawn = new Spawner();
  gamemngr = new Game_Manager();

  gamemngr.home = true;

  lvlMngr = new LevelManager();
  ascore = new aScore();
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  gameover = new GameOver();
  healthbar = new healthBar();



  lvlMngr.setup();
}



void draw()
{
  clear();
  lvlMngr.draw();
  gamemngr.draw();


  if (game)
    myPlayer.show();
}


void keyPressed() {
  if (key == 'p') {
   spawn.timer = 18525;
  }

  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  // thePlayer.setMove(keyCode, true);
  gamemngr.keyPressed();
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  // thePlayer.setMove(keyCode, false);
  gamemngr.keyReleased();

  background.resize(width, height);
}



public float Calculate(String orientation, float size)
{
  float result = 0;

  if (orientation == "x" || orientation == "X")
  {
    result = size / 1280 * width;
  } else 
  if (orientation == "y" || orientation == "Y")
  {
    result = size / 720 * height;
  }

  return result;
}
