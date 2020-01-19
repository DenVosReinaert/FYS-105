//Adriaan Pronk
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

  void update()
  {
    if ((frameCount % fps) == 0)
      frame = (frame + 1) % nFrames;

    drwImage.copy(srcImage, frame*frameWidth, 0, frameWidth, srcImage.height, 0, 0, frameWidth, srcImage.height);
  }

  void draw(float x, float y)
  {
    image(drwImage, x, y);
  }
}
