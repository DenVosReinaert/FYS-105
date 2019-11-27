class Shotgun extends Gun {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && lookingUp) {
      engine.add(new Bullet(-4, -14));
      engine.add(new Bullet(-2, -15));
      engine.add(new Bullet(0, -16));
      engine.add(new Bullet(2, -15));
      engine.add(new Bullet(4, -14));
      cooldown = 0;
    } else if (cooldown == threshold && lookingDown) {
      engine.add(new Bullet(-4, 14));
      engine.add(new Bullet(-2, 15));
      engine.add(new Bullet(0, 16));
      engine.add(new Bullet(2, 15));
      engine.add(new Bullet(4, 14));
      cooldown = 0;
    } else if (cooldown == threshold && lookingRight) {
      engine.add(new Bullet(14, -4));
      engine.add(new Bullet(15, -2));
      engine.add(new Bullet(16, 0));
      engine.add(new Bullet(15, 2));
      engine.add(new Bullet(14, 4));
      cooldown = 0;
    } else if (cooldown == threshold && lookingLeft) {
      engine.add(new Bullet(-14, -4));
      engine.add(new Bullet(-15, -2));
      engine.add(new Bullet(-16, 0));
      engine.add(new Bullet(-15, 2));
      engine.add(new Bullet(-14, 4));
      cooldown = 0;
    }
  }
}
