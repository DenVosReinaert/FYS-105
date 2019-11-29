class Shotgun extends Gun {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.lookingUp) {
      bengine.engine.add(new Bullet(-2, -14));
      bengine.engine.add(new Bullet(-1, -15));
      bengine.engine.add(new Bullet(0, -16));
      bengine.engine.add(new Bullet(1, -15));
      bengine.engine.add(new Bullet(2, -14));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingDown) {
      bengine.engine.add(new Bullet(-2, 14));
      bengine.engine.add(new Bullet(-1, 15));
      bengine.engine.add(new Bullet(0, 16));
      bengine.engine.add(new Bullet(1, 15));
      bengine.engine.add(new Bullet(2, 14));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingRight) {
      bengine.engine.add(new Bullet(14, -2));
      bengine.engine.add(new Bullet(15, -1));
      bengine.engine.add(new Bullet(16, 0));
      bengine.engine.add(new Bullet(15, 1));
      bengine.engine.add(new Bullet(14, 2));
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingLeft) {
      bengine.engine.add(new Bullet(-14, -2));
      bengine.engine.add(new Bullet(-15, -1));
      bengine.engine.add(new Bullet(-16, 0));
      bengine.engine.add(new Bullet(-15, 1));
      bengine.engine.add(new Bullet(-14, 2));
      cooldown = 0;
    }
  }
}
