class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
    knockback = 5;
  }
  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(0, -15));

      cooldown = 0;

      myPlayer.playerPosY += knockback;

      Pistol.play();
      Pistol.rewind();
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      Add(new Bullet(0, 15));

      cooldown = 0;

      myPlayer.playerPosY -=knockback;

      Pistol.play();
      Pistol.rewind();
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      Add(new Bullet(-15, 0));

      cooldown = 0;

      myPlayer.playerPosX += knockback;

      Pistol.play();
      Pistol.rewind();
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      Add(new Bullet(15, 0));

      cooldown = 0;

      myPlayer.playerPosX -= knockback;

      Pistol.play();
      Pistol.rewind();
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
