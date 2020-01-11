import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;



AudioPlayer loginMusic, Shotgun, ShotgunReload, pump_shotg, pump_shotg_empty, AR1, AR1Reload, AR1Empty, Pistol, pistolR, pistolEmpty, homeSnd, death, gameMusic, megalovania, damage, bruh, garfield, achievement, 
  buying1, buying2, buying3, buying4, buying5, buying6, buying7, cantbuy1, cantbuy2, missing1, missing2, ohhimark, uhoh, shieldup, speedup, ultimatemachinegun, contraJungleTheme,guilesTheme;



// Main menu
PImage main, login, pillar, background, scrBgr, codeInputBox; //controlImg;

// UI
PImage healthbarS, healthbarSb, healthP, bullet, shotgunS, shieldP, shieldbarS, shieldbarSb;

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
SpriteSheet gruntL, gruntR, gruntU, gruntD, speedsterL, speedsterR, speedsterU, speedsterD, bruteLU, bruteLD, bruteRD, bruteRU, heavyU, heavyD, heavyL, heavyR, boss1U, boss1D, boss1L, boss1R;
SpriteSheet arrowPL, arrowPU, arrowPR, arrowPD;
SpriteSheet shopcart, stationaryShopcart, cartdirt;
SpriteSheet shieldUp, healthUp, speedUp;



void movieEvent(Movie vid) {
  vid.read();
}



void LoadAssets()
{

  // UI
  healthbarS = loadImage("/data/sprites/UI/HealthBarSlots.png");
  healthbarSb = loadImage("/data/sprites/UI/HealthBarSlots_Backdrop.png");
  healthP = loadImage("/data/sprites/UI/PieceOfHealth.png");
  bullet = loadImage("/data/sprites/UI/BulletSprite.png");
  shotgunS = loadImage("/data/sprites/UI/ShotgunShell.png");

  shieldbarS = loadImage("/data/sprites/UI/ShieldBarSlots.png");
  shieldbarSb = loadImage("/data/sprites/UI/ShieldBarSlots_Backdrop.png");
  shieldP = loadImage("/data/sprites/UI/PieceOfShield.png");

  codeInputBox = loadImage("/data/sprites/CodeInputBox.png");

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
  // Login
  login = loadImage("/data/img/LastStand-Login.png");

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
  heavyL = new SpriteSheet("/data/sprites/Enemies/Heavy_Left.png", 33);
  heavyR = new SpriteSheet("/data/sprites/Enemies/Heavy_Right.png", 33);

  boss1U = new SpriteSheet("/data/sprites/Enemies/Boss1_Back.png", 9);
  boss1D = new SpriteSheet("/data/sprites/Enemies/Boss1_Front.png", 9);
  boss1L = new SpriteSheet("/data/sprites/Enemies/Boss1_SideL.png", 9);
  boss1R = new SpriteSheet("/data/sprites/Enemies/Boss1_SideR.png", 9);

  shopcart = new SpriteSheet("/data/sprites/shopcart.png", 6);
  stationaryShopcart = new SpriteSheet("/data/sprites/Stationary_Shopcart.png", 8);
  cartdirt = new SpriteSheet("/data/sprites/cartdirt.png", 6);

  //ArrowPointers
  arrowPU = new SpriteSheet("/data/sprites/ArrowPointer_Up.png", 6);
  arrowPD = new SpriteSheet("/data/sprites/ArrowPointer_Down.png", 6);
  arrowPL = new SpriteSheet("/data/sprites/ArrowPointer_Left.png", 6);
  arrowPR = new SpriteSheet("/data/sprites/ArrowPointer_Right.png", 6);


  //PowerUps
  shieldUp = new SpriteSheet("/data/sprites/LS_SHLD.png", 10);
  speedUp = new SpriteSheet("/data/sprites/LS_SPD.png", 20);
  healthUp = new SpriteSheet("/data/sprites/LS_HLTH.png", 10);

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
  megalovania = minim.loadFile("/data/sound/Megalovania.wav");
  contraJungleTheme = minim.loadFile("/data/sound/ContraJungleTheme.wav");
  guilesTheme = minim.loadFile("/data/sound/GuilesTheme.wav");
  loginMusic = minim.loadFile("/data/sound/login.mp3");


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
}
