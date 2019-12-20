class MachineGun extends Gun {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.lookingUp) {
      bengine.engine.add(new Bullet(0, -15));
      cooldown = 0;
    } 
    else if (cooldown == threshold && bengine.lookingDown) {
      bengine.engine.add(new Bullet(0, 15));
      cooldown = 0;
    } 
    else if (cooldown == threshold && bengine.lookingLeft) {
      bengine.engine.add(new Bullet(-15, 0));
      cooldown = 0;
    } 
    else if (cooldown == threshold && bengine.lookingRight) {
      bengine.engine.add(new Bullet(15, 0));
      cooldown = 0;
    }
  }
}
