import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;

AudioPlayer Shotgun, ShotgunReload, LMG, Pistol, homeSnd, death, gameMusic;

// Main menu
PImage main, pillar, background, scrBgr; //controlImg;

// UI
PImage healthbarS, healthbarSb, healthP, bullet, shotgunS;

// Guns 
PImage buckS, bulletDown, bulletLeft, bulletRight;
PImage handgunLeft, handgunRight, handgunUp, handgunDown, doubleBu, doubleBd, doubleBl, doubleBr, arL, arR, arU, arD, pumpL, pumpR, pumpU, pumpD;


// Effects
PImage bloodOrb;

// Maps && spritesheets
PImage gardenPathA, gardenPathB, gardenPathC, gardenPathD, gardenPathE, gardenPathF, gardenPathG, gardenPathH, gardenPathI, gardenPathJ, gardenPathK;

SpriteSheet gardenPathFlowerPatch, mrSpooksLeft, mrSpooksRight, mrSpooksUp, mrSpooksDown;

PImage purpleStoneTiles;

//Enemies
SpriteSheet gruntL, gruntR, gruntU, gruntD, speedsterL, speedsterR, speedsterU, speedsterD, bruteLU, bruteLD, bruteRD, bruteRU, heavyU, heavyD, boss1U, boss1D, boss1L, boss1R;
SpriteSheet arrowPL, arrowPU, arrowPR, arrowPD;
SpriteSheet shopcart, cartdirt;

void LoadAssets()
{

  // UI
  healthbarS = loadImage("/data/sprites/UI/HealthBarSlots.png");
  healthbarSb = loadImage("/data/sprites/UI/HealthBarSlots_Backdrop.png");
  healthP = loadImage("/data/sprites/UI/PieceOfHealth.png");
  bullet = loadImage("/data/sprites/UI/BulletSprite.png");
  shotgunS = loadImage("/data/sprites/UI/ShotgunShell.png");

  // Guns
  doubleBu = loadImage("/data/sprites/DoubleBarrel_Top.png");
  doubleBd = loadImage("/data/sprites/DoubleBarrel_Down.png");
  doubleBl = loadImage("/data/sprites/DoubleBarrel_Left.png");
  doubleBr = loadImage("/data/sprites/DoubleBarrel_Right.png");

  buckS = loadImage("/data/sprites/buckshot.png");
  bulletDown = loadImage("/data/sprites/BulletSpriteDown.png");
  bulletLeft = loadImage("/data/sprites/BulletSpriteLeft.png");
  bulletRight = loadImage("/data/sprites/BulletSpriteRight.png");

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
  //  controlImg = loadImage("/data/img/controls.png");
  main = loadImage("/data/img/LastStand-MainMenu.png");

  // Effects
  bloodOrb = loadImage("/data/sprites/BloodOrb.png");

  // Maps
  background = loadImage("/Graphics/background.png");
  pillar = loadImage("/Graphics/pillarSprite.png");

  gardenPathA = loadImage("/Graphics/GardenPath_1a.png");
  gardenPathB = loadImage("/Graphics/GardenPath_1b.png");
  gardenPathC = loadImage("/Graphics/GardenPath_1c.png");
  gardenPathD = loadImage("/Graphics/GardenPath_1d.png");
  gardenPathE = loadImage("/Graphics/GardenPath_1e.png");
  gardenPathF = loadImage("/Graphics/GardenPath_1f.png");
  gardenPathG = loadImage("/Graphics/GardenPath_1g.png");
  gardenPathH = loadImage("/Graphics/GardenPath_1h.png");
  gardenPathI = loadImage("/Graphics/GardenPath_1i.png");
  gardenPathJ = loadImage("/Graphics/GardenPath_1j.png");
  gardenPathK = loadImage("/Graphics/GardenPath_1k.png");


  gardenPathFlowerPatch = new SpriteSheet("/Graphics/GardenPath_FlowerPatch.png", 6);
  mrSpooksLeft = new SpriteSheet("/Graphics/MrSpooks_Sheet_Left.png", 5);
  mrSpooksRight = new SpriteSheet("/Graphics/MrSpooks_Sheet_Right.png", 5);
  mrSpooksUp = new SpriteSheet("/Graphics/MrSpooks_Sheet_Back.png", 5);
  mrSpooksDown = new SpriteSheet("/Graphics/MrSpooks_Sheet_Front.png", 5);

  purpleStoneTiles = loadImage("/Graphics/PurpleStoneTiles.png");

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

  boss1U = new SpriteSheet("/data/sprites/Enemies/Boss1_Back.png", 9);
  boss1D = new SpriteSheet("/data/sprites/Enemies/Boss1_Front.png", 9);
  boss1L = new SpriteSheet("/data/sprites/Enemies/Boss1_SideL.png", 9);
  boss1R = new SpriteSheet("/data/sprites/Enemies/Boss1_SideR.png", 9);

  shopcart = new SpriteSheet("/data/sprites/shopcart.png", 4);
  cartdirt = new SpriteSheet("/data/sprites/cartdirt.png", 4);


  //ArrowPointers
  arrowPU = new SpriteSheet("/data/sprites/ArrowPointer_Up.png", 6);
  arrowPD = new SpriteSheet("/data/sprites/ArrowPointer_Down.png", 6);
  arrowPL = new SpriteSheet("/data/sprites/ArrowPointer_Left.png", 6);
  arrowPR = new SpriteSheet("/data/sprites/ArrowPointer_Right.png", 6);

  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
  ShotgunReload = minim.loadFile("/data/sound/ShotgunReload.mp3");
  LMG = minim.loadFile("/data/sound/LMG.mp3");
  Pistol = minim.loadFile("/data/sound/Pistol.mp3");
  homeSnd = minim.loadFile("/data/sound/Last_Stand_MainMS.wav");
  death = minim.loadFile("/data/sound/death.mp3");
  gameMusic = minim.loadFile("/data/sound/looping_strings.wav");
}
