class Shotgun extends GameObject {


  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {

    if (cooldown == threshold && bengine.shootingUp) {
      Add(new Bullet(-2, -14));
      Add(new Bullet(-1, -15));
      Add(new Bullet(0, -16));
      Add(new Bullet(1, -15));
      Add(new Bullet(2, -14));
      cooldown = 0;

      myPlayer.playerPosY = myPlayer.playerPosY + 20;
    } else if (cooldown == threshold && bengine.shootingDown) {

      Add(new Bullet(-2, 14));
      Add(new Bullet(-1, 15));
      Add(new Bullet(0, 16));
      Add(new Bullet(1, 15));
      Add(new Bullet(2, 14));
      cooldown = 0;

      myPlayer.playerPosY = myPlayer.playerPosY - 20;
    } else if (cooldown == threshold && bengine.shootingRight) {

      Add(new Bullet(14, -2));
      Add(new Bullet(15, -1));
      Add(new Bullet(16, 0));
      Add(new Bullet(15, 1));
      Add(new Bullet(14, 2));
      cooldown = 0;

      myPlayer.playerPosX = myPlayer.playerPosX - 20;
    } else if (cooldown == threshold && bengine.shootingLeft) {

      Add(new Bullet(-14, -2));
      Add(new Bullet(-15, -1));
      Add(new Bullet(-16, 0));
      Add(new Bullet(-15, 1));
      Add(new Bullet(-14, 2));

      myPlayer.playerPosX = myPlayer.playerPosX + 20;

      cooldown = 0;
    }
    Shotgun.play();
    Shotgun.rewind();
    ShotgunReload.play();
    ShotgunReload.rewind();
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
