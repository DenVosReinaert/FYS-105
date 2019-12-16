class Shotgun extends Gun {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.shootingUp) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      bengine.engine.add(new Bullet(-2, -14));
      bengine.engine.add(new Bullet(-1, -15));
      bengine.engine.add(new Bullet(0, -16));
      bengine.engine.add(new Bullet(1, -15));
      bengine.engine.add(new Bullet(2, -14));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingDown) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      bengine.engine.add(new Bullet(-2, 14));
      bengine.engine.add(new Bullet(-1, 15));
      bengine.engine.add(new Bullet(0, 16));
      bengine.engine.add(new Bullet(1, 15));
      bengine.engine.add(new Bullet(2, 14));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingRight) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      bengine.engine.add(new Bullet(14, -2));
      bengine.engine.add(new Bullet(15, -1));
      bengine.engine.add(new Bullet(16, 0));
      bengine.engine.add(new Bullet(15, 1));
      bengine.engine.add(new Bullet(14, 2));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingLeft) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      bengine.engine.add(new Bullet(-14, -2));
      bengine.engine.add(new Bullet(-15, -1));
      bengine.engine.add(new Bullet(-16, 0));
      bengine.engine.add(new Bullet(-15, 1));
      bengine.engine.add(new Bullet(-14, 2));
      cooldown = 0;
    }
  }
}
