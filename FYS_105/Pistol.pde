class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }


  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      GameObjectRef.gameObject.add(new Bullet(0, -15));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      GameObjectRef.gameObject.add(new Bullet(0, 15));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      GameObjectRef.gameObject.add(new Bullet(-15, 0));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      GameObjectRef.gameObject.add(new Bullet(15, 0));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
