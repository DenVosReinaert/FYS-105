import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.bezier.data.sql.*; 
import de.bezier.data.sql.mapper.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 
import ddf.minim.*; 
import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FYS_105 extends PApplet {











//Halleluyah we got GitHub
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];

boolean game, works;


LevelManager lvlMngr;

friends Friends;
Credits credits;
stats stats;
Login Login;
Shop shop;
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
AchievementManager chieves;
User User;
Powerups powerUps;


public void setup()
{
  


  minim = new Minim(this);

  LoadAssets();
  stats = new stats();
  Friends = new friends();
  User = new User();
  Login = new Login();
  myPlayer = new Player();
  UI = new UI();
  spawn = new Spawner();
  shop = new Shop();
  gamemngr = new Game_Manager();
  credits = new Credits();

  gamemngr.login = true;

  lvlMngr = new LevelManager();
  ascore = new aScore();
  msql = new MySQL( this, dbHost + ":" + dbPort, dbName, dbUser, dbPass );
  gameover = new GameOver();
  GameObjectRef = new GameObject();
  chieves = new AchievementManager();
  lvlMngr.setup();
}


public void Work()
{
  if (!works)
  {
    works = true;
  }
}






public void draw()
{
  clear();
  lvlMngr.draw();
  gamemngr.draw();
  UI.draw();


  if (game)
    GameObjectRef.draw();
}


public void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  gamemngr.keyPressed();
}

public void keyReleased() {
  //Walking
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  gamemngr.keyReleased();
  pushStyle();
  levelTemplate.resize(width, height);
  popStyle();
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
class AchievementAnimator extends GameObject
{
  Timer achievementRetractTimer = new Timer(10);

  int achievementNumber;



  AchievementAnimator(int achievementNumberInput, float objPosXInput, float objPosYInput)
  {

    chieves.achievementAnimsActive++;

    achievementNumber = achievementNumberInput;

    objPosX = objPosXInput;
    objPosY = objPosYInput;
    achievementRetractTimer.Reset();
  }



  public void draw()
  {
    switch(achievementNumber)
    {
    case 1:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 2:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 3:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 4:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 5:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 6:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 5;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 5;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    }
  }
}
class AchievementManager
{


  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements;
  String tempId;

  float startPosX, startPosY, endPosX, endPosY;

  float[] currentPosX = new float[totalAchievements];
  float[] currentPosY = new float[totalAchievements];

  int[] oldschoolTimer = new int[totalAchievements];

  //boolean[] achievementAnim = new boolean[totalAchievements];


  ArrayList<AchievementAnimator> achievementAnim = new ArrayList<AchievementAnimator>();



  AchievementManager()
  {
    totalAchievements = 6;

    msql.connect();
    achievementAnimsActive = 0;
  }





  public void draw()
  {
    for (int i = 0; i < achievementAnim.size(); i++)
    {
      achievementAnim.get(i).draw();
    }

    startPosX = width;
    startPosY = height - chievePlate[1].height - (chievePlate[1].height * achievementAnimsActive);

    endPosX = width - chievePlate[1].width;
    endPosY = startPosY;
  }



  public void UnlockAchievement(int achievementNumber)
  {

    if (msql.connect()) 
    {
      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }
      if (achieved != 1) 
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 1, 0);
        achievement.play();
        achievement.rewind();

        achievementAnim.add(new AchievementAnimator(achievementNumber, startPosX, startPosY));
      }
    }
  }
}
class Achievements
{

  Timer[] achievementRetractTimer;

  int[] achievementsActive;

  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;

  int idAchievement, achieved;
  String tempId;



  Achievements()
  {
    msql.connect();
  }



  public void draw()
  {
    for (int i = 0; i < achievementRetractTimer.length; i++)
    {
      achievementRetractTimer[i] = new Timer(10);
    }
  }



  public void UnlockAchievement(int achievementNumber)
  {
    println(User.currentUser);

    if (msql.connect()) 
    {
      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }
      if (achieved != 1) 
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 1, 0);
        achievement.play();
        achievement.rewind();
      }
    }


  }
}





Minim minim;


// soundeffects
AudioPlayer Shotgun, ShotgunReload, pump_shotg, pump_shotg_empty, AR1, AR1Reload, AR1Empty, Pistol, pistolR, pistolEmpty, homeSnd, death, damage, bruh, garfield, achievement, e1m1, 
  buying1, buying2, buying3, buying4, buying5, buying6, buying7, cantbuy1, cantbuy2, missing1, missing2, ohhimark, uhoh, shieldup, speedup, ultimatemachinegun, garfieldSans;
// music
AudioPlayer loginMusic, gameMusic, megalovania, contraJungleTheme, guilesTheme, devilMayCry, fireEmblem, xenoblade;



// Main menu
PImage main, login, pillar, levelTemplate, scrBgr, pokemonMDB, statsBg, creditsBG, controlImg;

// UI
PImage healthbarS, healthbarSb, healthP, bullet, shotgunS, shieldP, shieldbarS, shieldbarSb, arrow, seasonpass;

//Achievements
PImage[] chievePlate = new PImage[7];

// Guns 
PImage buckS, bulletDown, bulletLeft, bulletRight, bulletTurret;
PImage handgunLeft, handgunRight, handgunUp, handgunDown, doubleBu, doubleBd, doubleBl, doubleBr, arL, arR, arU, arD, pumpL, pumpR, pumpU, pumpD;
PImage LMG1_down, LMG1_up, LMG1_left, LMG1_right, LMG2_down, LMG2_up, LMG2_right, LMG2_left, rayGun_up, rayGun_down, rayGun_left, rayGun_right, rayGunP_up, rayGunP_down, rayGunP_left, rayGunP_right; 
PImage peanut, treeGun_up, treeGun_down, treeGun_left, treeGun_right, shotg_up, shotg_right, shotg_left, shotg_down, rayGunP_B_up, rayGunP_B_left, rayGunP_B_right, rayGunP_B_down; 

// Shop
PImage arLoad, arLoad2, arFullLoad, shotg_load, shotg_load2, shotg_fullLoad;


// Effects
PImage bloodOrb;
PImage bossBlood;
PImage gruntBlood;
PImage heavyBlood;

SpriteSheet mrSpooksLeft, mrSpooksRight, mrSpooksUp, mrSpooksDown, peanutS;


//Enemies
SpriteSheet gruntL, gruntR, gruntU, gruntD, speedsterL, speedsterR, speedsterU, speedsterD, bruteLU, bruteLD, bruteRD, bruteRU, heavyU, heavyD, heavyL, heavyR, boss1U, boss1D, boss1L, boss1R;
SpriteSheet arrowPL, arrowPU, arrowPR, arrowPD;
SpriteSheet shopcart, stationaryShopcart, cartdirt, shopcartSansGarfield, shopcartSansGarfieldStationary;
SpriteSheet multiplierUp;
SpriteSheet shieldUp, healthUp, speedUp;
SpriteSheet flowerPatch, turret;

// Garfield
SpriteSheet garfieldS;
// Garfield Sans version
SpriteSheet garfieldSansS;


public void LoadAssets()
{

  // Shop
  arLoad = loadImage("/data/sprites/Shop/ShopMGLoad1.png");
  arLoad2 = loadImage("/data/sprites/Shop/ShopMGLoad2.png");
  arFullLoad = loadImage("/data/sprites/Shop/ShopMGFullLoad.png");
  shotg_load = loadImage("/data/sprites/Shop/ShotgunShellLoad1.png");
  shotg_load2 = loadImage("/data/sprites/Shop/ShotgunShellLoad2.png");
  shotg_fullLoad = loadImage("/data/sprites/Shop/ShotgunShellFullLoad.png");

  // UI

  seasonpass = loadImage("/data/img/LastStand-SEASONPASS.png");
  arrow = loadImage("/data/sprites/UI/Arrow.png");
  healthbarS = loadImage("/data/sprites/UI/HealthBarSlots.png");
  healthbarSb = loadImage("/data/sprites/UI/HealthBarSlots_Backdrop.png");
  healthP = loadImage("/data/sprites/UI/PieceOfHealth.png");
  bullet = loadImage("/data/sprites/UI/BulletSprite.png");
  shotgunS = loadImage("/data/sprites/UI/ShotgunShell.png");

  shieldbarS = loadImage("/data/sprites/UI/ShieldBarSlots.png");
  shieldbarSb = loadImage("/data/sprites/UI/ShieldBarSlots_Backdrop.png");
  shieldP = loadImage("/data/sprites/UI/PieceOfShield.png");

  pokemonMDB = loadImage("/data/sprites/PMDB.png");

  //Achievements
  for (int i = 1; i < chievePlate.length; i++)
  {
    chievePlate[i] = loadImage("/data/sprites/Achievement" + i + ".png");
  }


  // Guns

  // Shotgun final upgrade!
  shotg_up = loadImage("/data/sprites/Guns/Shotgun_Automatic_Top.png");
  shotg_down = loadImage("/data/sprites/Guns/Shotgun_Automatic_Bottom.png");
  shotg_right = loadImage("/data/sprites/Guns/Shotgun_Automatic_Right.png");
  shotg_left = loadImage("/data/sprites/Guns/Shotgun_Automatic_Left.png");

  // LMG first Upgrade!
  LMG1_up = loadImage("/data/sprites/Guns/LMG1_up.png");
  LMG1_down = loadImage("/data/sprites/Guns/LMG1_down.png");
  LMG1_left = loadImage("/data/sprites/Guns/LMG1_left.png");
  LMG1_right = loadImage("/data/sprites/Guns/LMG1_right.png");

  // LMG second Upgrade!
  LMG2_up = loadImage("/data/sprites/Guns/LMG2_up.png");
  LMG2_down = loadImage("/data/sprites/Guns/LMG2_down.png");
  LMG2_left = loadImage("/data/sprites/Guns/LMG2_left.png");
  LMG2_right = loadImage("/data/sprites/Guns/LMG2_right.png");

  // Pistol second upgrade!
  rayGun_up = loadImage("/data/sprites/Guns/Handgun_Raygun_Top.png");
  rayGun_down = loadImage("/data/sprites/Guns/Handgun_Raygun_Bottom.png");
  rayGun_left = loadImage("/data/sprites/Guns/Handgun_Raygun_Left.png");
  rayGun_right = loadImage("/data/sprites/Guns/Handgun_Raygun_Right.png");
  // Pink version of second pistol upgrade!
  rayGunP_up = loadImage("/data/sprites/Guns/Handgun_RaygunPINK_Top.png");
  rayGunP_down = loadImage("/data/sprites/Guns/Handgun_RaygunPINK_Bottom.png");
  rayGunP_left = loadImage("/data/sprites/Guns/Handgun_RaygunPINK_Left.png");
  rayGunP_right = loadImage("/data/sprites/Guns/Handgun_RaygunPINK_Right.png");

  // Pink gun ammo cases
  rayGunP_B_up = loadImage("/data/sprites/UI/Raygun_Shell.png");
  rayGunP_B_down = loadImage("/data/sprites/Raygun_ShellD.png");
  rayGunP_B_left = loadImage("/data/sprites/Raygun_ShellL.png");
  rayGunP_B_right = loadImage("/data/sprites/Raygun_ShellR.png");


  // Final pistol upgrade!
  treeGun_up = loadImage("/data/sprites/Guns/Handgun_Tree_Top.png");
  treeGun_down = loadImage("/data/sprites/Guns/Handgun_Tree_Down.png");
  treeGun_left = loadImage("/data/sprites/Guns/Handgun_Tree_Left.png");
  treeGun_right = loadImage("/data/sprites/Guns/Handgun_Tree_Right.png");
  peanutS = new SpriteSheet("/data/sprites/Bullets/PindaShell-sheet.png", 8);
  peanut = loadImage("/data/sprites/Bullets/PindaShell.png");

  doubleBu = loadImage("/data/sprites/DoubleBarrel_Top.png");
  doubleBd = loadImage("/data/sprites/DoubleBarrel_Down.png");
  doubleBl = loadImage("/data/sprites/DoubleBarrel_Left.png");
  doubleBr = loadImage("/data/sprites/DoubleBarrel_Right.png");

  buckS = loadImage("/data/sprites/buckshot.png");
  bulletDown = loadImage("/data/sprites/BulletSpriteDown.png");
  bulletLeft = loadImage("/data/sprites/BulletSpriteLeft.png");
  bulletRight = loadImage("/data/sprites/BulletSpriteRight.png");
  bulletTurret = loadImage("/data/sprites/turretBullet.png");

  handgunUp = loadImage("/data/sprites/Handgun_Top.png");
  handgunDown = loadImage("/data/sprites/Handgun_Down.png");
  handgunLeft = loadImage("/data/sprites/Handgun_Left.png");
  handgunRight = loadImage("/data/sprites/Handgun_Right.png");

  arU = loadImage("/data/sprites/AR_Up.png");
  arD = loadImage("/data/sprites/AR_Down.png");
  arL = loadImage("/data/sprites/AR_Left.png");
  arR = loadImage("/data/sprites/AR_Right.png");

  pumpU = loadImage("/data/sprites/Shotgun_Pump_Up.png");
  pumpD = loadImage("/data/sprites/Shotgun_Pump_Down.png");
  pumpL = loadImage("/data/sprites/Shotgun_Pump_Left.png");
  pumpR = loadImage("/data/sprites/Shotgun_Pump_Right.png");

  // Main Menu
  scrBgr = loadImage("/data/img/mainMenu_scorePage.png");
  controlImg = loadImage("/data/img/controls.png");
  main = loadImage("/data/img/LastStand-MainMenu.png");
  // Login
  login = loadImage("/data/img/LastStand-Login.png");
  // stats
  statsBg = loadImage("/data/img/LastStand_Stats.png");
  // credits
  creditsBG = loadImage("/data/img/LastStand-Credits.png");

  // Effects
  bloodOrb = loadImage("/data/sprites/BloodOrb.png");
  bossBlood=loadImage("data/sprites/Boss blood sprite.png");
  gruntBlood=loadImage("data/sprites/Grunt blood sprite.png");
  heavyBlood=loadImage("data/sprites/Heavy blood sprite.png");

  // Maps
  levelTemplate = loadImage("/data/sprites/LevelTemplate.png");
  pillar = loadImage("/Graphics/pillarSprite.png");

  flowerPatch = new SpriteSheet("/data/sprites/FlowerPatch.png", 6);
  turret = new SpriteSheet("/data/sprites/Turret.png", 36);

  mrSpooksLeft = new SpriteSheet("/Graphics/MrSpooks_Sheet_Left.png", 5);
  mrSpooksRight = new SpriteSheet("/Graphics/MrSpooks_Sheet_Right.png", 5);
  mrSpooksUp = new SpriteSheet("/Graphics/MrSpooks_Sheet_Back.png", 5);
  mrSpooksDown = new SpriteSheet("/Graphics/MrSpooks_Sheet_Front.png", 5);


  // Enemies
  gruntU = new SpriteSheet("/data/sprites/Enemies/Grunt-Running-Away.png", 8);
  gruntD = new SpriteSheet("/data/sprites/Enemies/Grunt-Running-Forward.png", 8);
  gruntR = new SpriteSheet("/data/sprites/Enemies/Grunt-Running-Right.png", 5);
  gruntL = new SpriteSheet("/data/sprites/Enemies/Grunt-Running-Left.png", 5);

  bruteRU = new SpriteSheet("/data/sprites/Enemies/Brute_Right_Up.png", 9); 
  bruteRD = new SpriteSheet("/data/sprites/Enemies/Brute_Right_Down.png", 9);
  bruteLD = new SpriteSheet("/data/sprites/Enemies/Brute_Left_Down.png", 9);
  bruteLU = new SpriteSheet("/data/sprites/Enemies/Brute_Left_Up.png", 9);

  speedsterL = new SpriteSheet("/data/sprites/Enemies/Speedster_Sheet_Left.png", 5);
  speedsterU = new SpriteSheet("/data/sprites/Enemies/Speedster_Sheet_Back.png", 5);
  speedsterR = new SpriteSheet("/data/sprites/Enemies/Speedster_Sheet_Right.png", 5);
  speedsterD = new SpriteSheet("/data/sprites/Enemies/Speedster_Sheet_Front.png", 5);

  heavyU = new SpriteSheet("/data/sprites/Enemies/Heavy_Up.png", 17);
  heavyD = new SpriteSheet("/data/sprites/Enemies/Heavy_Down.png", 17);
  heavyL = new SpriteSheet("/data/sprites/Enemies/Heavy_Left.png", 33);
  heavyR = new SpriteSheet("/data/sprites/Enemies/Heavy_Right.png", 33);

  boss1U = new SpriteSheet("/data/sprites/Enemies/Boss1_Back.png", 9);
  boss1D = new SpriteSheet("/data/sprites/Enemies/Boss1_Front.png", 9);
  boss1L = new SpriteSheet("/data/sprites/Enemies/Boss1_SideL.png", 9);
  boss1R = new SpriteSheet("/data/sprites/Enemies/Boss1_SideR.png", 9);

  shopcart = new SpriteSheet("/data/sprites/shopcart.png", 6);
  stationaryShopcart = new SpriteSheet("/data/sprites/Stationary_Shopcart.png", 8);
  shopcartSansGarfield = new SpriteSheet("/data/sprites/Shopcart_Sans.png", 6);
  shopcartSansGarfieldStationary = new SpriteSheet("/data/sprites/Shopcart_Sans_NM.png", 6);

  cartdirt = new SpriteSheet("/data/sprites/cartdirt.png", 6);
  // Garfield
  garfieldS = new SpriteSheet("/data/sprites/garfieldShopKeep.png", 6);
  // Garfield Sans version
  garfieldSansS = new SpriteSheet("/data/sprites/SansField.png", 6);


  //ArrowPointers
  arrowPU = new SpriteSheet("/data/sprites/ArrowPointer_Up.png", 6);
  arrowPD = new SpriteSheet("/data/sprites/ArrowPointer_Down.png", 6);
  arrowPL = new SpriteSheet("/data/sprites/ArrowPointer_Left.png", 6);
  arrowPR = new SpriteSheet("/data/sprites/ArrowPointer_Right.png", 6);



  //PowerUps
  shieldUp = new SpriteSheet("/data/sprites/LS_SHLD.png", 10);
  speedUp = new SpriteSheet("/data/sprites/LS_SPD.png", 20);
  healthUp = new SpriteSheet("/data/sprites/LS_HLTH.png", 10);
  multiplierUp = new SpriteSheet("/data/sprites/Multiplier.png", 10);

  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
  ShotgunReload = minim.loadFile("/data/sound/Guns/pump_shotgun_reload.mp3");
  pump_shotg_empty = minim.loadFile("/data/sound/Guns/pump_shotgun_empty.mp3");
  pump_shotg = minim.loadFile("/data/sound/Guns/pump_shotgun.mp3");
  AR1 = minim.loadFile("/data/sound/Guns/ar_shot.mp3");
  AR1Reload = minim.loadFile("/data/sound/Guns/ar_reload.mp3");
  AR1Empty = minim.loadFile("/data/sound/Guns/ar_empty.mp3");
  Pistol = minim.loadFile("/data/sound/Pistol.mp3");
  pistolR = minim.loadFile("/data/sound/Guns/handgun_reload.mp3");
  pistolEmpty = minim.loadFile("/data/sound/Guns/handgun_empty.mp3");
  homeSnd = minim.loadFile("/data/sound/Last_Stand_MainMS.wav");
  death = minim.loadFile("/data/sound/death.mp3");
  gameMusic = minim.loadFile("/data/sound/looping_strings.wav");
  megalovania = minim.loadFile("/data/sound/Megalovania.mp3");
  contraJungleTheme = minim.loadFile("/data/sound/ContraJungleTheme.wav");
  guilesTheme = minim.loadFile("/data/sound/GuilesTheme.wav");
  loginMusic = minim.loadFile("/data/sound/login.mp3");
  e1m1 = minim.loadFile("/data/sound/AtDoomsGate.wav");
  devilMayCry = minim.loadFile("/data/sound/DevilTrigger.mp3");
  fireEmblem = minim.loadFile("/data/sound/GodShatteringStar.mp3");
  xenoblade = minim.loadFile("/data/sound/YouWillKnowOurNames.mp3");



  damage = minim.loadFile("/data/sound/voicelines/oof.mp3");
  bruh = minim.loadFile("/data/sound/voicelines/bruh.mp3");
  garfield = minim.loadFile("/data/sound/voicelines/garfield.mp3");
  achievement = minim.loadFile("/data/sound/voicelines/achievement.mp3");
  buying1 = minim.loadFile("/data/sound/voicelines/buying1.mp3");
  buying2 = minim.loadFile("/data/sound/voicelines/buying2.mp3");
  buying3 = minim.loadFile("/data/sound/voicelines/buying3.mp3");
  buying4 = minim.loadFile("/data/sound/voicelines/buying4.mp3");
  buying5 = minim.loadFile("/data/sound/voicelines/buying5.mp3");
  buying6 = minim.loadFile("/data/sound/voicelines/buying6.mp3");
  buying7 = minim.loadFile("/data/sound/voicelines/buying7.mp3");
  cantbuy1 = minim.loadFile("/data/sound/voicelines/cantbuy1.mp3");
  cantbuy2 = minim.loadFile("/data/sound/voicelines/cantbuy2.mp3");
  missing1 = minim.loadFile("/data/sound/voicelines/missing1.mp3");
  missing2 = minim.loadFile("/data/sound/voicelines/missing2.mp3");
  ohhimark = minim.loadFile("/data/sound/voicelines/ohhimark.mp3");
  uhoh = minim.loadFile("/data/sound/voicelines/uhoh.mp3");
  shieldup = minim.loadFile("/data/sound/voicelines/shieldup.mp3");
  ultimatemachinegun = minim.loadFile("/data/sound/voicelines/ultimatemachinegun.mp3");
  speedup = minim.loadFile("/data/sound/voicelines/speedup.mp3");
  garfieldSans = minim.loadFile("/data/sound/voicelines/sans.mp3");
}
class Boss1 extends GameObject {

