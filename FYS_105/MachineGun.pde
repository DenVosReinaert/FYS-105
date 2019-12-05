class MachineGun extends GameObject {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      GameObjectRef.gameObject.add(new Bullet(0, -15));
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      GameObjectRef.gameObject.add(new Bullet(0, 15));
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      GameObjectRef.gameObject.add(new Bullet(-15, 0));
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      GameObjectRef.gameObject.add(new Bullet(15, 0));
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
