class Gun
{
  float gunPosX = thePlayer.playerPosX+thePlayer.sizeX;
  float gunPosY = thePlayer.playerPosY+thePlayer.sizeY/4;
  float gunBarrelLength = 25 / 1920f * width;
  
  void display()
  {
    fill(150);
    //gunbarrel
    rect(gunPosX, gunPosY, gunBarrelLength, 6);
  }
}