  Boss1() {
    tag = "enemy";
    idAchievement[1] = 3;
    objWidth=100;
    objHeight=146;
    hp=20;
    hpBarTotalInit = 100;
    hpBarTotal = hpBarTotalInit;
    moveVelX=1;
    moveVelY=1;

    scoreGain = 100;

    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }



  public void draw() {
    checkPulse();
    EnemyHealthBar();

    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75f && angleBetweenVector < 0.75f) {
      boss1U.draw(objPosX, objPosY);
      boss1U.update();
    }

    if ( (angleBetweenVector > 2.25f && angleBetweenVector < 3.2f) || (angleBetweenVector < -2.25f && angleBetweenVector > -3.2f) ) {
      boss1D.draw(objPosX, objPosY);
      boss1D.update();
    }
    if (angleBetweenVector > 0.75f && angleBetweenVector < 2.25f) {
      boss1L.draw(objPosX, objPosY);
      boss1L.update();
    }
    if (angleBetweenVector > -2.25f && angleBetweenVector < -0.75f) {
      boss1R.draw(objPosX, objPosY);
      boss1R.update();
    }

    //ENEMY MOVEMENT
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);



    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;




    if (Dead())
    {
      spawn.totalEnemyCount--;
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }//enemyShow


  public void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        UI.hitValue = 3;
        hp = 0;
        UI.spelerhit();
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp --;

          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            //if (msql.connect())
            //{
            //  msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM User_has_Achievements INNER JOIN Achievements ON User_has_Achievements.Achievements_idAchievements = Achievements.idAchievement WHERE Achievements_idAchievements = '%s' AND User_idUser = '%s'", (chieves.bossCounter + 1), idAchievement[1], User.currentUser);

            //  chieves.UnlockAchievement(3);
            //}

            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleBoss(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  public void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  public boolean Dead() {
    return hp<=0;
  }
}
// TE4M
// Dylan Vermeulen
class Bullet extends GameObject {

  int bulletState = 0;

  Bullet(float incomingDX, float incomingDY) {



    objPosX = myPlayer.muzzlePointX;  //x position of bullet begins on y position of player
    objPosY = myPlayer.muzzlePointY;  //y position of bullet begins on y position of player

    moveVelX = incomingDX;    
    moveVelY= incomingDY;
    objWidth = bullet.width;
    objHeight = bullet.height;

    tag = "bullet";

    if (myPlayer.currentGun != myPlayer.shotgun) {
      if  (myPlayer.shootingRight) {
        bulletState = 1;
      } else if (myPlayer.shootingLeft) {
        bulletState = 2;
      } else if (myPlayer.shootingUp) {
        bulletState = 3;
      } else if (myPlayer.shootingDown) {
        bulletState = 4;
      }
    } else {
      bulletState = 5;
    }
  }

  public void draw() {

    objPosX += moveVelX;
    objPosY += moveVelY;


    switch(bulletState) {
    case 1:
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_right.width;
        objHeight = rayGunP_B_right.height;
        image(rayGunP_B_right, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        image(bulletRight, objPosX, objPosY);
      }
      break;
    case 2:
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_left.width;
        objHeight = rayGunP_B_left.height;
        image(rayGunP_B_left, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletRight.width;
        objHeight = bulletRight.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletLeft.width;
        objHeight = bulletLeft.height;
        image(bulletLeft, objPosX, objPosY);
      }
      break;
    case 3:
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_up.width;
        objHeight = rayGunP_B_up.height;
        image(rayGunP_B_up, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bullet.width;
        objHeight = bullet.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bullet.width;
        objHeight = bullet.height;
        image(bullet, objPosX, objPosY);
      }
      break;
    case 4:
      if ( myPlayer.pistol.upgradeLevel == 2) {
        objWidth = rayGunP_B_down.width;
        objHeight = rayGunP_B_down.height;
        image(rayGunP_B_down, objPosX, objPosY);
      } else if (myPlayer.pistol.upgradeLevel == 3) {
        objWidth = bulletDown.width;
        objHeight = bulletDown.height;
        peanutS.draw(objPosX, objPosY);
        peanutS.update();
      } else {
        objWidth = bulletDown.width;
        objHeight = bulletDown.height;
        image(bulletDown, objPosX, objPosY);
      }
      break;
    case 5:
      objWidth = buckS.width;
      objHeight = buckS.height;
      image(buckS, objPosX, objPosY);
      objWidth = buckS.width;
      objHeight = buckS.height;
      break;
    }

    //Bullet Removal
    if (objPosX + objWidth > width || objPosX < 0 || objPosY < 0 || objPosY + objHeight > height || collLeft || collRight || collTop || collBott)
    {
      Remove(this);
      ascore.ComboReset();
    }
  }


  public boolean hasDied() {
    return objPosY < 0 || objPosY > height || objPosX < 0 || objPosX > width;
  }
}
class Credits {
  public void draw() {
    float garfieldX = 0, garfieldY = height - garfieldS.frameHeight;
    creditsBG.resize(width, height);
    image(creditsBG, 0, 0);
    if (gamemngr.trackNumber == 4) {
      garfieldSansS.update();
      garfieldSansS.draw(garfieldX, garfieldY);
      garfieldSansS.draw(garfieldX + garfieldS.frameWidth * 2, garfieldY);
    } else {
      garfieldS.update();
      garfieldS.draw(garfieldX, garfieldY);
      garfieldS.draw(garfieldX + garfieldS.frameWidth * 2, garfieldY);
    }
  }
  public void keyReleased() {
    if (gamemngr.creditspage) {
      if (keyCode == DOWN) {
        gamemngr.creditspage = false;
        gamemngr.home = true;
      }
    }
  }
}
//CONNECTIONS QUINN

String dbHost = "oege.ie.hva.nl"; 
String dbPort = "3306"; 
String dbUser = "koeneqt"; 
String dbPass = "7EwwK5+iBmUXUd"; 
String dbName = "zkoeneqt";
class EnemyProjectile extends GameObject
{

  Timer homingTimer = new Timer(4);

  String projectileType;




  EnemyProjectile(float objPosXInput, float objPosYInput, String type)
  {
    projectileType = type;

    objPosX = objPosXInput;
    objPosY = objPosYInput;

    objWidth = bulletTurret.width;
    objHeight = bulletTurret.height;

    moveVelX = 1;
    moveVelY = 1;

    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);
  }




  public void draw()
  {
    if (spawn.waveFinished)
      Remove(this);

    pushStyle();
    image(bulletTurret, objPosX, objPosY);
    popStyle();
    if (projectileType == "homing")
    {
      if (!homingTimer.TimerDone())
      {
        //PROJECTILE MOVEMENT
        dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
        dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

        dir = sqrt(sq(dx) + sq(dy));

        dx *= (moveVelX / dir);
        dy *= (moveVelY / dir);
      } else
        Remove(this);
    }
    if (!collLeft && !collRight)
      objPosX += dx;
    else
      Remove(this);

    if (!collTop && !collBott)
      objPosY += dy;
    else
      Remove(this);

    //Collision with Player if they are able to be hit
    if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
    {
      if (UI.levens >0 && UI.shield <= 0) {
        UI.hitValue = 1;
        //  UI.levens-= hitValue;
        Remove(this);
      }
      UI.spelerhit();
      if (UI.shield > 0) {
        UI.shield -= 1;
      }
    }
  }
}
//Ruben de Jager
class Grunt extends GameObject {

  Grunt() {
    tag = "enemy";

    scoreGain = 5;

    powerUpChance = random(0, 100);

    objWidth=28;
    objHeight=40;
    hp=2;
    hpBarTotalInit = 50;
    hpBarTotal = hpBarTotalInit;

    moveVelX=1;
    moveVelY=1;





    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }//constructor Grunt





  public void draw() {
    checkPulse();
    EnemyHealthBar();


    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75f && angleBetweenVector < 0.75f) {
      gruntU.draw(objPosX, objPosY);
      gruntU.update();
    }
    if (angleBetweenVector > 0.75f && angleBetweenVector < 2.25f) {
      gruntL.draw(objPosX, objPosY);
      gruntL.update();
    }
    if ( (angleBetweenVector > 2.25f && angleBetweenVector < 3.2f) || (angleBetweenVector < -2.25f && angleBetweenVector > -3.2f) ) {
      gruntD.draw(objPosX, objPosY);
      gruntD.update();
    }
    if (angleBetweenVector > -2.25f && angleBetweenVector < -0.75f) {
      gruntR.draw(objPosX, objPosY);
      gruntR.update();
    }



    //ENEMY MOVEMENT
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);



    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;




    if (Dead())
    {
      spawn.totalEnemyCount--;
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }//enemyShow



  public void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        UI.hitValue = 1;
        hp = 0;
        UI.spelerhit();
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp--;


          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            if (powerUpChance <= 10)
              Add(new Powerups(objPosX + objWidth/2, objPosY + objHeight/2));

            //scorePopUp = scoreGain * ascore.combo;
            ascore.score += scoreGain * ascore.combo;

            //pushStyle();
            //popStyle();
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleGrunt(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  public void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  public boolean Dead() {
    return hp<=0;
  }//boolean Dead
}//class Grunt
//Ruben de Jager
class Speedster extends GameObject {

  Speedster() {
    tag = "enemy";

    scoreGain = 2;

    powerUpChance = random(0, 100);

    objWidth=28;
    objHeight=40;
    hp=1;
    hpBarTotalInit = 50;
    hpBarTotal = hpBarTotalInit;
    moveVelX=2;
    moveVelY=2;




    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }//constructor Speedster


  public void draw() {
    checkPulse();
    EnemyHealthBar();

    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75f && angleBetweenVector < 0.75f) {
      speedsterU.draw(objPosX, objPosY);
      speedsterU.update();
    }
    if (angleBetweenVector > 0.75f && angleBetweenVector < 2.25f) {
      speedsterL.draw(objPosX, objPosY);
      speedsterL.update();
    }
    if ( (angleBetweenVector > 2.25f && angleBetweenVector < 3.2f) || (angleBetweenVector < -2.25f && angleBetweenVector > -3.2f) ) {
      speedsterD.draw(objPosX, objPosY);
      speedsterD.update();
    }
    if (angleBetweenVector > -2.25f && angleBetweenVector < -0.75f) {
      speedsterR.draw(objPosX, objPosY);
      speedsterR.update();
    }

    //ENEMY MOVEMENT
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);


    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;




    if (Dead())
    {
      spawn.totalEnemyCount--;
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }//enemyShow


  public void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        UI.hitValue = 1;
        hp = 0;
        UI.spelerhit();
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp--;


          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            if (powerUpChance <= 10)
              Add(new Powerups(objPosX + objWidth/2, objPosY + objHeight/2));
            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleGrunt(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  public void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  public boolean Dead() {
    return hp<=0;
  }//boolean Dead
}
//Ruben de Jager
class Heavy extends GameObject {

  Heavy() {
    tag = "enemy";

    scoreGain = 10;

    powerUpChance = random(0, 100);

    hp=6;
    hpBarTotalInit = 50;
    hpBarTotal = hpBarTotalInit;
    moveVelX=0.75f;
    moveVelY=0.75f;



    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }//constructor Heavy




  public void draw() {
    objWidth=114;
    objHeight=72;

    checkPulse();
    EnemyHealthBar();

    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > -0.75f && angleBetweenVector < 0.75f) {
      heavyU.draw(objPosX, objPosY);
      heavyU.update();
    }

    if ( (angleBetweenVector > 2.25f && angleBetweenVector < 3.2f) || (angleBetweenVector < -2.25f && angleBetweenVector > -3.2f) ) {
      heavyD.draw(objPosX, objPosY);
      heavyD.update();
    }

    if (angleBetweenVector > 0.75f && angleBetweenVector < 2.25f) {
      objWidth = 90;
      objHeight = 70;
      heavyL.draw(objPosX, objPosY);
      heavyL.update();
    }

    if (angleBetweenVector > -2.25f && angleBetweenVector < -0.75f) {
      objWidth = 90;
      objHeight = 70;
      heavyR.draw(objPosX, objPosY);
      heavyR.update();
    }

    //ENEMY MOVEMENT
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);


    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;



    if (Dead())
    {
      spawn.totalEnemyCount--;
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }//enemyShow




  public void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {
        UI.hitValue = 2;
        hp = 0;
        UI.spelerhit();
      }


      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp--;


          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            if (powerUpChance <= 10)
              Add(new Powerups(objPosX + objWidth/2, objPosY + objHeight/2));
            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleHeavy(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  public void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  public boolean Dead() {
    return hp<=0;
  }//boolean Dead
}
class Brute extends GameObject {

  Brute() {
    tag = "enemy";

    scoreGain = 7;

    powerUpChance = random(0, 100);

    objWidth=35;
    objHeight=42;
    hp=4;
    hpBarTotalInit = 50;
    hpBarTotal = hpBarTotalInit;
    moveVelX=1;
    moveVelY=1;



    float r = random(-1, 3);
    if (r <= 0) {
      objPosX = spawn.spawnerPos0.x - objWidth/2;
      objPosY = spawn.spawnerPos0.y;
    } else if (r > 0 && r <= 1) {
      objPosX = spawn.spawnerPos1.x - objWidth/2;
      objPosY = spawn.spawnerPos1.y;
    } else if (r > 1 && r <= 2) {
      objPosX = spawn.spawnerPos2.x;
      objPosY = spawn.spawnerPos2.y - objHeight/2;
    } else if (r > 2 && r <= 3) {
      objPosX = spawn.spawnerPos3.x;
      objPosY = spawn.spawnerPos3.y - objHeight/2;
    }
  }//constructor Brute




  public void draw() {
    checkPulse();
    EnemyHealthBar();

    enemyVector = new PVector(objPosX+objWidth/2, objPosY+objHeight/2);
    playerVector = new PVector(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2);
    dxA = enemyVector.x - playerVector.x;
    dyA = enemyVector.y - playerVector.y;


    angleBetweenVector = atan2(dxA, dyA);

    if (angleBetweenVector > 0 && angleBetweenVector < 1.5f) {
      bruteLU.draw(objPosX, objPosY); // LEFT UP
      bruteLU.update();
    }
    if (angleBetweenVector > 1.5f && angleBetweenVector < 3.2f) {
      bruteLD.draw(objPosX, objPosY); // LEFT DOWN
      bruteLD.update();
    }
    if ( angleBetweenVector > -3.2f && angleBetweenVector < -1.5f ) {
      bruteRD.draw(objPosX, objPosY); //RIGHT DOWN
      bruteRD.update();
    }
    if (angleBetweenVector > -1.5f && angleBetweenVector < 0) {
      bruteRU.draw(objPosX, objPosY); //RIGHT UP
      bruteRU.update();
    }


    //ENEMY MOVEMENT
    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);


