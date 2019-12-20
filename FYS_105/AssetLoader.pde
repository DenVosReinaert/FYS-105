import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;

AudioPlayer Shotgun, ShotgunReload, LMG, Pistol, homeSnd, death;

// Main menu
PImage main, pillar, background, scrBgr; //controlImg;

// UI
PImage healthbarS, healthbarSb, healthP, bullet, shotgunS;

// Guns 
PImage buckS, bulletDown, bulletLeft, bulletRight;
PImage handgunLeft, handgunRight, handgunUp, handgunDown;

// Player

// Effects
PImage bloodOrb;

// Maps && spritesheets
PImage gardenPathA, gardenPathB, gardenPathC, gardenPathD, gardenPathE, gardenPathF, gardenPathG, gardenPathH, gardenPathI, gardenPathJ, gardenPathK;
SpriteSheet gardenPathFlowerPatch, mrSpooksLeft, mrSpooksRight, mrSpooksUp, mrSpooksDown;
PImage purpleStoneTiles;


void LoadAssets()
{

  // UI
  healthbarS = loadImage("/data/sprites/UI/HealthBarSlots.png");
  healthbarSb = loadImage("/data/sprites/UI/HealthBarSlots_Backdrop.png");
  healthP = loadImage("/data/sprites/UI/PieceOfHealth.png");
  bullet = loadImage("/data/sprites/UI/BulletSprite.png");
  shotgunS = loadImage("/data/sprites/UI/ShotgunShell.png");

  // Guns
  buckS = loadImage("/data/sprites/buckshot.png");
  bulletDown = loadImage("/data/sprites/BulletSpriteDown.png");
  bulletLeft = loadImage("/data/sprites/BulletSpriteLeft.png");
  bulletRight = loadImage("/data/sprites/BulletSpriteRight.png");
  
  handgunUp = loadImage("/data/sprites/Handgun_Top.png");
  handgunDown = loadImage("/data/sprites/Handgun_Down.png");
  handgunLeft = loadImage("/data/sprites/Handgun_Left.png");
  handgunRight = loadImage("/data/sprites/Handgun_Right.png");
  
  // ?


  // Player


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




  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
  ShotgunReload = minim.loadFile("/data/sound/ShotgunReload.mp3");
  LMG = minim.loadFile("/data/sound/LMG.mp3");
  Pistol = minim.loadFile("/data/sound/Pistol.mp3");
  homeSnd = minim.loadFile("/data/sound/homeSnd.mp3");
  death = minim.loadFile("/data/sound/death.mp3");
}
