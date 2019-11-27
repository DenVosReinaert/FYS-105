import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Halleluyah we got GitHub
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
boolean game;
boolean upKey, leftKey, downKey, rightKey, onekey, twokey, threekey, upkey;

// DIT MOET NOG ERGENS ANDERS :D
String dbHost = "oege.ie.hva.nl"; // if you are using a using a local database, this should be fine
String dbPort = "3306"; // replace with database port, MAMP standard is 8889
String dbUser = "koeneqt"; // replace with database username, MAMP standard is "root"
String dbPass = "7EwwK5+iBmUXUd";  // replace with database password, MAMP standard is "root"
String dbName = "zkoeneqt"; // replace with database name
//

Player thePlayer;
healthBar healthbar;
GameOver gameover;
//database db;
aScore ascore;
Map map;
Game_Manager gamemngr;
MySQL msql;

void setup()
{
  size(1920, 1080);
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  game = true;
  gameover = new GameOver();
  healthbar = new healthBar();
  gamemngr = new Game_Manager();
  thePlayer = new Player();
  ascore = new aScore();
  map = new Map();

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
  //Walking
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  thePlayer.setMove(keyCode, true);
  //Shooting
   if (key == 'LEFT') {
    leftKey = true;
    lookingLeft = true;
    lookingUp = false;
    lookingRight = false;
    lookingDown = false;
  }
  if (key == 'DOWN') {
    downKey = true;
    lookingLeft = false;
    lookingUp = false;
    lookingRight = false;
    lookingDown = true;
  }
  if (key == 'RIGHT') {
    rigthKey = true;
    lookingLeft = false;
    lookingUp = false;
    lookingRight = true;
    lookingDown = false;
  }
  if (key == 'UP') {
    upKey = true;
    lookingLeft = false;
    lookingUp = true;
    lookingRight = false;
    lookingDown = false;
  }
  
  if (key == 'i') upkey = true;
  if (key == '1') onekey = true;
  if (key == '2') twokey = true;
  if (key == '3') threekey = true;
}

void keyReleased() {
  //Walking
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  thePlayer.setMove(keyCode, false);
  //Shooting
  if (key == 'LEFT') leftKey = false;
  if (key == 'DOWN') downKey = false;
  if (key == 'RIGHT') rightKey = false;
  if (key == 'UP') upKey = false;
  if (key == '1') onekey = true;
  if (key == '2') twokey = true;
  if (key == '3') threekey = true;
}