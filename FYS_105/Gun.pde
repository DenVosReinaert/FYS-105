class Gun
{
  float gunPosX = thePlayer.playerPosX+thePlayer.sizeX;
  float gunPosY = thePlayer.playerPosY+thePlayer.sizeY/4;
  int gunBarrelLength = 25;
  
  void display()
  {
    fill(150);
    //gunbarrel
    rect(gunPosX, gunPosY, gunBarrelLength, 6);
  }
}