    if (!collLeft && !collRight)
      objPosX += dx;

    if (!collTop && !collBott)
      objPosY += dy;



    if (Dead())
    {
      spawn.totalEnemyCount--;
      Remove(this);
    }

    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }


  public void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {

      //Collision with Player if they are able to be hit
      if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
      {

        UI.hitValue = 2;
        hp = 0;
        UI.spelerhit();
      }

      //Collision with Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (objPosX < GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth && objPosX + objWidth > GameObjectRef.gameObject.get(i).objPosX && objPosY < GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight && objPosY + objHeight > GameObjectRef.gameObject.get(i).objPosY)
        {
          hpBarTotal -= hpBarTotal/hp;
          hp--;


          Remove(GameObjectRef.gameObject.get(i));
          ascore.combo += gamemngr.comboMultiplier;
          gamemngr.shakeAmount = 3;
          gamemngr.shake = true;
          if (hp == 0) {

            if (powerUpChance <= 10)
              Add(new Powerups(objPosX + objWidth/2, objPosY + objHeight/2));
            ascore.score += scoreGain * ascore.combo;
          }
          for (int j=0; j < 20; j++) {
            Add(new ParticleHeavy(objPosX + objWidth/2, objPosY + objHeight/2));
          }//for
        }
      }
    }
  }

  public void EnemyHealthBar()
  {
    pushStyle();
    fill(255, 0, 0);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotalInit, 10);
    popStyle();

    pushStyle();
    fill(0, 200, 100);
    rect((objPosX+objWidth/2) - hpBarTotalInit/2, objPosY - 5, hpBarTotal, 10);
    popStyle();
  }

  public boolean Dead() {
    return hp<=0;
  }
}
public class GameObject {

  ArrayList<GameObject> gameObject = new ArrayList();
  String tag;


  PVector spawnerPos0, spawnerPos1, spawnerPos2, spawnerPos3;


  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;
  boolean lookingUp, lookingLeft, lookingRight, lookingDown = true;
  boolean shootingUp, shootingDown, shootingLeft, shootingRight;
  boolean collLeft, collRight, collTop, collBott;


  float dx, dy, dir, dxA, dyA;
  float angleBetweenVector;
  PVector enemyVector, playerVector;

  int totalEnemyCount;

  float objPosX, objPosY, objWidth, objHeight;
  float tempObjPosX, tempObjPosY;
  float scorePopUp, scorePopUpAlpha;

  float moveVelX, moveVelY;

  float defaultSpeed, defaultSpeedInit, diaSpeed, diaSpeedInit;

  float knockback;
  float hp, hpBarTotal, hpBarTotalInit;


  float scoreGain;

  float powerUpChance;

  int shopItemNumber, itemPrice, upgradeLevel;

  float tileSize;

  int[] idAchievement = new int[5];





  GameObject() 
  {

    spawnerPos0 = new PVector();
    spawnerPos1 = new PVector();
    spawnerPos2 = new PVector();
    spawnerPos3 = new PVector();
    //for(int i = 0; i < gameObject.size(); i ++)
    //{
    //  GameObject gameobject = new GameObject();
    //}
  }


  public void draw()
  {    
    noStroke();
    //println("I have been drawn");

    tileSize = 100;
  }//enemyUpdate

  public boolean Dead() {
    return false;
  }

  public void Add(GameObject object)
  {
    GameObjectRef.gameObject.add(object); 
    //println("A new object has been created");
  }

  public void Remove(GameObject object)
  {
    GameObjectRef.gameObject.remove(object);
  }

  public void drawObjects() {
    //println(gameObject);

    for (int i = 0; i < gameObject.size(); i++) {
      gameObject.get(i).draw();
    }
  }
}
class GameOver {


  GameOver() {
  }

  public void setup() {
  }

  public void draw() {
    if (gamemngr.dead) {
      pushStyle();
      fill(0);
      rect(0, 0, width, height);
      popStyle();
      pushStyle();
      fill(255);
      textAlign(CENTER);
      textSize(80);
      text("YOU DIED", width/2, height/2 - 10);
      textSize(15);
      text("PRESS A TO CONTNUE", width/2, height/2 + 50);
      popStyle();
      gameMusic.pause();
      gameMusic.rewind();
      contraJungleTheme.pause();
      contraJungleTheme.rewind();
      guilesTheme.pause();
      guilesTheme.rewind();
      megalovania.pause();
      megalovania.rewind();
      e1m1.pause();
      e1m1.rewind();
      devilMayCry.pause();
      devilMayCry.rewind();
      fireEmblem.pause();
      fireEmblem.rewind();
      xenoblade.pause();
      xenoblade.rewind();
      // Remove all enemies!
      for (int i = 0; i < GameObjectRef.gameObject.size(); i++)
      {
        GameObjectRef.gameObject.get(i).hp = 0;
        GameObjectRef.Remove(GameObjectRef.gameObject.get(i));
      }
      // Turn everything off!
      myPlayer.shootingRight = false;
      myPlayer.shootingLeft = false;
      myPlayer.shootingUp = false;
      myPlayer.shootingDown = false;
      myPlayer.lookingLeft = false;
      myPlayer.lookingRight = false;
      myPlayer.lookingUp = false;
      myPlayer.lookingDown = true;

      death.play();
    }
  }
  public void keyPressed() {
    if (gamemngr.dead) {
      if (keyCode == RIGHT) {
        ascore.saveScore();
        gamemngr.dead = false;
        gamemngr.hscore = true;
        Reset();
      }
    }
  }
  public void Reset()
  {
    ascore.combo = 1;
    UI.shield = 0;
    UI.levens = 3;
    gamemngr.hscoreA = 0;

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    Pistol.pause();
    Shotgun.pause();
    AR1.pause();

    UI.ammoP = 5;


    Pistol.rewind();
    Shotgun.rewind();
    AR1.rewind();

    ascore.score = 0;
    spawn.wave = 1;
    spawn.waveTextTimer.Reset();

    // print(UI.levens);
    gamemngr.dead = false;
    gamemngr.hscore = true;

    myPlayer.collLeft = false;
    myPlayer.collRight = false;
    myPlayer.collTop = false;
    myPlayer.collBott = false;

    myPlayer.akey = false;
    myPlayer.dkey = false;
    myPlayer.wkey = false;
    myPlayer.skey = false;

    spawn.spawnBrtFinished = false;
    spawn.spawnSpdFinished = false;
    spawn.spawnGrntFinished = false;
    spawn.spawnHvyFinished = false;
    spawn.spawnBssFinished = false;

    spawn.countBrt = round(random(spawn.wave, spawn.wave + 1));    //Adjust enemy count to the new wave number
    spawn.countSpd = round(random(spawn.wave, spawn.wave + 3));
    spawn.countGrnt = round(random(spawn.wave, spawn.wave + 2));
    spawn.countHvy = round(random(spawn.wave, spawn.wave + 1));
    spawn.countBss = round(spawn.wave / 5);

    damage.pause();
    bruh.pause();
    garfield.pause();
    achievement.pause();
    buying1.pause();
    buying2.pause();
    buying3.pause();
    buying4.pause();
    buying5.pause();
    buying6.pause();
    buying7.pause();
    cantbuy1.pause();
    cantbuy2.pause();
    missing1.pause();
    missing2.pause();
    ohhimark.pause();
    uhoh.pause();
    shieldup.pause();
    ultimatemachinegun.pause();
    speedup.pause();
    garfieldSans.pause();
  }
}
class Game_Manager {
  boolean login;
  boolean dead;
  boolean statspage;
  boolean creditspage;
  boolean controls;
  boolean home;
  boolean hscore;
  boolean shake;

  int trackNumber;

  boolean inputBlockedUI;
  boolean inputtingCode;

  String codeRESET = "oooooooooo";
  String codeDoom = "ssssss";
  String codeUndertale = "sswd";
  String codeStreetFighter = "ssddl";
  String codeKonami = "wwssadadkl";
  String codeDMC = "aaaaaddddd";
  String codeFireEmblem = "wswsad";
  String codeXenoblade = "sdwas";
  String code = "";

  int konamiCodeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25f;

  float  badgePosX, badgePosY;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
    trackNumber = 1;
    konamiCodeLength = 10;

    badgePosX = width/2 + 375;
    badgePosY = height/5 + 30;
  }

  public void draw() {



    if (statspage) {
      //home = false;
      //stats.draw();
      //stats.keyReleased();
      //chieves.draw();
    }
    if (creditspage) {
      home = false;
      credits.draw();
      credits.keyReleased();
      chieves.draw();
    }

    if (login) {

      game = false;
      Login.draw();
      spawn.wave = 1;
      loginMusic.setGain(0);
      if (!loginMusic.isPlaying()) 
      {
        loginMusic.play();
        loginMusic.rewind();
      }
      image(pokemonMDB, badgePosX, badgePosY);
      chieves.draw();
    }
    if (home) {

      UI.draw();
      loginMusic.rewind();
      loginMusic.pause();
      death.rewind();
      death.pause();
      game = false;
      dead = false;
      homeSnd.setGain(0);
      if (!homeSnd.isPlaying() ) {
        homeSnd.play();
        homeSnd.rewind();
      }

      chieves.draw();
    }
    if (hscore) {
      if (hscoreA == 0) {
        hscorel = new hScorelijst();
      }
      hscoreA = 1;
      hscorel.draw();
    }

    if (game) {

      switch(trackNumber) {
      case 1:
        gameMusic.setGain(-10);
        if (!gameMusic.isPlaying()) {
          gameMusic.play();
          gameMusic.rewind();
        }
        break;
      case 2:
        contraJungleTheme.setGain(0);
        if (!contraJungleTheme.isPlaying())
        {
          contraJungleTheme.play();
          contraJungleTheme.rewind();
        }
        break;
      case 3:
        guilesTheme.setGain(0);
        if (!guilesTheme.isPlaying())
        {
          guilesTheme.play();
          guilesTheme.rewind();
        }
        break;
      case 4:
        megalovania.setGain(0);
        if (!megalovania.isPlaying())
        {
          megalovania.play();
          megalovania.rewind();
        }
        break;
      case 5:
        e1m1.setGain(0);
        if (!e1m1.isPlaying())
        {
          e1m1.play();
          e1m1.rewind();
        }
        break;
      case 6:
        devilMayCry.setGain(0);
        if (!devilMayCry.isPlaying()) {
          devilMayCry.play();
          devilMayCry.rewind();
        }
        break;
      case 7:
        fireEmblem.setGain(0);
        if (!fireEmblem.isPlaying()) {
          fireEmblem.play();
          fireEmblem.rewind();
        }
        break;
      case 8:
        xenoblade.setGain(0);
        if (!xenoblade.isPlaying()) {
          xenoblade.play();
          xenoblade.rewind();
        }
        break;
      }

      if (UI.levens <= 0) {
        gamemngr.dead = true;
      }

      homeSnd.pause();

      ascore.draw();

      spawn.draw();
    }





    if (dead) {
      game = false;
      gameover.draw();
    }

    chieves.draw();
  }

  public void screenShake() {
    translate(-shakeAmount, shakeAmount);
    shake = false;
  }

  public void keyPressed() {

    // Stats for devs (Show us information)
    if (key == 'p') 
    {
      println("-------------------------------DEBUG-------------------------------");
      println("PlayerName: " + ascore.name + " ID: " + User.currentUser);
      println("Levens: " + UI.levens + " Shield: " + UI.shield);
      println("GameObjects: " + GameObjectRef.gameObject.size() + " Brt: " + spawn.countBrt + " Hvy: " + spawn.countHvy + " Grnt: " + spawn.countGrnt + " Spd: " + spawn.countSpd + " Bss: " + spawn.countBss + " Total Enemy Count: " + spawn.totalEnemyCount);
      println("Wave: " + spawn.wave + " In progress: " + spawn.waveInProgress + " Finished: " + spawn.waveFinished);
      println("Shop: " + shop.shopA);
    }



    if (login) {
      Login.keyPressed();
    }
    if (dead) {
      gameover.keyPressed();
    }
    if (game) {
      myPlayer.keyPressed();
    }
    if (home) {


      switch(key)        //KEY
      {
      case 'r':
        println("PRESSED SELECT");
        break;

      case 'w':
        if (inputtingCode)
          code += key;
        break;

      case 's':
        if (inputtingCode)
          code += key;
        break;

      case 'a':
        if (inputtingCode)
          code += key;
        break;

      case 'd':
        if (inputtingCode)
          code += key;
        break;

      case 'o':
        if (inputtingCode)
          code +=key;
        break;
      }


      switch(keyCode)    //KEYCODE
      {
      case UP:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'j';
          code += key;
        }
        break;

      case LEFT:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'h';
          code += key;
        }
        break;

      case DOWN:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'k';
          code += key;
        }
        break;

      case RIGHT:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'l';
          code += key;
        }
        break;

      case RETURN:
        if (inputtingCode)
        {
          if (code.equals(codeRESET))
          {
            //RESET Achievements
            if (msql.connect())
            {
              msql.query("DELETE FROM User_has_Achievements");
            }
          }

          if (code.equals(codeKonami))
          {
            chieves.UnlockAchievement(3);

            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            chieves.UnlockAchievement(4);

            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
          }

          if (code.equals(codeUndertale))
          {
            chieves.UnlockAchievement(5);

            println("You're gonna have a bad time");
            if (trackNumber == 4)
              trackNumber = 1;
            else trackNumber = 4;
          }

          if (code.equals(codeDoom))
          {
            chieves.UnlockAchievement(6);

            println("At Doom's Gate");
            if (trackNumber == 5)
              trackNumber = 1;
            else trackNumber = 5;
          }
          if (code.equals(codeDMC))
          {
            println("You can cry if you want, it doesn't make you a crybaby. Does make you a little bitch though.");
            if (trackNumber == 6)
              trackNumber = 1;
            else trackNumber = 6;
          }
          if (code.equals(codeFireEmblem))
          {
            println("kill EVERY LAST ONE OF THEM");
            if (trackNumber == 7)
              trackNumber = 1;
            else trackNumber = 7;
          }
          if (code.equals(codeXenoblade))
          {
            println("You've caught Territorial Rotbart's attention!");
            if (trackNumber == 8)
              trackNumber = 1;
            else trackNumber = 8;
          }

          code = code.substring(0, code.length()-code.length());
        }
        break;



      case ENTER:
        if (inputtingCode)
        {
          if (code.equals(codeRESET))
          {
            //RESET Achievements
            if (msql.connect())
            {
              msql.query("DELETE FROM User_has_Achievements");
            }
          }

          if (code.equals(codeKonami))
          {
            chieves.UnlockAchievement(3);

            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            chieves.UnlockAchievement(4);

            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
          }

          if (code.equals(codeUndertale))
          {
            chieves.UnlockAchievement(5);

            println("You're gonna have a bad time");
            if (trackNumber == 4)
              trackNumber = 1;
            else trackNumber = 4;
          }

          if (code.equals(codeDoom))
          {
            chieves.UnlockAchievement(6);

            println("At Doom's Gate");
            if (trackNumber == 5)
              trackNumber = 1;
            else trackNumber = 5;
          }
          if (code.equals(codeDMC))
          {
            println("You can cry if you want, it doesn't make you a crybaby. Does make you a little bitch though.");
            if (trackNumber == 6)
              trackNumber = 1;
            else trackNumber = 6;
          }
          if (code.equals(codeFireEmblem))
          {
            println("kill EVERY LAST ONE OF THEM");
            if (trackNumber == 7)
              trackNumber = 1;
            else trackNumber = 7;
          }
          if (code.equals(codeXenoblade))
          {
            println("You've caught Territorial Rotbart's attention!");
            if (trackNumber == 8)
              trackNumber = 1;
            else trackNumber = 8;
          }
          code = code.substring(0, code.length()-code.length());
        }
        break;
      }


      if (!inputtingCode && !inputBlockedUI)
        UI.keyPressed();
    }
  }


  public void keyReleased() {
    if (hscore) {
      if (keyCode == DOWN) {
        hscore = false;
        home = true;
      }
    }

    if (home)
    {
      if (code.length() > konamiCodeLength - 1)
        code = code.substring(0, code.length() - (code.length() - konamiCodeLength));

      switch(key)
      {
      case 'r':      
        code = code.substring(0, code.length()-code.length());
        if (inputtingCode && inputBlockedUI)
        {
          inputtingCode = false;
          inputBlockedUI = false;
        } else
          if (!inputtingCode && !inputBlockedUI)
          {
            inputtingCode = true;
            inputBlockedUI = true;
          }
        break;
      }
    }

    if (game) {
      myPlayer.keyReleased();
    }
  }
}
class Item extends GameObject {

  Timer voicelineTimer = new Timer(0.5f);

  int randomPowerUp;
  int totalItems = 13;

  float tempObjPosX, tempObjPosY;
  int vlCantBuy, vlCanBuy;


