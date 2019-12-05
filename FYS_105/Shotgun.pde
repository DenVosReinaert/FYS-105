class Shotgun extends GameObject {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      Add(new Bullet(-2, -14));
      Add(new Bullet(-1, -15));
      Add(new Bullet(0, -16));
      Add(new Bullet(1, -15));
      Add(new Bullet(2, -14));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      Add(new Bullet(-2, 14));
      Add(new Bullet(-1, 15));
      Add(new Bullet(0, 16));
      Add(new Bullet(1, 15));
      Add(new Bullet(2, 14));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      Add(new Bullet(14, -2));
      Add(new Bullet(15, -1));
      Add(new Bullet(16, 0));
      Add(new Bullet(15, 1));
      Add(new Bullet(14, 2));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      Add(new Bullet(-14, -2));
      Add(new Bullet(-15, -1));
      Add(new Bullet(-16, 0));
      Add(new Bullet(-15, 1));
      Add(new Bullet(-14, 2));
      cooldown = 0;
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
