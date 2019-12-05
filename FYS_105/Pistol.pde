class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }


  void shoot() {
    if (cooldown == threshold && myPlayer.lookingUp) {
      gameObject.add(new Bullet(0, -15));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      gameObject.add(new Bullet(0, 15));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      gameObject.add(new Bullet(-15, 0));
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      gameObject.add(new Bullet(15, 0));
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