  //initiales the width and height of the powerups.
  Item(float objPosX, float objPosY, int shopItemNumberInput)
  {
    tag = "item";

    shopItemNumber = shopItemNumberInput;


    //Cant buy machine gun upgrades if you already have them / are missing the previous
    if (shopItemNumber == 8 && (myPlayer.machineGun.upgradeLevel == 2 || myPlayer.machineGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 9 && (myPlayer.machineGun.upgradeLevel == 1 || myPlayer.machineGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));

    //Cant buy shotgun upgrades if you already have them / are missing the previous
    if (shopItemNumber == 10 && (myPlayer.shotGun.upgradeLevel == 1 || myPlayer.shotGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 11 && (myPlayer.shotGun.upgradeLevel == 1 || myPlayer.shotGun.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));

    //Cant buy pistol upgrades if you already have them / are missing the previous
    if (shopItemNumber == 12 && (myPlayer.pistol.upgradeLevel == 1 || myPlayer.pistol.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));
    if (shopItemNumber == 13 && (myPlayer.pistol.upgradeLevel == 1 || myPlayer.pistol.upgradeLevel == 3))
      shopItemNumber = round(random(8, totalItems));



    if (shopItemNumber < 1)
      shopItemNumber = 1;

    if (shopItemNumber > totalItems)
      shopItemNumber = totalItems;

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    //
    if (msql.connect())
    {
      msql.query("SELECT priceItemBase FROM Items WHERE idItem = '%s'", shopItemNumber);
      while (msql.next())
      {
        itemPrice = parseInt(msql.getString("priceItemBase")) * spawn.wave;
      }
    }
  }


  public void draw()
  {
    if (spawn.wave % 2 != 0)
      Remove(this);

    switch(shopItemNumber) {
    case 1:
      //HEALTH
      healthUp.draw(tempObjPosX, tempObjPosY);
      healthUp.update();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.levens ++;
          //uhoh.setGain(30);
          //uhoh.play();
          //uhoh.rewind();


          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
          }
      }
      break;



    case 2:
      // Ammo MG 1 load
      image(arLoad, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 60;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 3:
      //Ammo MG 2 load

      image(arLoad2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 120;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 4:
      //Ammo MG 2 load

      image(arFullLoad, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxM1 += 300;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 5:
      //Shotgun 1 load

      image(shotg_load, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 10;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 6:
      //Shotgun 2 load

      image(shotg_load2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 15;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 7:
      //Shotgun full load

      image(shotg_load2, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {
          UI.maxS1 += 20;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 8:
      // MachineGun Upgrade 2
      pushStyle();
      LMG1_right.resize(70, 16);
      image(LMG1_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.machineGun.upgradeLevel = 2;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 9:
      // MachineGun Final Upgrade

      pushStyle();
      LMG2_right.resize(70, 16);
      image(LMG2_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.machineGun.upgradeLevel = 3;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 10:
      // Shotgun Upgrade 2

      image(pumpR, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.shotGun.upgradeLevel = 2;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 11:
      // Shotgun Final Upgrade

      pushStyle();
      shotg_right.resize(50, 45);
      image(shotg_right, tempObjPosX, tempObjPosY);
      popStyle();

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.shotGun.upgradeLevel = 3;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 12:
      // Pistol second Upgrade

      image(rayGunP_right, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.pistol.upgradeLevel = 2;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;

    case 13:
      // Pistol final Upgrade

      image(treeGun_right, tempObjPosX, tempObjPosY);

      objWidth = 20;
      objHeight = 20;


      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        if (ascore.score >= itemPrice)
        {

          // Doe iets
          myPlayer.pistol.upgradeLevel = 3;

          if (voicelineTimer.TimerDone())
          {
            vlCanBuy = round(random(0, 7));
            voicelineTimer.Reset();
          }

          ascore.score -= itemPrice;

          Remove(this);
        } else
          if (voicelineTimer.TimerDone())
          {
            vlCantBuy = round(random(0, 2));
            voicelineTimer.Reset();
          }
      }
      break;
    }


    switch(vlCanBuy)
    {
    case 1:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying1.setGain(100);
        buying1.play();
        buying1.rewind();
      }
      break;
    case 2:
      if (!buying1.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying2.setGain(100);
        buying2.play();
        buying2.rewind();
      }
      break;
    case 3:
      if (!buying2.isPlaying() || !buying1.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying3.setGain(100);
        buying3.play();
        buying3.rewind();
      }
      break;
    case 4:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying1.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying4.setGain(100);
        buying4.play();
        buying4.rewind();
      }
      break;
    case 5:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying1.isPlaying() || !buying6.isPlaying() || !buying7.isPlaying() ) {
        buying5.setGain(100);
        buying5.play();
        buying5.rewind();
      }
      break;
    case 6:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying1.isPlaying() || !buying7.isPlaying() ) {
        buying6.setGain(100);
        buying6.play();
        buying6.rewind();
      }
      break;
    case 7:
      if (!buying2.isPlaying() || !buying3.isPlaying() || !buying4.isPlaying() || !buying5.isPlaying() || !buying6.isPlaying() || !buying1.isPlaying() ) {
        buying7.setGain(100);
        buying7.play();
        buying7.rewind();
      }
      break;
    }

    switch(vlCantBuy)
    {
    case 1:
      cantbuy1.setGain(100);
      if (!cantbuy2.isPlaying())
      {
        cantbuy1.play();
        cantbuy1.rewind();
      }
      break;
    case 2:
      cantbuy2.setGain(100);
      if (!cantbuy1.isPlaying())
      {
        cantbuy2.play();
        cantbuy2.rewind();
      }
      break;
    }

    pushStyle();
    fill(255);
    textSize(20);
    text(itemPrice, tempObjPosX, tempObjPosY + objHeight * 2);
    popStyle();
  }
}





















































//Drops the Speed powerup
//void DropSpeedUp() {
//  pushStyle();
//  fill(0, 200, 0);
//  ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, speedUpX, speedUpY) < speedUpDia) {
//    SpeedUp();
//  }
//}

//Set normalSpeed to 2.1 (Standard value)
//void SpeedUpDone() {
//  //myPlayer.bonusSpeed = 0;
//  myPlayer.normalSpeed = 2.1;
//}

//How the Speed power-up works
//void SpeedUp() {
//  powerUpSpd.Reset();
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.bonusSpeed = 3;
//  } else {
//    myPlayer.bonusSpeed = 0;
//  }
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.normalSpeed = 4.2;
//  } else {
//    SpeedUpDone();
//  }
//}

//Drops the speed power-up
//void DropHealthUp() {
//  pushStyle();
//  fill(200, 0, 0);
//  ellipse(healthUpX, healthUpY, healthUpDia, healthUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, healthUpX, healthUpY) < healthUpDia) {
//    HealthUp();
//  }
//}

//How the Health power-up works
//void HealthUp() {
//  if (UI.levens < 2) {
//    UI.levens ++;
//  }     
//  else if (UI.levens < 3) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 4) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 5) {
//    UI.levens ++;
//  }

//  healthUpX = -100;
//  healthUpY = -100;

//}

//Drops the Shield power-up
//void DropShield() {
//  pushStyle();
//  fill(0, 200, 200);
//  ellipse(shieldX, shieldY, shieldDia, shieldDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, shieldX, shieldY) < shieldDia) {
//    ShieldUp();
//  }
//}









//How the shield power-up works
//void Shield............() {
//  //Shield in working
//  for (int i = 0; i <10; i++) {
//    UI.shield ++;
//    if (UI.shield > 2) {
//      UI.shield = 2;
//    }
//  }
//}
class Level1
{






  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }
    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }


  public void Layer1()
  {

    image(levelTemplate, 0, 0);
  }


  public void Layer2()
  {  
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }


  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }



  public void Layer4()
  {
  }
}
class Level2
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
  }
}
class Level3
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[1].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize);
  }
}
class Level4
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[1].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[2].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize * 4);
  }
}
class Level5
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[1].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize);
    lvlMngr.turrets[2].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize * 4);
    lvlMngr.turrets[3].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize * 4);
  }
}
class Level6
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5f);
    lvlMngr.pillars[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 1.5f);
    lvlMngr.pillars[2].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 4.5f - 16);
    lvlMngr.pillars[3].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 4.5f - 16);
  }
}
class Level7
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5f);
    lvlMngr.pillars[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 1.5f);
    lvlMngr.pillars[2].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 4.5f - 16);
  }
}
class Level8
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5f);
    lvlMngr.pillars[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 1.5f);
  }
}
class Level9
{
  public void setup()
  {
  }


  public void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }

    Layer1();
    Layer2();
    Layer3();
    Layer4();
  }

  public void Layer1()
  {
    image(levelTemplate, 0, 0);
  }

  public void Layer2()
  {
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 1.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 2 + 8);
    flowerPatch.draw(-60 + lvlMngr.tileSize * 8.5f, -40 + lvlMngr.tileSize * 5 - 8);
    flowerPatch.update();
  }

  public void Layer3()
  {
    GameObjectRef.drawObjects();
    myPlayer.draw();
  }

  public void Layer4()
  {
    lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5f);
  }
}
class LevelManager
{
  int lvlNum = 1;
  int lvlCount = 9;
  int tileSize = 100;

  Level1 lvl1 = new Level1();
  Level2 lvl2 = new Level2();
  Level3 lvl3 = new Level3();
  Level4 lvl4 = new Level4();
  Level5 lvl5 = new Level5();
  Level6 lvl6 = new Level6();
  Level7 lvl7 = new Level7();
  Level8 lvl8 = new Level8();
  Level9 lvl9 = new Level9();

  boolean apActive = false;

  PVector apU, apD, apL, apR;


  int turretCount = 4;
  Turret[] turrets = new Turret[turretCount];

  int pillarCount = 4;
  Pillar[] pillars = new Pillar[pillarCount];

  public void setup()
  {
    lvl1.setup();
    lvl2.setup();
    lvl3.setup();
    lvl4.setup();
    lvl5.setup();
    lvl6.setup();
    lvl7.setup();
    lvl8.setup();
    lvl9.setup();

    apU = new PVector(width/2 - 33/2, 0);
    apD = new PVector(width/2 - 33/2, height - 49);
    apL = new PVector(0, height/2 - 38/2);
    apR = new PVector(width - 49, height/2 - 38/2);

    for (int i = 0; i < pillarCount; i++)
    {
      pillars[i] = new Pillar();
    }

    for (int i = 0; i < turretCount; i++)
    {
      turrets[i] = new Turret("regular");
    }
  }

  public void draw()
  {

    if (lvlNum < 1)
      lvlNum = 1;


    switch(lvlNum) {
    case 1:
      lvl1.draw();
      break;
    case 2:
      lvl2.draw();
      break;
    case 3:
      lvl3.draw();
      break;
    case 4:
      lvl4.draw();
      break;
    case 5:
      lvl5.draw();
      break;
    case 6:
      lvl6.draw();
      break;
    case 7:
      lvl7.draw();
      break;
    case 8:
      lvl8.draw();
      break;
    case 9:
      lvl9.draw();
      break;
    }

    if (apActive)
    {
      arrowPU.draw(apU.x, apU.y);
      arrowPD.draw(apD.x, apD.y);
      arrowPL.draw(apL.x, apL.y);
      arrowPR.draw(apR.x, apR.y);

      arrowPU.update();
      arrowPD.update();
      arrowPL.update();
      arrowPR.update();

      if ((myPlayer.objPosX + myPlayer.moveVelX < apU.x + 33 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apU.x && myPlayer.objPosY + myPlayer.moveVelY < apU.y + 49 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apU.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apD.x + 33 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apD.x && myPlayer.objPosY + myPlayer.moveVelY < apD.y + 49 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apD.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apL.x + 49 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apL.x && myPlayer.objPosY + myPlayer.moveVelY < apL.y + 38 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apL.y)
        ||
        (myPlayer.objPosX + myPlayer.moveVelX < apR.x + 49 && myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > apR.x && myPlayer.objPosY + myPlayer.moveVelY < apR.y + 38 && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > apR.y))
      {
        spawn.NextWave();
      }
    }
  }
}


//lvlMngr.turrets[0].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize);
//lvlMngr.turrets[1].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize);
//lvlMngr.turrets[2].draw(-60 + lvlMngr.tileSize * 2, -40 + lvlMngr.tileSize * 4);
//lvlMngr.turrets[3].draw(-60 + lvlMngr.tileSize * 9, -40 + lvlMngr.tileSize * 4);

//lvlMngr.pillars[0].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 1.5);
//lvlMngr.pillars[1].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 1.5);
//lvlMngr.pillars[2].draw(-60 + lvlMngr.tileSize * 3, -40 + lvlMngr.tileSize * 4.5 - 16);
//lvlMngr.pillars[3].draw(-60 + lvlMngr.tileSize * 10, -40 + lvlMngr.tileSize * 4.5 - 16);
// TE4M
// Quinn Koene


class Login {

  // char containing the letter on screen
  char letter1;
  char letter2;
  char letter3;
  char letter4;

  // All x positions of the letters
  int xPos1;
  int xPos2;
  int xPos3;
  int xPos4;

  int state = 1;
  // All letter states based on where they are in line
  int l1s;
  int l2s;
  int l3s;
  int l4s;


  // Array containing all available letters
  char letters[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

  //int bN;
  //int bList;
  //String blacklist[] = new String[bList];
  //String word;

  Login() {
    // Attempt blacklist, not working yet!
    //if (msql.connect() && bN < 10) { // Als geconnect is met database & Ans kleiner is dan 10
    //  msql.query( "SELECT * FROM blacklist");
    //  while ( msql.next() && bN < 10) {
    //    word = msql.getString("word"); // string name is 'name' uit database
    //    blacklist = append(blacklist, word); // Voeg name toe aan de array names
    //    bList++;
    //    bN++;
    //  }
    //} else { 
    //  println("ERROR: Couldn't fetch blacklist!");
    //}
  }

  public void draw() {
    clear();
    login.resize(width, height);
    image(login, 0, 0);
    // Turn everything off!
    myPlayer.shootingRight = false;
    myPlayer.shootingLeft = false;
    myPlayer.shootingUp = false;
    myPlayer.shootingDown = false;
    myPlayer.lookingLeft = false;
    myPlayer.lookingRight = false;
    myPlayer.lookingUp = false;
    myPlayer.lookingDown = true;

    // The dot under the letters depending on which state they are
    if (state == 1) {
      image(arrow, width/2-125, height/2 - 100);
      //circle(width/2-135, height/2 + 20, 10);
    }
    if (state == 2) {
      image(arrow, width/2-45, height/2 - 100);
      //circle(width/2 - 55, height/2 + 20, 10);
    }
    if (state == 3) {
      image(arrow, width/2 + 35, height/2 - 100);
      //circle(width/2 + 25, height/2 + 20, 10);
    }
    if (state == 4) {
      image(arrow, width/2 + 115, height/2 - 100);
      //circle(width/2 + 105, height/2 + 20, 10);
    }

    // Make all letters writable (So you can write them with text)
    letter1 = letters[l1s]; 
    letter2 = letters[l2s];
    letter3 = letters[l3s];
    letter4 = letters[l4s];


    // Aline the letters in the middle

    xPos1 = width/2-120;
    xPos2 = width/2 - 40;
    xPos3 = width/2 + 40;
    xPos4 = width/2 + 120;

    // Draw all letters on screen
    pushStyle();
    textSize(80);
    textAlign(CENTER);
    fill(200);
    text(""+letter1, xPos1, height/2 - 20);
    text(""+letter2, xPos2, height/2 - 20);
    text(""+letter3, xPos3, height/2 - 20);
    text(""+letter4, xPos4, height/2 - 20);
    popStyle();
  }

  public void keyPressed() {
    if (gamemngr.login) {
      if (key == '\n') {
        ascore.name = str(letters[l1s]) + str(letters[l2s]) + str(letters[l3s]) + str(letters[l4s]);
        User.idCheck();
        //Friends.totalFriends();
        //Friends.totalPlayers();
        // If button ^ pressed then save all letters into ascore.name & run function ascore.saveScore
        //  for (int i = 0; i < bN; i++) {
        // if (ascore.name != blacklist[i] ) { Attempt for blacklist, not working yet!
        gamemngr.login = false;     
        gamemngr.home = true;
      }
    }
    // Check what state & depending on state move through the letters upwards 
    if (key == 'w') {
      if (state == 1 && l1s < 36) {
        l1s++;
      }
      if (state == 1 && l1s > 35 ) {
        l1s = 0;
      }
      if (state == 2 && l2s < 36) {
        l2s++;
      }
      if (state == 2 && l2s > 35) {
        l2s = 0;
      }
      if (state == 3 && l3s < 36) {
        l3s++;
      }
      if (state == 3 && l3s > 35) {
        l3s = 0;
      }
      if (state == 4 && l4s < 36) {
        l4s++;
      }
      if (state == 4 && l4s > 35) {
        l4s = 0;
      }
    } 
    // Check what state & depending on state, lower state
    if (key == 'a') {
      if (state > 1) {
        state--;
      }
    }
    // Check what state & depending on state, make state higher
    if (key == 'd') {
      if (state < 4) {
        state++;
      }
    }
    // Check what state & depending on state move through the letters downwards 
    if (key == 's') {
      if (state == 1 && l1s > -1) {
        l1s--;
      }
      if (state == 1 && l1s < 0) {
        l1s = 36;
      }
      if (state == 2 && l2s > -1) {
        l2s--;
      }
      if (state == 2 && l2s < 0) {
        l2s = 36;
      }
      if (state == 3 && l3s > -1) {
        l3s--;
      }
      if (state == 3 && l3s < 0) {
        l3s = 36;
      }
      if (state == 4 && l4s > -1) {
        l4s--;
      }
      if (state == 4 && l4s < 0) {
        l4s = 36;
      }
    }
  }
}
// TE4M
// Dylan Vermeulen
class MachineGun extends GameObject {



  Timer cooldownTimer = new Timer(0.2f);


  MachineGun() 
  {
    knockback = 15;
    upgradeLevel = 1;
  }

  public void holdingGun() {

    switch(upgradeLevel) {
    case 1:
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        image(arU, objPosX, objPosY);

        myPlayer.muzzlePointX = objPosX + arU.width/2 - 2;
        myPlayer.muzzlePointY = objPosY + arU.height;
      } else if (myPlayer.lookingDown) 
      {


        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        image(arD, objPosX, objPosY);

        myPlayer.muzzlePointX = objPosX + arU.width/2;
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 10;
        image(arR, objPosX, objPosY);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 8;
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 10;
        image(arL, objPosX, objPosY);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 8;
      }
      break;
    case 2:
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        LMG1_up.resize(16, 70);
        image(LMG1_up, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + arU.width/2;
        myPlayer.muzzlePointY = objPosY + 5;
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2;
        pushStyle();
        LMG1_down.resize(16, 70);
        image(LMG1_down, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + arU.width/2 + 1;
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 20;
        pushStyle();
        LMG1_right.resize(70, 16);
        image(LMG1_right, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX + 10;
        myPlayer.muzzlePointY = objPosY + 2;
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - 40;
        objPosY = myPlayer.objPosY + 20;
        pushStyle();
        LMG1_left.resize(70, 16);
        image(LMG1_left, objPosX, objPosY);
        popStyle();

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 3;
      }
      break;
    case 3:
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2 - 10;
        pushStyle();
        LMG2_up.resize(16, 70);
        image(LMG2_up, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + arU.width/2;
        myPlayer.muzzlePointY = objPosY + 5;
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2-10;
        pushStyle();
        LMG2_down.resize(16, 70);
        image(LMG2_down, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + arU.width/2 + 1;
        myPlayer.muzzlePointY = objPosY + arU.height/2 - 20;
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 15;
        pushStyle();
        LMG2_right.resize(70, 16);
        image(LMG2_right, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX + 15;
        myPlayer.muzzlePointY = objPosY + 8;
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - 42;
        objPosY = myPlayer.objPosY + 15;
        pushStyle();
        LMG2_left.resize(70, 16);
        image(LMG2_left, objPosX, objPosY);
        popStyle();
        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 8;
      }
      break;
    }
  }


  public void shoot() {

    switch(upgradeLevel)
    {
    case 1:
      UI.capacityM1 = 300;

      break;
    case 2:
      UI.capacityM1 = 600;
      break;
    case 3:
      UI.capacityM1 = 900;
      break;
    }
    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingUp = true;

        Add(new Bullet(random(-0.5f, 0.5f), random(-14.5f, -15.5f)));
        UI.ammoM1--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.5f, 0.5f), random(14.5f, 15.5f)));
        UI.ammoM1--;


        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -= knockback;

        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {
      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingLeft = true;

        Add(new Bullet(random(-14.5f, -15.5f), random(-0.5f, 0.5f)));
        UI.ammoM1--;


        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;


        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {

      if (UI.ammoM1 > 0 ) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.5f, 15.5f), random(-0.5f, 0.5f)));
        UI.ammoM1--;


        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;


