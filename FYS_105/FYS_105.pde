Player thePlayer = new Player();
LevelManager lvlMngr = new LevelManager();







void setup()
{
  size(1280, 720);
  
  LoadAssets();
  lvlMngr.setup();
}




void draw()
{
  image(background, 0 , 0);
  background.resize(width, height);
  
  lvlMngr.draw();
  thePlayer.draw();
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
