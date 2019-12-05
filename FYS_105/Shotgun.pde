class Shotgun extends GameObject {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      GameObjectRef.gameObject.add(new Bullet(-2, -14));
      GameObjectRef.gameObject.add(new Bullet(-1, -15));
      GameObjectRef.gameObject.add(new Bullet(0, -16));
      GameObjectRef.gameObject.add(new Bullet(1, -15));
      GameObjectRef.gameObject.add(new Bullet(2, -14));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      GameObjectRef.gameObject.add(new Bullet(-2, 14));
      GameObjectRef.gameObject.add(new Bullet(-1, 15));
      GameObjectRef.gameObject.add(new Bullet(0, 16));
      GameObjectRef.gameObject.add(new Bullet(1, 15));
      GameObjectRef.gameObject.add(new Bullet(2, 14));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      GameObjectRef.gameObject.add(new Bullet(14, -2));
      GameObjectRef.gameObject.add(new Bullet(15, -1));
      GameObjectRef.gameObject.add(new Bullet(16, 0));
      GameObjectRef.gameObject.add(new Bullet(15, 1));
      GameObjectRef.gameObject.add(new Bullet(14, 2));
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      Shotgun.play();
      Shotgun.rewind();
      ShotgunReload.play();
      ShotgunReload.rewind();
      GameObjectRef.gameObject.add(new Bullet(-14, -2));
      GameObjectRef.gameObject.add(new Bullet(-15, -1));
      GameObjectRef.gameObject.add(new Bullet(-16, 0));
      GameObjectRef.gameObject.add(new Bullet(-15, 1));
      GameObjectRef.gameObject.add(new Bullet(-14, 2));
      cooldown = 0;
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
