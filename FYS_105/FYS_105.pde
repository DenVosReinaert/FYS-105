import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;

import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Halleluyah we got GitHub
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
boolean game;
boolean mainmenu;

// DIT MOET NOG ERGENS ANDERS :D
String dbHost = "oege.ie.hva.nl"; // if you are using a using a local database, this should be fine
String dbPort = "3306"; // replace with database port, MAMP standard is 8889
String dbUser = "koeneqt"; // replace with database username, MAMP standard is "root"
String dbPass = "7EwwK5+iBmUXUd";  // replace with database password, MAMP standard is "root"
String dbName = "zkoeneqt"; // replace with database name
//

int vHoogte;

healthBar healthbar;
GameOver gameover;
Spawner spawner;
//database db;
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
  gamemngr = new Game_Manager();
  myPlayer = new Player();
  bengine = new BulletEngine();
  spawn = new Spawner();
  ascore = new aScore();
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  game = true;
  gameover = new GameOver();
  healthbar = new healthBar();
  // vHoogte = 1000;

  pushStyle();
  fill(255);
  popStyle();
}

void draw()
{
  clear();
  gamemngr.draw();
}
void keyPressed() {
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
}