        AR1.play();
        AR1.rewind();
      } else {
        AR1Empty.play();
        AR1Empty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
//Ruben de Jager
class Particle extends GameObject {
  float particleAlpha;

  Particle(float incomingX, float incomingY) {
    objPosX=incomingX;
    objPosY=incomingY;
    moveVelX=random(-5, 5);
    moveVelY=random(-5, 5);
    objWidth=5;
    objHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  public void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(bloodOrb, objPosX, objPosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    objPosX += moveVelX;
    objPosY += moveVelY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow
}//class Particle

class ParticleGrunt extends GameObject {
  float particleAlpha;

  ParticleGrunt(float incomingX, float incomingY) {
    objPosX=incomingX;
    objPosY=incomingY;
    moveVelX=random(-5, 5);
    moveVelY=random(-5, 5);
    objWidth=5;
    objHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  public void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(gruntBlood, objPosX, objPosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    objPosX += moveVelX;
    objPosY += moveVelY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow
}//class ParticleGrunt

class ParticleHeavy extends GameObject {
  float particleAlpha;

  ParticleHeavy(float incomingX, float incomingY) {
    objPosX=incomingX;
    objPosY=incomingY;
    moveVelX=random(-5, 5);
    moveVelY=random(-5, 5);
    objWidth=5;
    objHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  public void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(heavyBlood, objPosX, objPosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    objPosX += moveVelX;
    objPosY += moveVelY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow
}//class ParticleHeavy

class ParticleBoss extends GameObject {
  float particleAlpha;

  ParticleBoss(float incomingX, float incomingY) {
    objPosX=incomingX;
    objPosY=incomingY;
    moveVelX=random(-5, 5);
    moveVelY=random(-5, 5);
    objWidth=5;
    objHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  public void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(bossBlood, objPosX, objPosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    objPosX += moveVelX;
    objPosY += moveVelY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow
}//class ParticleBoss
class Pillar extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;

  Pillar()
  {
    tag = "structure";

    objWidth = pillar.width;
    objHeight = pillar.height;
  }

  public void draw(float objPosX, float objPosY)
  {
    objPosX += objWidth/4;

    bbSW = 10;
    bbSH = objHeight/3 - 10;

    bbCW = objWidth - 10;
    bbCH = bbSW;


    //LEFT
    bbL.x = objPosX;
    bbL.y = objPosY + (objHeight/3 * 2) + 5;

    //RIGHT
    bbR.x = objPosX + objWidth - bbSW;
    bbR.y = bbL.y;

    //TOP
    bbT.x = objPosX + 5;
    bbT.y = bbL.y - 5;

    //BOTTOM
    bbB.x = bbT.x;
    bbB.y = objPosY + objHeight - bbCH + 5;



    //


    image(pillar, objPosX, objPosY);

    //rect(myPlayer.playerPosX, myPlayer.playerPosY, 5, 5);
    //rect(myPlayer.playerPosX + myPlayer.playerWidth, myPlayer.playerPosY + myPlayer.playerHeight, -5, -5);


    //Collision statement Player & Enemy

    if ((myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX) > bbL.x && myPlayer.objPosX + myPlayer.moveVelX < bbL.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbL.y && myPlayer.objPosY + myPlayer.moveVelY < bbL.y + bbSH)
    {
      myPlayer.collRight = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbR.x && myPlayer.objPosX + myPlayer.moveVelX < bbR.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbR.y && myPlayer.objPosY + myPlayer.moveVelY < bbR.y + bbSH)
    {
      myPlayer.collLeft = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbB.x && myPlayer.objPosX + myPlayer.moveVelX < bbB.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbB.y && myPlayer.objPosY + myPlayer.moveVelY < bbB.y + bbCH)
    {
      myPlayer.collTop = true;
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbT.x && myPlayer.objPosX + myPlayer.moveVelX < bbT.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbT.y && myPlayer.objPosY + myPlayer.moveVelY < bbT.y + bbCH)
    {
      myPlayer.collBott = true;
    }

    //Collision box visualisation
    //pushStyle();
    //noFill();
    //stroke(255);
    //rect(bbT.x, bbT.y, bbCW, bbCH);
    //rect(bbB.x, bbB.y, bbCW, bbCH);
    //rect(bbR.x, bbR.y, bbSW, bbSH);
    //rect(bbL.x, bbL.y, bbSW, bbSH);
    //popStyle();

    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {
      //Pillar Collision v Enemy
      if (GameObjectRef.gameObject.get(i).tag == "enemy")
      {
        if ((GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx) > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbL.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbL.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbL.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collRight = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbR.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbR.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbR.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collLeft = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbB.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbB.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbB.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbB.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collTop = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbT.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbT.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbT.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbT.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collBott = true;
        }
      }


      //Pillar Collision v Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).moveVelX > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).moveVelX < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).moveVelY > bbT.y && GameObjectRef.gameObject.get(i).objPosY + myPlayer.moveVelY < bbB.y + bbCH)
        {
          Remove(GameObjectRef.gameObject.get(i));
          ascore.ComboReset();
        }
      }
    }
  }
}
class Pistol extends GameObject {

  Timer cooldownTimer = new Timer(1);

  Pistol() {
    knockback = 5;
    upgradeLevel = 1;
  }


  public void holdingGun() {

    switch(upgradeLevel)
    {
    case 1:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(handgunUp, objPosX, objPosY);
        handgunUp.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(handgunDown, objPosX, objPosY);
        handgunDown.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(handgunRight, objPosX, objPosY);
        handgunRight.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 30;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(handgunLeft, objPosX, objPosY);
        handgunLeft.resize(35, 15);
        popStyle();
      }
      break;
    case 2:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(rayGunP_up, objPosX, objPosY);
        rayGunP_up.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(rayGunP_down, objPosX, objPosY);
        rayGunP_down.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(rayGunP_right, objPosX, objPosY);
        rayGunP_right.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 27;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(rayGunP_left, objPosX, objPosY);
        rayGunP_left.resize(35, 15);
        popStyle();
      }
      break;
    case 3:
      // Show weapon sprite based on which way the player is facing
      if (myPlayer.lookingUp) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        image(treeGun_up, objPosX, objPosY);
        treeGun_up.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingDown) 
      {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        pushStyle();
        image(treeGun_down, objPosX, objPosY);
        treeGun_down.resize(8, 35);
        popStyle();
      } else if (myPlayer.lookingRight)
      {
        objPosX = myPlayer.objPosX + objWidth + 20;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(treeGun_right, objPosX, objPosY);
        treeGun_right.resize(35, 15);
        popStyle();
      } else if (myPlayer.lookingLeft) 
      {
        objPosX = myPlayer.objPosX - objWidth - 27;
        objPosY = myPlayer.objPosY - objHeight/2 + 10;
        pushStyle();
        image(treeGun_left, objPosX, objPosY);
        treeGun_left.resize(35, 15);
        popStyle();
      }
      break;
    }
  }


  public void shoot() {

    myPlayer.muzzlePointX = objPosX;
    myPlayer.muzzlePointY = objPosY;



    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {


      if (UI.ammoP > 0) {
        myPlayer.lookingUp = true;
        Add(new Bullet(random(-0.25f, 0.25f), random(-14.75f, -15.25f)));
        UI.ammoP--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if (UI.ammoP > 0) {
        myPlayer.lookingDown = true;
        Add(new Bullet(random(-0.25f, 0.25f), random(14.75f, 15.25f)));
        UI.ammoP--;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -=knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if (UI.ammoP > 0) {
        myPlayer.lookingLeft = true;
        Add(new Bullet(random(-14.75f, -15.25f), random(-0.25f, 0.25f)));
        UI.ammoP--;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if (UI.ammoP > 0) {
        myPlayer.lookingRight = true;
        Add(new Bullet(random(14.75f, 15.25f), random(-0.25f, 0.25f)));
        UI.ammoP--;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Pistol.play();
        Pistol.rewind();
      } else {
        pistolEmpty.play();
        pistolEmpty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
// TE4M
// Dylan Vermeulen
class Player extends GameObject {

  // Short timer for the gun cycle
  Timer weaponSwapPrevTimer = new Timer(0.125f);
  Timer weaponSwapNextTimer = new Timer(0.125f);

  Timer speedUpTimer = new Timer(8);

  // Creates new objects from the gun's classes for the player to use
  Pistol pistol = new Pistol();
  Shotgun shotGun = new Shotgun();
  MachineGun machineGun = new MachineGun();

  int currentGun, pistoll, shotgun, machinegun;

  float muzzlePointX, muzzlePointY;

  boolean nextGun, prevGun, swapable;
  boolean speedUpCollected;

  Player() {
    speedUpCollected = false;

    objWidth = 28;
    objHeight = 40;
    objPosX = (width/2) - objWidth/2;
    objPosY = (height/2) - objHeight/2;

    // Tags the player so it can distinguish between the player and other objects
    tag = "player";


    // Assigns 1, 2 or 3 to gun variables to distinguish in coding
    pistoll = 1;
    shotgun = 2;
    machinegun = 3;

    // Default gun is pistol
    currentGun = pistoll;



    defaultSpeedInit = 2.1f;
    defaultSpeed = defaultSpeedInit;

    diaSpeedInit = (sqrt(sq(defaultSpeed) + sq(defaultSpeed)) / 2);
  }


  public void draw() {

    // powerup SpeedUp
    if (!speedUpCollected)
    {
      defaultSpeed = defaultSpeedInit;
      diaSpeed = diaSpeedInit;
    }

    if (speedUpCollected && !speedUpTimer.TimerDone())
    {
      defaultSpeed = defaultSpeedInit * 2;
      diaSpeed = diaSpeedInit * 2;
    }

    if (speedUpCollected && speedUpTimer.TimerDone())
      speedUpCollected = false;


    // Detects collision with pillars
    if (objPosX + moveVelX < 0)
      collLeft = true;

    if (objPosX + objWidth + moveVelX > width)
      collRight = true;

    if (objPosY + moveVelY < 0)
      collTop = true;

    if (objPosY + objHeight + moveVelY > height)
      collBott = true;

    // Switches to specified gun if you press 1, 2 or 3 on desktop
    if (onekey) {
      currentGun = pistoll;
      onekey = false;
    } else if (twokey) {
      currentGun = machinegun;
      twokey = false;
    } else if (threekey) {
      currentGun = shotgun;
      threekey = false;
    }

    // Cycle between the guns with a short cooldown
    if (prevGun && weaponSwapPrevTimer.TimerDone()) {
      weaponSwapPrevTimer.Reset();
      currentGun--;
    }
    if (nextGun && weaponSwapNextTimer.TimerDone()) {
      weaponSwapNextTimer.Reset();
      currentGun++;
    }

    // Makes sure the cycle keeps cycleing between 1 and 3
    if (currentGun > 3) {
      currentGun = 1;
    }
    if (currentGun < 1) {
      currentGun = 3;
    }



    // Switches functionality of gun depending on which one the player is holding
    if (myPlayer.currentGun == pistoll)
      pistol.holdingGun();

    if (myPlayer.currentGun == shotgun)
      shotGun.holdingGun();

    if (myPlayer.currentGun == machinegun)
      machineGun.holdingGun();


    // Draws where the player sprite is facing depending on the direction they look
    if (myPlayer.lookingLeft) {
      mrSpooksLeft.draw(objPosX, objPosY);
      mrSpooksLeft.update();
    } else if (myPlayer.lookingRight) {
      mrSpooksRight.draw(objPosX, objPosY);
      mrSpooksRight.update();
    } else if (myPlayer.lookingUp) {
      mrSpooksUp.draw(objPosX, objPosY);
      mrSpooksUp.update();
    } else if (myPlayer.lookingDown) {
      mrSpooksDown.draw(objPosX, objPosY);
      mrSpooksDown.update();
    }




    // Assigns value to movementspeed




    // Normalises the speed when moving diagonally
    if ((wkey && akey) || (akey && skey) || (skey && dkey) || (dkey && wkey)) {
      defaultSpeed = diaSpeed;
    } else if (!speedUpCollected && !speedUpTimer.TimerDone())
    {
      defaultSpeed = defaultSpeedInit;
    }
    // Shoots gun when pressing any of the directional buttons
    if (myPlayer.shootingUp || myPlayer.shootingDown || myPlayer.shootingRight || myPlayer.shootingLeft) {
      if (currentGun == pistoll)
      {
        pistol.shoot();
      }
      if (currentGun == machinegun)
      {
        machineGun.shoot();
      }
      if (currentGun == shotgun)
      {
        shotGun.shoot();
      }
    }

    moveVelX = defaultSpeed;
    moveVelY = defaultSpeed;

    // Check if the player is colliding with the pillars and stops them from moving through it
    if (akey && !collLeft)
    {
      objPosX -= moveVelX;
    }

    if (dkey && !collRight)
    {
      objPosX += moveVelX;
    }

    if (wkey && !collTop)
    {
      objPosY -= moveVelY;
    }

    if (skey && !collBott)
    {
      objPosY += moveVelY;
    }


    // Prevents collision catch
    collLeft = false;
    collRight = false;
    collTop = false;
    collBott = false;
  }

  // The defining controlls section \/\/\/\/
  public void keyPressed() {
    // Controls for shooting in all directions and looking in all directions
    switch(keyCode) {
    case LEFT:
      shootingLeft = true;
      shootingRight = false;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
      break;
    case RIGHT:
      shootingLeft = false;
      shootingRight = true;
      shootingDown = false;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
      break;
    case UP:
      shootingLeft = false;
      shootingRight = false;
      shootingDown = false;
      shootingUp = true;

      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;
      break;
    case DOWN:
      shootingLeft = false;
      shootingRight = false;
      shootingDown = true;
      shootingUp = false;

      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
      break;
    }

    // Controlls for walking in all directions
    switch(key) {
    case 'a':
      akey = true;
      lookingLeft = true;
      lookingUp = false;
      lookingRight = false;
      lookingDown = false;
      break;
    case 's':
      skey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = false;
      lookingDown = true;
      break;
    case 'd':
      dkey = true;
      lookingLeft = false;
      lookingUp = false;
      lookingRight = true;
      lookingDown = false;
      break;
    case 'w':
      wkey = true;
      lookingLeft = false;
      lookingUp = true;
      lookingRight = false;
      lookingDown = false;
      break;
    case '1':
      onekey = true;
      break;
    case '2':
      twokey = true;
      break;
    case '3':
      threekey = true;
      break;
    case 'q':
      prevGun = true;
      break;
    case 'e':
      nextGun = true;
      break;
    }
    //// Controls for switching weapons on desktop
    //if (key == '1') onekey = true;
    //if (key == '2') twokey = true;
    //if (key == '3') threekey = true;

    //// Controls for switching weapons on a cycle with snes controller
    //if (key == 'q')
    //{
    //  prevGun = true;
    //}
    //if (key =='e')
    //{
    //  nextGun = true;
    //}
  }
  public void keyReleased() {

    // Release for the walking directions   
    switch(key) {
    case 'a':
      akey = false;  
      break;
    case 's':
      skey = false;
      break;
    case 'd':
      dkey = false;
      break;
    case 'w':
      wkey = false;
      break;
    case 'q':
      prevGun = false;
      break;
    case 'e':
      nextGun = false;
      break;
    case '1':
      onekey = true;
      break;
    case'2':
      twokey = true;
      break;
    case '3':
      threekey = true;
      break;
    }

    // Release for controlls for whooting in all directions.
    switch(keyCode) {
    case LEFT:
      shootingLeft = false;
      break;
    case RIGHT:
      shootingRight = false;
      break;
    case UP:
      shootingUp = false;
      break;
    case DOWN:
      shootingDown = false;
      break;
    }

    //// Release for controls for switching weapons on desktop
    //if (key == '1') onekey = true;
    //if (key == '2') twokey = true;
    //if (key == '3') threekey = true;

    //// Release for controls for switching weapons on a cycle with snes controller 
    //if (key == 'q') prevGun = false;
    //if (key == 'e') nextGun = false;
  }
}
class Powerups extends GameObject {

  Timer powerUpLifeTimer = new Timer(10);

  int randomPowerUp;
  int totalPowerUps = 4;

  float tempObjPosX, tempObjPosY;

  //initiales the width and height of the powerups.
  Powerups(float objPosX, float objPosY) {

    powerUpChance = 2;

    tempObjPosX = objPosX;
    tempObjPosY = objPosY;

    objWidth = 20;
    objHeight = 20;

    randomPowerUp = round(random(0, totalPowerUps));

    powerUpLifeTimer.Reset();
  }

  public void draw()
  {

    if (powerUpLifeTimer.TimerDone()) {
      Remove(this);
    }

    switch(randomPowerUp) {
    case 1:
      //SPEEDUP
      speedUp.draw(tempObjPosX, tempObjPosY);
      speedUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {

        //powerUps.speedUpCollected = true;
        myPlayer.speedUpCollected = true;
        myPlayer.speedUpTimer.Reset();
        speedup.setGain(30);
        speedup.play();
        speedup.rewind();
        Remove(this);
      }
      break;

    case 2:
      //HEALTH
      healthUp.draw(tempObjPosX, tempObjPosY);
      healthUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        UI.levens ++;
        Remove(this);
      }
      break;

    case 3:
      //SHIELDS
      shieldUp.draw(tempObjPosX, tempObjPosY);
      shieldUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {    
        UI.shield ++;
        shieldup.setGain(30);
        shieldup.play();
        shieldup.rewind();
        Remove(this);
      }
      break;

    case 4:
      //MULTIPLIER
      multiplierUp.draw(tempObjPosX, tempObjPosY);
      multiplierUp.update();

      if (tempObjPosX < myPlayer.objPosX + myPlayer.objWidth && tempObjPosX + objWidth > myPlayer.objPosX && tempObjPosY < myPlayer.objPosY + myPlayer.objHeight && tempObjPosY + objHeight > myPlayer.objPosY)
      {
        ascore.combo *= 2;
        Remove(this);
      }
    }
  }
}


//Drops the Speed powerup
//void DropSpeedUp() {
//  pushStyle();
//  fill(0, 200, 0);
//  ellipse(speedUpX, speedUpY, speedUpDia, speedUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, speedUpX, speedUpY) < speedUpDia) {
//    SpeedUp();
//  }
//}

//Set normalSpeed to 2.1 (Standard value)
//void SpeedUpDone() {
//  //myPlayer.bonusSpeed = 0;
//  myPlayer.normalSpeed = 2.1;
//}

//How the Speed power-up works
//void SpeedUp() {
//  powerUpSpd.Reset();
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.bonusSpeed = 3;
//  } else {
//    myPlayer.bonusSpeed = 0;
//  }
//  if (!powerUpSpd.TimerDone()) {
//    myPlayer.normalSpeed = 4.2;
//  } else {
//    SpeedUpDone();
//  }
//}

//Drops the speed power-up
//void DropHealthUp() {
//  pushStyle();
//  fill(200, 0, 0);
//  ellipse(healthUpX, healthUpY, healthUpDia, healthUpDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, healthUpX, healthUpY) < healthUpDia) {
//    HealthUp();
//  }
//}

//How the Health power-up works
//void HealthUp() {
//  if (UI.levens < 2) {
//    UI.levens ++;
//  }     
//  else if (UI.levens < 3) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 4) {
//    UI.levens ++;
//  }    
//  else if (UI.levens < 5) {
//    UI.levens ++;
//  }

//  healthUpX = -100;
//  healthUpY = -100;

//}

//Drops the Shield power-up
//void DropShield() {
//  pushStyle();
//  fill(0, 200, 200);
//  ellipse(shieldX, shieldY, shieldDia, shieldDia);
//  popStyle();

//  if (dist(myPlayer.objPosX+myPlayer.objWidth/2, myPlayer.objPosY+myPlayer.objHeight/2, shieldX, shieldY) < shieldDia) {
//    ShieldUp();
//  }
//}









//How the shield power-up works
//void Shield............() {
//  //Shield in working
//  for (int i = 0; i <10; i++) {
//    UI.shield ++;
//    if (UI.shield > 2) {
//      UI.shield = 2;
//    }
//  }
//}
class Shop {


  float cartW = 300;
  float cartH = 200;

  float cartPosX ;
  float cartPosY ;

  float beginPosX=-100;
  float beginPosY=height/2;

  float endPosX=width/2 +150;
  float endPosY = height/2; 

  PVector item1Pos;
  PVector item2Pos;
  PVector item3Pos;

  int itemPriceCurrent, itemPriceBase;
  int totalShopItems;

  boolean shopA = false;
  boolean shopItemsHaveSpawned = false;



  Shop() 
  {
    item1Pos=new PVector();
    item2Pos=new PVector();
    item3Pos=new PVector();

    item1Pos.x=width/2-100;
    item1Pos.y=height/2+50;
    item2Pos.x=width/2;
    item2Pos.y=height/2+50;
    item3Pos.x=width/2+100;
    item3Pos.y=height/2+50;

    cartPosX=beginPosX;
    cartPosY=beginPosY;

    Reset();
  }


  public void draw() 
  {
    if (game)
    {
      if (endPosX - cartPosX>=0) 
      {

        cartPosX+=3;
        if (gamemngr.trackNumber == 4) 
        {
          shopcartSansGarfield.draw(cartPosX - cartW, cartPosY - cartH);
          shopcartSansGarfield.update();



          garfieldSans.setGain(50);
          garfieldSans.play();
          garfieldSans.rewind();
        } else 
        {     
          shopcart.draw(cartPosX-cartW, cartPosY-cartH);
          shopcart.update();

          garfield.setGain(50);
          garfield.play();
          garfield.rewind();
        }
        cartdirt.draw(cartPosX-cartW, cartPosY-cartH);
        cartdirt.update();
      } else 
      {
        if (gamemngr.trackNumber == 4) {
          shopcartSansGarfieldStationary.update();
          shopcartSansGarfieldStationary.draw(cartPosX - cartW, cartPosY - cartH);

          if (!shopItemsHaveSpawned)
            SpawnItems();
        } else
        {


          stationaryShopcart.update();
          stationaryShopcart.draw(cartPosX-cartW, cartPosY-cartH);

          if (!shopItemsHaveSpawned)
            SpawnItems();
        }
      }
    }
  }


  public void Reset()
  {
    cartPosX = beginPosX;
    garfield.pause();      //Reset shop sound
    garfield.rewind();
    garfieldSans.pause();
    garfieldSans.rewind();

    shopItemsHaveSpawned = false;
  }



  public void SpawnItems() {

    GameObjectRef.Add(new Item(item1Pos.x, item1Pos.y, round(random(0, 7))));
    GameObjectRef.Add(new Item(item2Pos.x, item2Pos.y, round(random(0, 7))));
    GameObjectRef.Add(new Item(item3Pos.x, item3Pos.y, round(random(8, 13))));
    shopItemsHaveSpawned = true;
  }
}
class Shotgun extends GameObject {


  Timer cooldownTimer = new Timer(1.5f);

  Shotgun() {
    knockback = 40;
    upgradeLevel = 1;
  }

  //shotg_up, shotg_right, shotg_left, shotg_down; 

  public void holdingGun() {

    switch(upgradeLevel)
    {
    case 1:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        image(doubleBu, objPosX, objPosY);
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+6;
        image(doubleBd, objPosX, objPosY);
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX - 7;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBr, objPosX, objPosY);
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 15;
        image(doubleBl, objPosX, objPosY);
        //handgunLeft.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      }
      break;
    case 2:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;

        image(pumpU, objPosX, objPosY);
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2+4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2+10;
        image(pumpD, objPosX, objPosY);
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX;
        objPosY = myPlayer.objPosY + 10;
        image(pumpR, objPosX, objPosY);
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY + 10;
        image(pumpL, objPosX, objPosY);
        //handgunLeft.resize(35, 16);

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY;
      }
      break;

    case 3:
      if (myPlayer.lookingUp) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY - myPlayer.objHeight/2;
        pushStyle();
        shotg_up.resize(25, 60);
        image(shotg_up, objPosX, objPosY);

        popStyle();
        //handgunUp.resize(8, 35);

        myPlayer.muzzlePointX = objPosX + 8;
        myPlayer.muzzlePointY = objPosY - 15;
      } else if (myPlayer.lookingDown) {
        objPosX = myPlayer.objPosX + myPlayer.objWidth/2-4;
        objPosY = myPlayer.objPosY + myPlayer.objHeight/2;
        pushStyle();
        shotg_down.resize(25, 60);
        image(shotg_down, objPosX, objPosY);

        popStyle();
        //handgunDown.resize(8, 35);

        myPlayer.muzzlePointX = objPosX + 8;
        myPlayer.muzzlePointY = objPosY;
      } else if (myPlayer.lookingRight) {
        objPosX = myPlayer.objPosX + 7;
        objPosY = myPlayer.objPosY;
        pushStyle();
        shotg_right.resize(50, 45);
        image(shotg_right, objPosX, objPosY);
        popStyle();
        //handgunRight.resize(35, 16);

        myPlayer.muzzlePointX = objPosX + 5;
        myPlayer.muzzlePointY = objPosY + 10;
      } else if (myPlayer.lookingLeft) {
        objPosX = myPlayer.objPosX - 30;
        objPosY = myPlayer.objPosY;
        pushStyle();
        shotg_left.resize(50, 45);
        image(shotg_left, objPosX, objPosY);

        popStyle();

        myPlayer.muzzlePointX = objPosX;
        myPlayer.muzzlePointY = objPosY + 10;
      }
      break;
    }
  }



  public void shoot() {

    switch(upgradeLevel)
    {
    case 1:
      UI.capacityS1 = 20;
      break;
    case 2:
      UI.capacityS1 = 40;
      break;
    case 3:
      UI.capacityS1 = 60;
      break;
    }

    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingUp = true;
          Add(new Bullet(random(-2, 2), random(-14, -16)));
        }
        UI.ammoS1--;

        if (!myPlayer.collBott || myPlayer.objPosY + myPlayer.objHeight + knockback < height)
          myPlayer.objPosY += knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {


      if ( UI.ammoS1 > 0) {


        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingDown = true;
          Add(new Bullet(random(-2, 2), random(14, 16)));
        }
        UI.ammoS1--;

        if (!myPlayer.collTop || myPlayer.objPosY - knockback > 0)
          myPlayer.objPosY -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {


      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingRight = true;
          Add(new Bullet(random(14, 16), random(-2, 2)));
        }
        UI.ammoS1--;

        if (!myPlayer.collLeft || myPlayer.objPosX - knockback > 0)
          myPlayer.objPosX -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {


      if ( UI.ammoS1 > 0) {
        for (int i = 0; i < 5; i++)
        {
          myPlayer.lookingLeft = true;
          Add(new Bullet(random(-14, -16), random(-2, 2)));
        }
        UI.ammoS1--;

        if (!myPlayer.collRight || myPlayer.objPosX + myPlayer.objWidth + knockback < width)
          myPlayer.objPosX += knockback;

        Shotgun.play();
        Shotgun.rewind();
        pump_shotg.setGain(-5);
        pump_shotg.play();
        pump_shotg.rewind();
      } else {
        pump_shotg_empty.play();
        pump_shotg_empty.rewind();
      }
    }
    if (cooldownTimer.TimerDone())
      cooldownTimer.Reset();
  }
}
//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnSpdTimer = new Timer(6);
  Timer spawnGrntTimer = new Timer(7);
  Timer spawnBrtTimer = new Timer(8);
  Timer spawnHvyTimer = new Timer(10);
  Timer spawnBssTimer = new Timer(20);

  Timer waveTextTimer = new Timer(6);

  //int timer = 0;
  int wave = 1;

  int countBrt, countSpd, countGrnt, countHvy, countBss;


  boolean waveInProgress = false;

  boolean spawnBrtFinished, spawnGrntFinished, spawnSpdFinished, spawnHvyFinished, spawnBssFinished;
  boolean waveFinished = false;

  Spawner() {

    spawnerPos0.x=width/2;
    spawnerPos0.y= -10;

    spawnerPos1.x=width + 10;
    spawnerPos1.y = height/2;

    spawnerPos2.x = width/2;
    spawnerPos2.y = height + 10;

    spawnerPos3.x = -10;
    spawnerPos3.y = height/2;

    countBrt = round(random(wave, wave + 1));
    countSpd = round(random(wave, wave + 1));
    countGrnt = round(random(wave, wave + 1));
    countHvy = round(random(wave, wave + 1));
    countBss = round(wave / 5);

    totalEnemyCount = countBrt + countSpd + countGrnt + countHvy + countBss;
  }//constructor spawner






  public void draw() {

    //println(spawnSpdFinished, spawnGrntFinished, spawnBrtFinished, spawnHvyFinished, spawnBssFinished);
    //println(waveFinished);

    if (totalEnemyCount < 0)
      totalEnemyCount = 0;

    //println("Brute: " + countBrt + ", " +"Grunt: " + countGrnt + ", " +"Speed: " + countSpd + ", " +"Heavy: " + countHvy);
    if (game) {

      pushStyle();
      fill(255);

      if (!waveTextTimer.TimerDone())     //Show the text that tells you what wave you're on for as long as the waveTextTimer is not done
      { 
        pushStyle();
        textSize(80);
        textAlign(CENTER);
        text("WAVE "+ (wave), width/2, height/2);
        popStyle();
      }

      if (waveTextTimer.TimerDone() && !waveFinished && !waveInProgress)
        waveInProgress = true;

      if (waveFinished)     //When the wave is finished and there are no gameObjects on the screen, show the arrows, and if the round number is even show the shop
      {
        lvlMngr.apActive = true;

        if (wave % 2 == 0)
          shop.shopA = true;
      }

      if (shop.shopA)      //
        shop.draw();



      if (waveInProgress && !waveFinished)   //If the wave is in progress, spawn the enemies
      {
        SpawnWave();
      }
    }
  }//spawnerUpdate







  public void NextWave()
  {
    shop.Reset();



    waveInProgress = false;      //Reset wave progress
    waveFinished = false;


    spawn.wave ++;      //Set current wave number to the next

    countBrt = round(random(wave, wave + 1));    //Adjust enemy count to the new wave number
    countSpd = round(random(wave, wave + 3));
    countGrnt = round(random(wave, wave + 2));
    countHvy = round(random(wave, wave + 1));
    if (wave %5 == 0)
    {
      countBss = round(wave / 5);
    } else spawnBssFinished = true;

    totalEnemyCount = countBrt + countSpd + countGrnt + countHvy + countBss;


    spawnBrtFinished = false;
    spawnSpdFinished = false;
    spawnGrntFinished = false;
    spawnHvyFinished = false;
    spawnBssFinished = false;



    shop.shopA = false;          //Make sure the shop is turned off and the arrows are turned off
    lvlMngr.apActive = false;

    waveTextTimer.Reset();      //Reset the timer for the text "wave n"
    spawnBssTimer.Reset();

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;      //Set the player position to the middle of the screen
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    lvlMngr.lvlNum = round(random(0, 9));
  }





  public void SpawnWave()
  {

    if (countBrt == 0)          //If the enemy spawn count has reached 0, stop spawning this enemy
      spawnBrtFinished = true;

    if (countGrnt == 0)
      spawnGrntFinished = true;

    if (countSpd == 0)
      spawnSpdFinished = true;

    if (countHvy == 0)
      spawnHvyFinished = true;

    if (countBss == 0)
      spawnBssFinished = true;


    SpawnSpeedster();          //Spawn all the enemies for this round
    SpawnGrunt();
    SpawnBrute();
    SpawnHeavy();
    SpawnBoss();


    if (spawnBrtFinished && spawnGrntFinished && spawnSpdFinished && spawnHvyFinished && spawnBssFinished && totalEnemyCount <= 0)      //If all the enemies are done spawning and there's nothing left on screen, end the wave
    {
      waveFinished = true;
      waveInProgress = false;
    }
  }





  public void SpawnGrunt()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnGrntTimer.TimerDone() && !spawnGrntFinished)
      {
        Add(new Grunt());
        spawnGrntTimer.Reset();
        countGrnt--;
      }
    }
  }



  public void SpawnBrute()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnBrtTimer.TimerDone()&& waveInProgress && !spawnBrtFinished)
      {
        Add(new Brute());
        spawnBrtTimer.Reset();
        countBrt--;
      }
    }
  }



  public void SpawnSpeedster()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnSpdTimer.TimerDone() && !spawnSpdFinished)
      {
        Add(new Speedster());
        spawnSpdTimer.Reset();
        countSpd--;
      }
    }
  }



  public void SpawnHeavy()
  {
    if (!waveFinished  && waveInProgress)
    {
      if (spawnHvyTimer.TimerDone() && !spawnHvyFinished)
      {
        Add(new Heavy());
        spawnHvyTimer.Reset();
        countHvy--;
      }
    }
  }



  public void SpawnBoss()
  {
    if (!waveFinished && waveInProgress)
    {
      if (wave % 5 == 0) {
        if (spawnBssTimer.TimerDone() && !spawnBssFinished)
        {
          Add(new Boss1());
          spawnBssTimer.Reset();
          countBss--;
          ohhimark.setGain(60);
          ohhimark.play();
        }
      } else spawnBssFinished = true;
    }
  }
}
class SpriteSheet
{
  PImage srcImage, drwImage;
  int fps = 5;
  int frame = 0;
  int frameWidth, frameHeight;
  int nFrames = 0;

