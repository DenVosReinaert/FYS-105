class MachineGun extends Gun {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && upKey) {
      player.bulletList.add(new Bullet(0, -15));
      cooldown = 0;
    } 
    else if (cooldown == threshold && downKey) {
      player.bulletList.add(new Bullet(0, 15));
      cooldown = 0;
    } 
    else if (cooldown == threshold && leftKey) {
      player.bulletList.add(new Bullet(-15, 0));
      cooldown = 0;
    } 
    else if (cooldown == threshold && rightKey) {
      player.bulletList.add(new Bullet(15, 0));
      cooldown = 0;
    }
  }
}
