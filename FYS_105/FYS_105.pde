import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

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

int vHoogte;

hScorelijst hscorel;
healthBar healthbar;
UI UI;
GameOver gameover;
//database db;
aScore ascore;
Game_Manager gamemngr;
MySQL msql;
BulletEngine bengine;
Player myPlayer;
Gun myGun;

void setup()
{
  size(1280, 720);
  myPlayer = new Player();
  UI = new UI();
  bengine = new BulletEngine();
  gamemngr = new Game_Manager();
  ascore = new aScore();
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  gamemngr.home = true;
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