  SpriteSheet(String imageName, int nFrames)
  {
    srcImage = loadImage(imageName);
    this.nFrames = nFrames;
    frameWidth = srcImage.width/nFrames;
    frameHeight = srcImage.height;
    drwImage = createImage(frameWidth, srcImage.height, ARGB);
  }

  public void update()
  {
    if ((frameCount % fps) == 0)
      frame = (frame + 1) % nFrames;

    drwImage.copy(srcImage, frame*frameWidth, 0, frameWidth, srcImage.height, 0, 0, frameWidth, srcImage.height);
  }

  public void draw(float x, float y)
  {
    image(drwImage, x, y);
  }
}
class Timer
{

  float startMillis, milliSeconds;




  Timer(float secondsInit)
  {
    milliSeconds = secondsInit * 1000;
    startMillis = millis();
  }



  public boolean TimerDone()
  {
    if (millis() - milliSeconds > startMillis)
    {
      return true;
    } else return false;
  }



  public void Reset()
  {
    startMillis = millis();
  }
}
class Turret extends GameObject
{

  PVector bbL = new PVector(), bbR = new PVector(), bbT = new PVector(), bbB = new PVector();
  float bbSW, bbSH, bbCW, bbCH;

  String turretType;

  Timer fireTimer = new Timer(10);

  Turret (String type)
  {
    tag = "structure";

    turretType = type;

    objWidth = 87;
    objHeight = 154;

    fireTimer.Reset();
  }


  public void setup()
  {
  }


