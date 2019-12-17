class Shotgun extends GameObject {



  Shotgun() {
    threshold = 60;
    cooldown = 0;
    knockback = 20;
  }

  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(-2, -14));
      Add(new Bullet(-1, -15));
      Add(new Bullet(0, -16));
      Add(new Bullet(1, -15));
      Add(new Bullet(2, -14));

      cooldown = 0;

      myPlayer.playerPosY += knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingDown) {

      Add(new Bullet(-2, 14));
      Add(new Bullet(-1, 15));
      Add(new Bullet(0, 16));
      Add(new Bullet(1, 15));
      Add(new Bullet(2, 14));

      cooldown = 0;

      myPlayer.playerPosY -= knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingRight) {

      Add(new Bullet(14, -2));
      Add(new Bullet(15, -1));
      Add(new Bullet(16, 0));
      Add(new Bullet(15, 1));
      Add(new Bullet(14, 2));

      cooldown = 0;

      myPlayer.playerPosX -= knockback;

      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
    } else if (cooldown == threshold && myPlayer.shootingLeft) {

      Add(new Bullet(-14, -2));
      Add(new Bullet(-15, -1));
      Add(new Bullet(-16, 0));
      Add(new Bullet(-15, 1));
      Add(new Bullet(-14, 2));

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
