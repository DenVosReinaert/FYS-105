class Bullet
{

  boolean shoot = false;
  boolean lookingLeft = false;
  boolean lookingRight = true;


  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  Gun gun;

  void setup()
  {
    size(1920, 1080);
    gun = new Gun();
  }

  void draw()
  {
    background(0, 150, 255);

    if (lookingLeft == true)
    {
      lookingRight = false;
      gun.gunBarrelLength = -25 / 1920 * width;
      gun.gunPosX = thePlayer.playerPosX;
    }

    if (lookingRight == true)
    {
      lookingLeft = false;
      gun.gunBarrelLength = 25 / 1920 * width;
      gun.gunPosX = thePlayer.playerPosX+thePlayer.sizeX;
    }

    gun.display();

    for (Bullet bullet : bullets) 
    {
      bullet.draw();
    }

    if (shoot == true)
    {
      bullets.add(new Bullet());
    }

    //if (barrelx > width)
    //{
    //  bullets.remove(0);
    //}
  }

  void keyPressed()
  {
    if (key == 'b')
    {
      shoot = true;
    } else
    {
      shoot = false;
    }


    if (key == 'd')
    {
      lookingLeft = false;
      lookingRight = true;
      thePlayer.playerPosX = thePlayer.playerPosX+5;
      gun.gunPosX = (gun.gunPosX+5) / 1920f * width;
    }

    if (key == 'a')
    {
      lookingRight = false;
      lookingLeft = true;
      thePlayer.playerPosX = (thePlayer.playerPosX-5) / 1920f * width;
      gun.gunPosX = (gun.gunPosX-5) / 1920f * width;
    }
  }

  void keyReleased()
  {
    if (key == 'b')
    {
      shoot = false;
    }
  }
}
