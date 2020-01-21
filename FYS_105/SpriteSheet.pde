class SpriteSheet
{
  PImage srcImage, drwImage;
  int fps = 5;
  int frame = 0;
  int frameWidth, frameHeight;
  int nFrames = 0;

  SpriteSheet(String imageName, int nFrames)                        //Specify the file location of the spritesheet and the amount of frames that it contains
  {
    srcImage = loadImage(imageName);
    this.nFrames = nFrames;
    frameWidth = srcImage.width/nFrames;                            //Discern the width of each frame from the amount of frames specified and the width of the total image
    frameHeight = srcImage.height;
    drwImage = createImage(frameWidth, srcImage.height, ARGB);      //Cut the spritesheet up into the corresponding frames
  }

  void update()                                                     //draw the image at the right time according to the specified frame rate
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