  public void draw(float objPosX, float objPosY)
  {


    objPosX += objWidth + 13;

    if (turretType == "regular")
    {


      turret.draw(objPosX, objPosY);
      turret.update();

      if (spawn.waveInProgress && fireTimer.TimerDone())
      {
        Add( new EnemyProjectile(objPosX+ objWidth/2, objPosY + objHeight/2, "static"));
        fireTimer.Reset();
      }
    } else
      if (turretType == "homing")
      {
        if (spawn.waveInProgress && fireTimer.TimerDone())
        {
          Add(new EnemyProjectile(objPosX+ objWidth/2, objPosY + objHeight/2, "homing"));
          fireTimer.Reset();
        }
      }

    bbSW = 10;
    bbSH = objHeight/3 - 10;

    bbCW = objWidth - 10;
    bbCH = bbSW;

    //Collision Box Initialization
    //LEFT
    bbL.x = objPosX;
    bbL.y = objPosY + (objHeight/3 * 2) + 5;

    //RIGHT
    bbR.x = objPosX + objWidth - bbSW;
    bbR.y = bbL.y;

    //TOP
    bbT.x = objPosX + 5;
    bbT.y = bbL.y - 5;

    //BOTTOM
    bbB.x = bbT.x;
    bbB.y = objPosY + objHeight - bbCH + 5;



    //Collison Box Wireframes for checks
    //pushStyle();
    //noFill();
    //stroke(255);
    //rect(bbL.x, bbL.y, bbSW, bbSH);
    //rect(bbR.x, bbR.y, bbSW, bbSH);
    //rect(bbT.x, bbT.y, bbCW, bbCH);
    //rect(bbB.x, bbB.y, bbCW, bbCH);
    //popStyle();



    //Collision statement Player & Enemy

    if ((myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX) > bbL.x && myPlayer.objPosX + myPlayer.moveVelX < bbL.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbL.y && myPlayer.objPosY + myPlayer.moveVelY < bbL.y + bbSH)
    {
      myPlayer.collRight = true;

      //for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
      //{
      //  if (GameObjectRef.gameObject.get(i).tag == "enemy")
      //    GameObjectRef.gameObject.get(i).collRight = true;

      //  if (GameObjectRef.gameObject.get(i).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(i));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbR.x && myPlayer.objPosX + myPlayer.moveVelX < bbR.x + bbSW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbR.y && myPlayer.objPosY + myPlayer.moveVelY < bbR.y + bbSH)
    {
      myPlayer.collLeft = true;

      //for (int j = 0; j < GameObjectRef.gameObject.size(); j ++)
      //{
      //  if (GameObjectRef.gameObject.get(j).tag == "enemy")
      //    GameObjectRef.gameObject.get(j).collLeft = true;

      //  if (GameObjectRef.gameObject.get(j).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(j));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbB.x && myPlayer.objPosX + myPlayer.moveVelX < bbB.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbB.y && myPlayer.objPosY + myPlayer.moveVelY < bbB.y + bbCH)
    {
      myPlayer.collTop = true;

      //for (int k = 0; k < GameObjectRef.gameObject.size(); k ++)
      //{
      //  if (GameObjectRef.gameObject.get(k).tag == "enemy")
      //    GameObjectRef.gameObject.get(k).collTop = true;

      //  if (GameObjectRef.gameObject.get(k).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(k));
      //}
    }



    if (myPlayer.objPosX + myPlayer.objWidth + myPlayer.moveVelX > bbT.x && myPlayer.objPosX + myPlayer.moveVelX < bbT.x + bbCW && myPlayer.objPosY + myPlayer.objHeight + myPlayer.moveVelY > bbT.y && myPlayer.objPosY + myPlayer.moveVelY < bbT.y + bbCH)
    {
      myPlayer.collBott = true;

      //for (int l = 0; l < GameObjectRef.gameObject.size(); l ++)
      //{
      //  if (GameObjectRef.gameObject.get(l).tag == "enemy")
      //    GameObjectRef.gameObject.get(l).collBott = true;

      //  if (GameObjectRef.gameObject.get(l).tag == "bullet")
      //    Remove(GameObjectRef.gameObject.get(l));
      //}
    }
    
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {
      //Pillar Collision v Enemy
      if (GameObjectRef.gameObject.get(i).tag == "enemy")
      {
        if ((GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx) > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbL.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbL.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbL.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collRight = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbR.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbR.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbR.y + bbSH)
        {
          GameObjectRef.gameObject.get(i).collLeft = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbB.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbB.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbB.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbB.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collTop = true;
        }



        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).dx > bbT.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).dx < bbT.x + bbCW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).dy > bbT.y && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).dy < bbT.y + bbCH)
        {
          GameObjectRef.gameObject.get(i).collBott = true;
        }
      }


      //Pillar Collision v Bullet
      if (GameObjectRef.gameObject.get(i).tag == "bullet")
      {
        if (GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).objWidth + GameObjectRef.gameObject.get(i).moveVelX > bbL.x && GameObjectRef.gameObject.get(i).objPosX + GameObjectRef.gameObject.get(i).moveVelX < bbR.x + bbSW && GameObjectRef.gameObject.get(i).objPosY + GameObjectRef.gameObject.get(i).objHeight + GameObjectRef.gameObject.get(i).moveVelY > bbT.y && GameObjectRef.gameObject.get(i).objPosY + myPlayer.moveVelY < bbB.y + bbCH)
        {
          Remove(GameObjectRef.gameObject.get(i));
          ascore.ComboReset();
        }
      }
    }
  }
}
// TE4M
// Quinn Koene

class UI {
  int state = 2;
  //boolean controls;
  Timer hitStun = new Timer(0.1f);
  boolean ableToBeHit = true;
  // Healthbar
  int levens = 3; // Amount of lives
  int shield = 0; // amount of shield
  int lX1 = width/35;
  int lX2 = lX1 + 6;
  int lY1 = height/35;
  int lY2 = lY1 + 10;
  int hitValue;
  int hitValueLeftOvers;

  // ammo machinegun
  int ammoM1 = 5; // Original 5
  int magM1; // Original 30
  int maxM1 = 30; // Original 300
  int capacityM1; //Max capacity
  int clipM1; // Original 6
  int reloadM1 = 240;

  // ammo shotgun
  int ammoS1 = 5; // Origineel 5
  int maxS1 = 5; // Origineel 20
  int capacityS1; //Max capacity
  int reloadS1 = 240;

  // Ammo Pistol
  int ammoP = 5;
  int ammoX = width/30;
  int ammoY = height/12;
  int ammoXs = 6;
  int ammoYs = 15;
  int reloadP = 120;

  int gun = 1;

  UI() {
    hitValue = 0;
  }

  public void spelerhit() { // If called, lives -1
    if (ableToBeHit && hitStun.TimerDone()) {

      if (shield == 0)
      {
        levens -= hitValue;
      } else
        if (shield > 0)
        {
          if (hitValue - shield > 0)
          {
            hitValueLeftOvers = hitValue - shield;
            shield -= hitValue;
            levens -= hitValueLeftOvers;
          } else
            shield -= hitValue;
        }

      hitValue = 0;

      gamemngr.shakeAmount = 15;
      gamemngr.shake = true;
      damage.setGain(10);
      damage.play();
      damage.rewind();
      ableToBeHit = false;
      hitStun.Reset();
    }

    //if (!ableToBeHit && hitStun.TimerDone()) {
    //  ableToBeHit = true;
    //  println("TIMER IS DONE AND BEING RESET!");
    //  hitStun.Reset();
    //}
  }

  public void draw() {



    if (game) {

      // the shield won't get above 2
      if (UI.shield >= 2) {
        UI.shield = 2;
      }
      // the shield won't get below 0
      if (UI.shield < 0) {
        UI.shield = 0;
      }

      // the 'levens' won't get above 5
      if (UI.levens >= 5) {
        UI.levens = 5;
      }


      if (!ableToBeHit && hitStun.TimerDone())
      {
        ableToBeHit = true;
      }


      // Pistol ammo cooldown
      if (myPlayer.currentGun == myPlayer.pistoll) {
        if (ammoP == 0) {
          reloadP--;
          if (reloadP <= 0) {
            ammoP = 5;
            reloadP = 120;
          }
        }
      }
      // Pistol ammo (draw the five yellow lines left top)
      if (ammoP > 0 && myPlayer.currentGun == myPlayer.pistoll) {
        if ( myPlayer.pistol.upgradeLevel == 2) {
          image(rayGunP_B_up, ammoX, ammoY);
        } else if ( myPlayer.pistol.upgradeLevel == 3) {
          image(peanut, ammoX, ammoY);
        } else {
          image(bullet, ammoX, ammoY);
        }
        if (ammoP > 1 && myPlayer.currentGun == myPlayer.pistoll) {
          if ( myPlayer.pistol.upgradeLevel == 2) {
            image(rayGunP_B_up, ammoX + ammoXs, ammoY);
          } else if ( myPlayer.pistol.upgradeLevel == 3) {
            image(peanut, ammoX + ammoXs, ammoY);
          } else {
            image(bullet, ammoX + ammoXs, ammoY);
          }
          if (ammoP > 2 && myPlayer.currentGun == myPlayer.pistoll) {
            if ( myPlayer.pistol.upgradeLevel == 2) {
              image(rayGunP_B_up, ammoX + (ammoXs * 2), ammoY);
            } else if ( myPlayer.pistol.upgradeLevel == 3) {
              image(peanut, ammoX + (ammoXs * 2), ammoY);
            } else {
              image(bullet, ammoX + (ammoXs * 2), ammoY);
            }
          }
          if (ammoP > 3 && myPlayer.currentGun == myPlayer.pistoll) {
            if ( myPlayer.pistol.upgradeLevel == 2) {
              image(rayGunP_B_up, ammoX + (ammoXs * 3), ammoY);
            } else if ( myPlayer.pistol.upgradeLevel == 3) {
              image(peanut, ammoX + (ammoXs * 3), ammoY);
            } else {
              image(bullet, ammoX + (ammoXs * 3), ammoY);
            }
          }
          if (ammoP > 4 && myPlayer.currentGun == myPlayer.pistoll) {
            if ( myPlayer.pistol.upgradeLevel == 2) {
              image(rayGunP_B_up, ammoX + (ammoXs * 4), ammoY);
            } else if ( myPlayer.pistol.upgradeLevel == 3) {
              image(peanut, ammoX + (ammoXs * 4), ammoY);
            } else {
              image(bullet, ammoX + (ammoXs * 4), ammoY);
            }
          }
        }
      }

      // MachineGun Reload ammo
      if (maxM1 == -30) {
        maxM1 = 0;
      }
      if (ammoM1 <= 0 && magM1 > 0) {
        magM1 -= 5;
        ammoM1 = 5;
        clipM1--;
      }

      if (maxM1 >= capacityM1)
        maxM1 = capacityM1;
      if (maxS1 >= capacityS1)
        maxS1 = capacityS1;

      if (myPlayer.currentGun == myPlayer.machinegun) {
        if (magM1 == 0 && maxM1 > 0) {
          reloadM1--;
          if (reloadM1 <= 0) {
            magM1 = 30;
            maxM1 -= 30;
            clipM1 = 6;
            AR1Reload.rewind();
            reloadM1 = 240;
          }
        }
      }

      if (myPlayer.currentGun == myPlayer.machinegun) {
        textSize(20);
        text(""+ maxM1, ammoX, ammoY *2.2f);
      }
      // MachineGun ammo (draw the six yellow lines left top)
      if (clipM1 > 0 && myPlayer.currentGun == myPlayer.machinegun) { 
        image(bullet, ammoX, ammoY + (ammoY /2));
        if (clipM1 > 1 && myPlayer.currentGun == myPlayer.machinegun) {
          image(bullet, ammoX + ammoXs, ammoY + (ammoY /2));
          if (clipM1 > 2 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 2), ammoY + (ammoY /2));
          }
          if (clipM1 > 3 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 3), ammoY + (ammoY /2));
          }
          if (clipM1 > 4 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 4), ammoY + (ammoY /2));
          }
          if (clipM1 > 5 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 5), ammoY + (ammoY /2));
          }
        }
      }

      // MachineGun ammo (draw the five yellow lines under the other ones)
      if (ammoM1 > 0 && myPlayer.currentGun == myPlayer.machinegun) { 
        image(bullet, ammoX, ammoY);
        if (ammoM1 > 1 && myPlayer.currentGun == myPlayer.machinegun) {
          image(bullet, ammoX + ammoXs, ammoY);
          if (ammoM1 > 2 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 2), ammoY);
          }
          if (ammoM1 > 3 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 3), ammoY);
          }
          if (ammoM1 > 4 && myPlayer.currentGun == myPlayer.machinegun) {
            image(bullet, ammoX + (ammoXs * 4), ammoY);
          }
        }
      }

      // Shotgun ammo cooldown
      if (myPlayer.currentGun == myPlayer.shotgun) {
        if (ammoS1 == 0 && maxS1 > 0) {
          reloadS1--;
          if (reloadS1 <= 0) {
            ammoS1 = 5;
            maxS1 -= 5;
            reloadS1 = 240;
          }
        }
      }
      if (myPlayer.currentGun == myPlayer.shotgun) {
        textSize(20);
        text(""+ maxS1, ammoX, ammoY+40);
      }
      // Shotgun ammo (draw the five yellow lines left top)
      if (ammoS1 > 0 && myPlayer.currentGun == myPlayer.shotgun) {
        image(shotgunS, ammoX, ammoY);
        if (ammoS1 > 1 && myPlayer.currentGun == myPlayer.shotgun) {
          image(shotgunS, ammoX + ammoXs, ammoY);
          if (ammoS1 > 2 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 2), ammoY);
          }
          if (ammoS1 > 3 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 3), ammoY);
          }
          if (ammoS1 > 4 && myPlayer.currentGun == myPlayer.shotgun) {
            image(shotgunS, ammoX + (ammoXs * 4), ammoY);
          }
        }
      }

      // Health
      image(healthbarSb, lX1, lY1);
      image(shieldbarSb, lX1+ (57 * 5), lY1);

      if (levens == 1 && shield == 0) {
        image(healthP, lX2, lY2);
      }
      if (levens == 1 && shield == 1 ) {
        image(healthP, lX2, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }  
      if (levens == 1 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }
      if (levens == 2 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
      }
      if (levens == 2 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 2 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }   
      if (levens == 3 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
      }
      if (levens == 3 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 3 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }   
      if (levens == 4 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
      }
      if (levens == 4 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens == 4 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }  
      if (levens >= 5 && shield == 0) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);
      }
      if (levens >= 5 && shield == 1) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
      }
      if (levens >= 5 && shield >= 2) {
        image(healthP, lX2, lY2);
        image(healthP, lX2 + 57, lY2);
        image(healthP, lX2 + (57*2), lY2);
        image(healthP, lX2 + (57*3), lY2);
        image(healthP, lX2 + (57*4), lY2);        
        image(shieldP, lX2 + (57 * 5), lY2);
        image(shieldP, lX2 + (57 * 6), lY2);
      }

      image(healthbarS, lX1, lY1);
      image(shieldbarS, lX1 + (57 * 5), lY1);

      if (levens == 0) { // if lives == 0
        gamemngr.dead = true; // set player to dead
      }
    }


    // Main menu
    // show depending on boolean
    if (gamemngr.home) {
      tutorial();
      pushStyle();
      main.resize(width, height);
      seasonpass.resize(width, height);
      // show line under buttons depending what state is
      image(main, 0, 0);
      textSize(31);
      text("CONTROLS", 563, 150);
      if (state == 1) {
        fill(200);
        rect(134, 477, 285, 5);
      }
      if (state == 2) {
        fill(200);
        rect(480, 482, 319, 5);
        // rect(640, 486, 300, 5); // IF RECTMODE(CENTER)
      }
      if (state == 3) {
        fill(200);
        rect(860, 477, 285, 5);
        // rect(1002, 480, 280, 5); // IF RECTMODE(CENTER)
      }
      if (state == 4) {
        fill(200);
        rect(563, 522, 153, 5);
        // rect(640, 525, 145, 5); // IF RECTMODE(CENTER)
      }
      if (state == 5) {
        fill(200);
        rect(563, 150, 153, 5);
        // rect(640, 525, 145, 5); // IF RECTMODE(CENTER)
      }
      image(seasonpass, 0, 0);
      popStyle();
    }


    chieves.draw();
    if (gamemngr.controls) {
      controlImg.resize(width, height);
      image(controlImg, 0, 0);

      if (keyCode == DOWN) {
        gamemngr.controls = false;
        gamemngr.home = true;
      }
    }
  }

  public void tutorial() {
    if (gamemngr.controls) {
      if (keyCode == ENTER) {
        gamemngr.controls = false;
      }
    }
  }

  public void keyPressed() {
    if (gamemngr.home) {
      if (keyCode == DOWN)
      {
        homeSnd.pause();
        homeSnd.rewind();

        if (!loginMusic.isPlaying())
        {
          loginMusic.play();
          loginMusic.rewind();
        }

        gamemngr.home = false;
        gamemngr.hscore = false;
        gamemngr.login = true;
      }
      if (key == 'd' && state < 3) {
        state++;
      }
      if (key == 'a' && state > 1) {
        state--;
      }
      if (key == 's' && state <= 3) {
        state = 4;
      }
      if (key == 'w' && state == 4) {
        state = 2;
      }
      //stat 5 for tutorial
      if (key == 'w' && state <= 3) {
        state = 5;
      }
      if (key == 's' && state == 5) {
        state = 2;
      }
      if (key == 'w' && state == 4) {
        state = 2;
      }

      if (keyCode == RIGHT) {
        if (state == 1) { // Stats button
          gamemngr.shake = true;
          gamemngr.shakeAmount = 4;
          //gamemngr.statspage = true;
        }
        if (state == 4) { // Credits button
          gamemngr.creditspage = true;
        }
        // if state == 2 (Play button) then start game
        if (state == 2) {
          gamemngr.home = false;
          game = true;
        }
        // if state == 3 (Highscore button) then go to highscore page
        if (state == 3) {
          gamemngr.home = false;
          gamemngr.hscore = true;
        }
        // Tutorial button
        if (state == 5) { 
          gamemngr.controls = true;
          gamemngr.home = false;
        }
      }
    }
  }
}
class UltimateMachineGun extends GameObject {

  Timer cooldownTimer = new Timer(0.05f);

  UltimateMachineGun() {

    knockback = 3;    //knockback is 3 pixels back when you shoot every time.
  }

  public void shoot() {
    // if you are shooting up, the bullets will go up.
    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {
      Add(new Bullet(random(-0.25f, 0.25f), -20));


      //the knockback is down.
      myPlayer.objPosY += knockback;

      //if you are shooting down, the bullets will go down.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {
      Add(new Bullet(random(-0.25f, 0.25f), 20));

      //the knockback is up.
      myPlayer.objPosY -= knockback;

      //if you are shooting to the right, the bullets will go right.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {
      Add(new Bullet(20, (random(-0.25f, 0.25f))));

      //the knockback is to the left.
      myPlayer.objPosX -= knockback;

      //if you are shooting to the let, the bullets will go left.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {
      Add(new Bullet(-20, random(-0.25f, 0.25f)));

      //the knockback is to the right.
      myPlayer.objPosX += knockback;
    }

    cooldownTimer.Reset();
  }
}
class User {
  int currentUser;
  String idUser;
  String TID;
  int newID;

