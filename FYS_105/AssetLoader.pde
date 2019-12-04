import ddf.minim.*;
import processing.video.*;



Movie video;
Minim minim;

AudioPlayer Shotgun;

PImage main, pillar, background, scrBgr; //controlImg;




void LoadAssets()
{
  scrBgr = loadImage("/data/img/mainMenu_scorePage.png");
  //  controlImg = loadImage("/data/img/controls.png");
  main = loadImage("/data/img/LastStand-MainMenu.png");
  background = loadImage("/Graphics/background.png");
  pillar = loadImage("/Graphics/pillarSprite.png");
  Shotgun = minim.loadFile("/data/sound/Shotgun.mp3");
}
