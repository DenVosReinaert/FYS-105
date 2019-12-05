import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;

AudioPlayer Shotgun, ShotgunReload, LMG, Pistol, homeSnd, death;

PImage main, pillar, background, scrBgr; //controlImg;




void LoadAssets()
{
  scrBgr = loadImage("/data/img/mainMenu_scorePage.png");
  //  controlImg = loadImage("/data/img/controls.png");
  main = loadImage("/data/img/LastStand-MainMenu.png");
  background = loadImage("/Graphics/background.png");
  pillar = loadImage("/Graphics/pillarSprite.png");
  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
  ShotgunReload = minim.loadFile("/data/sound/ShotgunReload.mp3");
  LMG = minim.loadFile("/data/sound/LMG.mp3");
  Pistol = minim.loadFile("/data/sound/Pistol.mp3");
  homeSnd = minim.loadFile("/data/sound/homeSnd.mp3");
  death = minim.loadFile("/data/sound/death.mp3");
}