  public void setup() {
  }

  public void idCheck() {
    msql.query ( "SELECT idUser FROM User WHERE nameUser = '%s'", ascore.name); // Select ID for user
    while (msql.next() ) { // if ^ queries
      idUser = msql.getString("idUser"); // Attach idUser to string
    }
    if (idUser == null) {
      msql.query( "SELECT idUser FROM User ORDER BY idUser DESC LIMIT 1" ); // select highest ID
      while (msql.next() ) {
        TID = msql.getString("idUser"); // Set temporary ID
        newID = parseInt(TID) + 1; // Make new ID
      }
      if (newID == 0) { // If VERY first user, make it start at 1, prevents it from being 0
        newID = 1; // New ID is 1 if there are no id's
        currentUser = 1; // current User has id 1
      }
      if (currentUser != newID) { // If Account created, currentID is newID
        currentUser = newID; // currentUser is newID
      }
      msql.query( "INSERT INTO User (idUser, nameUser) VALUES ('%s','%s')", newID, ascore.name ); // Insert new ID for user
    }
    if (idUser != null) { // If there is a user with the same name, currentUser is ID belonging to name
      if (currentUser != parseInt(idUser) ) {  // if currentUser is not idUser then do this
        currentUser = parseInt(idUser); // Make currentUser into idUser
      }
    }
  }
}
// TE4M
// Quinn Koene

class aScore {
  int randomSoundTrack; //choosing a random sound to play with switch statement
  int totalSoundTracks; //number of sounds you want to use for the random
  int score; // The current score
  float combo; // The current combo or score multiplier
  String oScore; // "Old Score" score already in scorelist belonging to player
  String name; // String containing inserted name from 'Login' class
  boolean chieveUnlocked;

  aScore() {
    combo = 1;
    totalSoundTracks = 2;
  }

  public void draw() {

    if (score >= 100000 && !chieveUnlocked)
    {
      chieves.UnlockAchievement(1);
      chieveUnlocked = true;
    } 

    float tCombo = combo - combo%0.01f; // This is the number visible on the display
    if (!gamemngr.dead) { 
      pushStyle();
      fill(255);
      textSize(20);
      text("Score: "+score, width/9 - 10, height/10); // Total score of the player op to that point at the top left
      text("x" + tCombo, myPlayer.objPosX - myPlayer.objWidth/2 + 5, myPlayer.objPosY); // Indicator of the score multiplier above the player
      popStyle();
    }
  }



  public void saveScore() {
    //println("Levens" + UI.levens);
    if (msql.connect() && UI.levens <= 0) {
      msql.query( "SELECT idScores, valueScores FROM Scores WHERE idScores = '%s' AND nameScores = '%s'", User.currentUser, ascore.name ); // Grab the score from the player
      while ( msql.next() ) {
        oScore = msql.getString("valueScores"); // temporary score (score belonging to player)
        //println("Select Score: " + oScore);
      }
      //println("ID: " + User.currentUser);
      if (oScore == null && User.currentUser != 0) { // if score doesn't exist make one
        msql.query( "INSERT INTO Scores (idScores, nameScores, valueScores) VALUES ('%s','%s','%s')", User.currentUser, ascore.name, score );
        //println("INSERT!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      if (oScore != null && score > parseInt(oScore)) { // If score is bigger than the lowest score and idh is 20 then
        msql.query( "UPDATE Scores SET valueScores = '%s' WHERE idScores = '%s' AND nameScores = '%s'", score, User.currentUser, ascore.name ); // Update score
        //println("UPDATE!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      // UI.levens = -1; // set 'levens' to -1 (so it doesn't repeat)
    } else {
      //println("Old Score: " + oScore);
      //println("New Score: " + score);
    }
  }


  public void ComboReset()
  {
    randomSoundTrack = round(random(0, totalSoundTracks)); // picks 0, 1 or 2

    //takes the random pick and plays the corresponding sound
    switch(randomSoundTrack) {
    case 0:
      bruh.setGain(30);
      bruh.play();
      bruh.rewind();
      missing1.pause();
      missing2.pause();
      break;
    case 1:
      missing1.setGain(60);
      missing1.play();
      missing1.rewind();
      missing2.pause();
      bruh.pause();
      break;
    case 2:
      missing2.setGain(60);
      missing2.play();
      missing2.rewind();
      missing1.pause();
      bruh.pause();
      break;
    }
    combo = 1;
  }
}
class friends {

  String pName; // Player Name
  String fName; // Friends Name
  int pID; //Player ID

  public void setup() {
  }
  friends() {
  }

  public void getID() { // Function to get id from the selected player (stats menu)
    msql.query( "SELECT idUser FROM User WHERE nameUser = '%s'", pName); // query to select id where nameUser is the same as the name in pName
    while (msql.next() ) { // Continue
      pID = parseInt(msql.getString("idUser")); // Id of user pName(nameUser) is set into pID and put as an int
    }
    if (pID == 0) { // if pID is empty
      println("Couldn't find ID for " + pName);
    }
  }

  public void addFriend() { // Function to add a friend when selected is not in Friendslist (stats menu)
    getID(); // run function getID to receive an ID
    if (pID > 0) { // if pID is higher than 0
      msql.query( "INSERT INTO Friends (idFriends, User_idUser) VALUES ('%s', '%s')", pID, User.currentUser); // Insert pID and User.currentUser(ID Of user playing) into database as 'Friends'
      println("Yeehaw " + ascore.name + " and " + pName + " are now friends!");
      totalFriends();
    }
  }

  public void removeFriend() { // Function to remove a friend when selected is not in Playerlist (stats menu)
    getID(); // run function getID to receive an ID
    msql.query( "DELETE FROM Friends WHERE User_idUser = '%s' AND idFriends = '%s'", User.currentUser, pID); // Remove the record where User_idUser is User.currentUser(ID of user playing) and idFriends is pID(ID of selected friend)
    println("How sad! " + ascore.name + " deleted " + pName + " as a friend");
    totalFriends(); // Run function total friends to update the friendlist in stats menu
  }

  public void totalPlayers() { // Function to grab all users that are not friends of current playing player
    msql.query( "SELECT COUNT(DISTINCT u.idUser) FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name );
    // Select a not already selected u.idUser(ID of player that is NOT a friend of current playing player) from the database where u.idUser is not the same as f.idFriends if f.User_idUser(ID of the current playing player) is the same id
    while (msql.next() ) { // Continue to the next line
      String tPlayers; // String to count TotalPlayers
      tPlayers = msql.getString("COUNT(DISTINCT u.idUser)"); // Attach COUNT(DISTINCT u.idUser) (total of users not friends with current player) to the String tPlayers
      stats.totalPlayers = parseInt(tPlayers); // set stats.totalPlayers as the number version of the tPlayers String
      println("Total Players: " + stats.totalPlayers);
      if (stats.totalPlayers >= 0) { // if stats.totalPlayers is higher or same as 0 (to stop it from selecting if there are no users)
        msql.query("SELECT DISTINCT u.nameUser FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name);
        //  Select a not already selected u.nameUser(Name of an user that is NOT a friend of current playing player) from database where u.idUser is not the same as f.idFriends if f.user_idUser(ID of the current playing player) is the same id
        while (msql.next() ) { // Continue to the next line
          pName = msql.getString("nameUser"); // Attach nameUser(Name of an user that is not a friend of current playing player) to string pName(playerName)
          println("NAME: " + pName);
          stats.players = append(stats.players, pName); // Add pName to array stats.players
          //stats.aPlayers++; // Increase the array size of stats.players
        }
      } else {
        println("Couldn't find any users");
      }
    }
  }

  public void totalFriends() { // Function to grab all friends of current playing player
    msql.query( "SELECT COUNT(User_idUser) FROM Friends WHERE User_idUser = '%s'", User.currentUser ); // Count all the friends the current playing player has by checking if id is in Friends
    while (msql.next() ) { // Continue to the next line
      String tFriends; // String to count total friends
      tFriends = msql.getString("COUNT(User_idUser)"); // Attach COUNT(User_idUser) (the amount of friends the current playing player has) to the String tFriends
      stats.totalFriends = parseInt(tFriends); // Change the tFriends string into a number

      if (stats.totalFriends != 0) { // to make sure it does not select when user has no friends
        msql.query( "SELECT u.nameUser FROM User u INNER JOIN Friends f ON u.idUser = f.idFriends WHERE f.User_idUser = '%s'", User.currentUser );
        // Select u.nameUser(Name of friend of current playing player) from database table User and Friends where u.idUser(id of player(ANY) ) is equal to f.idFriends(id of friend current playing player)
        while (msql.next() ) { // Continue to next line
          fName = msql.getString("nameUser"); // Attach nameUser(Name of friend of current playing player) to string fName(friendName)
          stats.friends = append(stats.friends, fName); // Add fName to array stats.friends
          //stats.aFriends++; // Increase the array size of stats.friends
        }
      } else {
        println("Couldn't find any friends");
      }
    }
    //msql.query( "SELECT idUser FROM User WHERE nameUser = '%s'", pName); // query to select id where nameUser is the same as the name in pName
    //while (msql.next() ) { // Continue
    //  pID = parseInt(msql.getString("idUser")); // Id of user pName(nameUser) is set into pID and put as an int
    //}
    //if (pID == 0) { // if pID is empty
    //  println("Couldn't find ID for " + pName);
    //}
  }

  //void addFriend() { // Function to add a friend when selected is not in Friendslist (stats menu)
  //getID(); // run function getID to receive an ID
  //if (pID > 0) { // if pID is higher than 0
  //  msql.query( "INSERT INTO Friends (idFriends, User_idUser) VALUES ('%s', '%s')", pID, User.currentUser); // Insert pID and User.currentUser(ID Of user playing) into database as 'Friends'
  //  println("Yeehaw " + ascore.name + " and " + pName + " are now friends!");
  //  totalFriends();
  //}
}

//void removeFriend() { // Function to remove a friend when selected is not in Playerlist (stats menu)
//getID(); // run function getID to receive an ID
//msql.query( "DELETE FROM Friends WHERE User_idUser = '%s' AND idFriends = '%s'", User.currentUser, pID); // Remove the record where User_idUser is User.currentUser(ID of user playing) and idFriends is pID(ID of selected friend)
//println("How sad! " + ascore.name + " deleted " + pName + " as a friend");
//totalFriends(); // Run function total friends to update the friendlist in stats menu


//void totalPlayers() { // Function to grab all users that are not friends of current playing player
//msql.query( "SELECT COUNT(DISTINCT u.idUser) FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name );
//// Select a not already selected u.idUser(ID of player that is NOT a friend of current playing player) from the database where u.idUser is not the same as f.idFriends if f.User_idUser(ID of the current playing player) is the same id
//while (msql.next() ) { // Continue to the next line
//  String tPlayers; // String to count TotalPlayers
//  tPlayers = msql.getString("COUNT(DISTINCT u.idUser)"); // Attach COUNT(DISTINCT u.idUser) (total of users not friends with current player) to the String tPlayers
//  stats.totalPlayers = parseInt(tPlayers); // set stats.totalPlayers as the number version of the tPlayers String
//  println("Total Players: " + stats.totalPlayers);
//  if (stats.totalPlayers >= 0) { // if stats.totalPlayers is higher or same as 0 (to stop it from selecting if there are no users)
//    msql.query("SELECT DISTINCT u.nameUser FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name);
//    //  Select a not already selected u.nameUser(Name of an user that is NOT a friend of current playing player) from database where u.idUser is not the same as f.idFriends if f.user_idUser(ID of the current playing player) is the same id
//    while (msql.next() ) { // Continue to the next line
//      pName = msql.getString("nameUser"); // Attach nameUser(Name of an user that is not a friend of current playing player) to string pName(playerName)
//      println("NAME: " + pName);
//      stats.players = append(stats.players, pName); // Add pName to array stats.players
//      stats.aPlayers++; // Increase the array size of stats.players
//    }
//  } else {
//    println("Couldn't find any users");
//  }
//}


//void totalFriends() { // Function to grab all friends of current playing player
//msql.query( "SELECT COUNT(User_idUser) FROM Friends WHERE User_idUser = '%s'", User.currentUser ); // Count all the friends the current playing player has by checking if id is in Friends
//while (msql.next() ) { // Continue to the next line
//  String tFriends; // String to count total friends
//  tFriends = msql.getString("COUNT(User_idUser)"); // Attach COUNT(User_idUser) (the amount of friends the current playing player has) to the String tFriends
//  stats.totalFriends = parseInt(tFriends); // Change the tFriends string into a number

//  if (stats.totalFriends != 0) { // to make sure it does not select when user has no friends
//    msql.query( "SELECT u.nameUser FROM User u INNER JOIN Friends f ON u.idUser = f.idFriends WHERE f.User_idUser = '%s'", User.currentUser );
//    // Select u.nameUser(Name of friend of current playing player) from database table User and Friends where u.idUser(id of player(ANY) ) is equal to f.idFriends(id of friend current playing player)
//    while (msql.next() ) { // Continue to next line
//      fName = msql.getString("nameUser"); // Attach nameUser(Name of friend of current playing player) to string fName(friendName)
//      stats.friends = append(stats.friends, fName); // Add fName to array stats.friends
//      stats.aFriends++; // Increase the array size of stats.friends
//    }
//  } else {
//    println("Couldn't find any friends");
//  }
//}
// TE4M
// Quinn Koene

class hScorelijst {
  int hScoreH = height/3; // Hoogte van text
  int Asc = 0; // 'Array Score'
  int Ans = 0; // 'Array name & score'
  String[] scores = new String[Asc];
  String score;
  String name;
  String[] names = new String[Asc];

  hScorelijst() {

    if (msql.connect() && Ans < 10) { // Als geconnect is met database & Ans kleiner is dan 10
      msql.query( "SELECT nameScores , valueScores FROM Scores ORDER BY valueScores DESC LIMIT 10");
      while ( msql.next() && Ans < 10) {
        name = msql.getString("nameScores"); // string name is 'name' uit database
        names = append(names, name); // Voeg name toe aan de array names
        score = msql.getString("valueScores"); // string score is 'score' uit database
        scores = append(scores, score); // Voeg score toe aan de array scores
        Asc++;
        Ans++;
      }
    } else { 
      println("ERROR: Couldn't fetch scores, names & id");
    }
  }

  public void setup() {
  }

  public void draw() {
    if (gamemngr.hscore) {
      death.pause();
      death.rewind();
      scrBgr.resize(width, height);
      image(scrBgr, 0, 0);
      pushStyle();
      textAlign(CENTER);
      textSize(40);
      text("Press 'B' to go back", 630, 680);
      if (scores.length == 0) {
        text("Huh? It's empty!", width/2, hScoreH+100); 
        text("Play now and be the first!", width/4 + 80, hScoreH+160);
      }
      popStyle();
      textSize(40);
      for (int i = 0; i < Asc; i++) {
        if (names.length > 0 && scores.length > 0) {
          text(""+scores[i], width/3, hScoreH + 40*i);
          text(""+names[i], width/3+300, hScoreH + 40*i);
        }
      }
    }
  }
}
class stats { 
  int textX = 155;
  int totalFriends;
  int totalPlayers;
  int aPlayers;
  int aFriends;
  String selected;
  String[] players = new String[aPlayers];
  String[] friends = new String[aFriends];
  int cursorPosY = 0;
  int cursorPosY2 = -1;

  public void setup() {
  }

  public void draw() { 
    if (gamemngr.statspage) {
      pushStyle();
      statsBg.resize(width, height);
      image(statsBg, 0, 0);
      textSize(50);
      text("" + ascore.name, 300, textX);
      text("'S", 440, textX);
      text("STATS", 520, textX);
      text("FRIENDS", 810, textX);
      fill(28, 28, 28);
      rect(781, 192, 259, 30 + (totalFriends * 30));
      rect(781, 229 + (totalFriends * 30), 259, 397 - (totalFriends * 30));
      popStyle();
      if (totalFriends <= 0) {
        textSize(20);
        text("NO FRIENDS FOUND", 810, 215);
      } else {
        for (int i = 0; i < totalFriends; i++) {
          textSize(20);
          text("" + friends[i], 900, 220 + (totalFriends * 20 * i/2) );
          pushStyle();
          if (cursorPosY == i) {
            fill(100, 0, 0);
          }
          text("REMOVE", 810, 220 + (totalFriends * 20 * i/2) );
          popStyle();
        }
      }
      for (int i = 0; i < totalPlayers; i++) {
        textSize(20);
        text("" + players[i], 900, (260 + (totalFriends * 30)) + (30 * i));
        pushStyle();
        if (cursorPosY2 == i) {
          fill(0, 200, 0);
          selected = players[i];
        }
        text("ADD", 820, (260 + (totalFriends * 30)) + (30 * i) );
        popStyle();
      }
    }
  }
  public void keyReleased() {
    if (gamemngr.statspage) {
      if (keyCode == DOWN) {
        gamemngr.statspage = false;
        gamemngr.home = true;
      }
      if (keyCode == RIGHT) {
        //if () {
        //  selected = Friends.pName;
        //  Friends.getID();
        //  Friends.removeFriend();
        //}
        //if () {
        //  selected = Friends.pName;
        //  Friends.getID();
        //  Friends.addFriend();
        //}
      }
      if (key == 'w') {
        if (cursorPosY > 0 && cursorPosY < totalFriends-1) {
         cursorPosY--; 
        }
        
      }
      if (key == 's') {
        if (cursorPosY < totalFriends-1) { // if cursorPosY is tinier than totalFriends-1 (stops cursorPosY from moving beyond totalFriends)
          cursorPosY++; // add numbers to cursorPosY
        } else {
          cursorPosY = totalFriends; // Keeps cursorPosY at totalFriends
          cursorPosY2++; // CursorPosY2 goes down towards totalPlayers-1
        }
        if (cursorPosY2 > totalPlayers-1 ) { // if cursorPosY2 is tinier than totalPlayers-1 (stops cursorPosY from moving beyond totalFriends)
          cursorPosY2 = totalPlayers-1; // add number to cursorPosY2
        }
      }
    }
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FYS_105" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
