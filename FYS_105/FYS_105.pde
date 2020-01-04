
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

boolean game, works;

// DIT MOET NOG ERGENS ANDERS :D
String dbHost = "oege.ie.hva.nl"; 
String dbPort = "3306"; 
String dbUser = "koeneqt"; 
String dbPass = "7EwwK5+iBmUXUd"; 
String dbName = "zkoeneqt";
//

LevelManager lvlMngr;

hScorelijst hscorel;
Powerups PowerUps;
Player player;
UI UI;
GameOver gameover;
aScore ascore;
Game_Manager gamemngr;
MySQL msql;
Player myPlayer;
//Gun myGun;
Spawner spawn;
GameObject GameObjectRef;


void setup()
{
  //For background tiles
  //X: -10
  //Y: -90
  size(1280, 720);
  minim = new Minim(this);

  LoadAssets();

  myPlayer = new Player();
  PowerUps = new Powerups();
  UI = new UI();
  spawn = new Spawner();
  gamemngr = new Game_Manager();

  gamemngr.home = true;

  lvlMngr = new LevelManager();
  ascore = new aScore();
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  gameover = new GameOver();
  GameObjectRef = new GameObject();

  lvlMngr.setup();
}


void Work()
{
  if (!works)
  {
    works = true;
  }
}






void draw()
{
  clear();
  lvlMngr.draw();
  gamemngr.draw();
  UI.draw();


  if (game)
    GameObjectRef.draw();
    PowerUps.draw();
}


void keyPressed() {
  // To check if you can die..
  if (key == 'p') {
   UI.spelerhit(); 
  }

  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  gamemngr.keyPressed();
}

void keyReleased() {
  //Walking
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
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
