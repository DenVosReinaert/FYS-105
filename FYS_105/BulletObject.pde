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
      gun.gunBarrelLength = -25;
      gun.gunPosX = thePlayer.xPosition;
    }

    if (lookingRight == true)
    {
      lookingLeft = false;
      gun.gunBarrelLength = 25;
      gun.gunPosX = thePlayer.xPosition+thePlayer.playerSize;
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
      thePlayer.xPosition = thePlayer.xPosition+5;
      gun.gunPosX = gun.gunPosX+5;
    }

    if (key == 'a')
    {
      lookingRight = false;
      lookingLeft = true;
      thePlayer.xPosition = thePlayer.xPosition-5;
      gun.gunPosX = gun.gunPosX-5;
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

//hoi
