class MachineGun extends Gun {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.shootingUp) {
      bengine.engine.add(new Bullet(0, -15));
      LMG.play();
      LMG.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingDown) {
      bengine.engine.add(new Bullet(0, 15));
      LMG.play();
      LMG.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingLeft) {
      bengine.engine.add(new Bullet(-15, 0));
      LMG.play();
      LMG.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.shootingRight) {
      bengine.engine.add(new Bullet(15, 0));
      LMG.play();
      LMG.rewind();
      cooldown = 0;
    }
  }
}
