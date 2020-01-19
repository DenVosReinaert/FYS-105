import ddf.minim.*;
import processing.video.*;



Movie tutorial;
Minim minim;


// soundeffects
AudioPlayer Shotgun, ShotgunReload, pump_shotg, pump_shotg_empty, AR1, AR1Reload, AR1Empty, Pistol, pistolR, pistolEmpty, homeSnd, death, damage, bruh, garfield, achievement, e1m1, 
  buying1, buying2, buying3, buying4, buying5, buying6, buying7, cantbuy1, cantbuy2, missing1, missing2, ohhimark, uhoh, shieldup, speedup, ultimatemachinegun, garfieldSans;
// music
AudioPlayer loginMusic, gameMusic, megalovania, contraJungleTheme, guilesTheme, devilMayCry, fireEmblem, xenoblade;



// Main menu
PImage main, login, pillar, levelTemplate, scrBgr, pokemonMDB, statsBg, creditsBG; //controlImg;

// UI
PImage healthbarS, healthbarSb, healthP, bullet, shotgunS, shieldP, shieldbarS, shieldbarSb;

//Achievements
PImage[] chievePlate = new PImage[7];

// Guns 
PImage buckS, bulletDown, bulletLeft, bulletRight, bulletTurret;
PImage handgunLeft, handgunRight, handgunUp, handgunDown, doubleBu, doubleBd, doubleBl, doubleBr, arL, arR, arU, arD, pumpL, pumpR, pumpU, pumpD;
PImage LMG1_down, LMG1_up, LMG1_left, LMG1_right, LMG2_down, LMG2_up, LMG2_right, LMG2_left, rayGun_up, rayGun_down, rayGun_left, rayGun_right, rayGunP_up, rayGunP_down, rayGunP_left, rayGunP_right; 
PImage treeGun_up, treeGun_down, treeGun_left, treeGun_right, shotg_up, shotg_right, shotg_left, shotg_down; 

// Shop
PImage arLoad, arLoad2, arFullLoad, shotg_load, shotg_load2, shotg_fullLoad;


// Effects
PImage bloodOrb;
PImage bossBlood;
PImage gruntBlood;
PImage heavyBlood;

SpriteSheet mrSpooksLeft, mrSpooksRight, mrSpooksUp, mrSpooksDown;


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


void LoadAssets()
{

  // Shop
  arLoad = loadImage("/data/sprites/Shop/ShopMGLoad1.png");
  arLoad2 = loadImage("/data/sprites/Shop/ShopMGLoad2.png");
  arFullLoad = loadImage("/data/sprites/Shop/ShopMGFullLoad.png");
  shotg_load = loadImage("/data/sprites/Shop/ShotgunShellLoad1.png");
  shotg_load2 = loadImage("/data/sprites/Shop/ShotgunShellLoad2.png");
  shotg_fullLoad = loadImage("/data/sprites/Shop/ShotgunShellFullLoad.png");

  // UI
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
  // Final pistol upgrade!
  treeGun_up = loadImage("/data/sprites/Guns/Handgun_Tree_Top.png");
  treeGun_down = loadImage("/data/sprites/Guns/Handgun_Tree_Down.png");
  treeGun_left = loadImage("/data/sprites/Guns/Handgun_Tree_Left.png");
  treeGun_right = loadImage("/data/sprites/Guns/Handgun_Tree_Right.png");

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
  //  controlImg = loadImage("/data/img/controls.png");
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
