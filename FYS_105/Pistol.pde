class Pistol extends Gun {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && lookingUp) {
      engine.add(new Bullet(0, -15));
      cooldown = 0;
    } 
    else if (cooldown == threshold && lookingDown) {
      engine.add(new Bullet(0, 15));
      cooldown = 0;
    }
    else if (cooldown == threshold && lookingLeft) {
      engine.add(new Bullet(-15, 0));
      cooldown = 0;
    }
    else if (cooldown == threshold && lookingRight) {
      engine.add(new Bullet(15, 0));
      cooldown = 0;
    }
  }
}
