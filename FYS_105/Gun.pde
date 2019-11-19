class Gun
{
  float gunPosX = thePlayer.xPosition+thePlayer.playerSize;
  float gunPosY = thePlayer.yPosition+thePlayer.playerSize/4;
  int gunBarrelLength = 25;
  
  void display()
  {
    fill(150);
    //gunbarrel
    rect(gunPosX, gunPosY, gunBarrelLength, 6);
  }
}
