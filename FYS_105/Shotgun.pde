class Shotgun extends GameObject {



  Shotgun() {
    threshold = 60;
    cooldown = 0;
    knockback = 20;
  }

  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {

      for (int i = 0; i < 5; i++)
      {
        Add(new Bullet(random(-2, 2), random(-14, -16)));
      }

      cooldown = 0;

      myPlayer.playerPosY += knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingDown) {


      for (int i = 0; i < 5; i++)
      {
        Add(new Bullet(random(-2, 2), random(14, 16)));
      }

      cooldown = 0;

      myPlayer.playerPosY -= knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingRight) {


      for (int i = 0; i < 5; i++)
      {
        Add(new Bullet(random(14, 16), random(-2, 2)));
      }

      cooldown = 0;

      myPlayer.playerPosX -= knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingLeft) {

      for (int i = 0; i < 5; i++)
      {
        Add(new Bullet(random(-14, -16), random(-2, 2)));
      }

      cooldown = 0;

      myPlayer.playerPosX += knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
