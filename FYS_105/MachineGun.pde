class MachineGun extends GameObject {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      gameObject.add(new Bullet(0, -15));
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      gameObject.add(new Bullet(0, 15));
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      gameObject.add(new Bullet(-15, 0));
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      gameObject.add(new Bullet(15, 0));
    }

    LMG.play();
    LMG.rewind();
    cooldown = 0;
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
