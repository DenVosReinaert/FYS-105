class Shotgun extends Gun {


  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && upKey) {
      player.bulletList.add(new Bullet(-4, -14));
      player.bulletList.add(new Bullet(-2, -15));
      player.bulletList.add(new Bullet(0, -16));
      player.bulletList.add(new Bullet(2, -15));
      player.bulletList.add(new Bullet(4, -14));
      cooldown = 0;
    } else if (cooldown == threshold && downKey) {
      player.bulletList.add(new Bullet(-4, 14));
      player.bulletList.add(new Bullet(-2, 15));
      player.bulletList.add(new Bullet(0, 16));
      player.bulletList.add(new Bullet(2, 15));
      player.bulletList.add(new Bullet(4, 14));
      cooldown = 0;
    } else if (cooldown == threshold && rightKey) {
      player.bulletList.add(new Bullet(14, -4));
      player.bulletList.add(new Bullet(15, -2));
      player.bulletList.add(new Bullet(16, 0));
      player.bulletList.add(new Bullet(15, 2));
      player.bulletList.add(new Bullet(14, 4));
      cooldown = 0;
    } else if (cooldown == threshold && leftKey) {
      player.bulletList.add(new Bullet(-14, -4));
      player.bulletList.add(new Bullet(-15, -2));
      player.bulletList.add(new Bullet(-16, 0));
      player.bulletList.add(new Bullet(-15, 2));
      player.bulletList.add(new Bullet(-14, 4));
      cooldown = 0;
    }
  }
}
