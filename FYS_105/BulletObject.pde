class Bullet
{
  float posX, posY, speed, sizeX, sizeY;
  boolean lookingLeft = false;
  boolean lookingRight = true;
  boolean dead = false;

  Bullet(float x, float y)
  {
    posX = x;
    posY = y;
    speed = 10;
    sizeX = 20;
    sizeY = 10;
  }// bullet

  void dickplay()
  {
    if (posX > width) {
      dead = true;
    }//if
    posX = posX + speed;
    fill(100,200,40);
    rect(posX,posY,sizeX,sizeY);
  }//dickplay
} // class

void displayBullet(){
  for (int i = theBullet.size() - 1;i >= 0; i --){
    Bullet b = theBullet.get(i);
    b.dickplay();
    if (b.dead == true){
      theBullet.remove(i);
    } // if
  } // for
} // dispplay bullut
void keybullet()
{
  if (key == ' ' && theBullet.size() <=3){
    theBullet.add(new Bullet(thePlayer.playerPosX,thePlayer.playerPosY));
  }// if
  
} // kaypulet
