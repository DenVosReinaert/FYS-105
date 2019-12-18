import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;

AudioPlayer Shotgun, ShotgunReload, LMG, Pistol, homeSnd, death;

PImage main, pillar, background, scrBgr; //controlImg;

PImage playerFront, playerBack, playerLeft, playerRight;

PImage gardenPathA, gardenPathB, gardenPathC, gardenPathD, gardenPathE, gardenPathF, gardenPathG, gardenPathH, gardenPathI, gardenPathJ, gardenPathK;
SpriteSheet gardenPathFlowerPatch;
PImage purpleStoneTiles;


void LoadAssets()
{

  playerFront = loadImage("/data/sprites/playerFront.png");
  playerBack = loadImage("/data/sprites/playerBack.png");
  playerLeft = loadImage("/data/sprites/playerLeft.png");
  playerRight = loadImage("/data/sprites/playerRight.png");

  scrBgr = loadImage("/data/img/mainMenu_scorePage.png");
  //  controlImg = loadImage("/data/img/controls.png");
  main = loadImage("/data/img/LastStand-MainMenu.png");
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
  gardenPathFlowerPatch = new SpriteSheet("/Graphics/GardenPath_FlowerPatch.png", 5);

  purpleStoneTiles = loadImage("/Graphics/PurpleStoneTiles.png");




  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
  ShotgunReload = minim.loadFile("/data/sound/ShotgunReload.mp3");
  LMG = minim.loadFile("/data/sound/LMG.mp3");
  Pistol = minim.loadFile("/data/sound/Pistol.mp3");
  homeSnd = minim.loadFile("/data/sound/homeSnd.mp3");
  death = minim.loadFile("/data/sound/death.mp3");
}
