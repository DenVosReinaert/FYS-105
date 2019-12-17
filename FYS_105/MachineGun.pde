class MachineGun extends GameObject {


  MachineGun() {
    threshold = 8;
    cooldown = 0;
    knockback = 10;
  }

  void shoot() {


    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(0, -15));

      cooldown = 0;

      myPlayer.playerPosY += knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      Add(new Bullet(0, 15));

      cooldown = 0;


      myPlayer.playerPosY -= knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      Add(new Bullet(-15, 0));

      cooldown = 0;

      myPlayer.playerPosX += knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      Add(new Bullet(15, 0));

      cooldown = 0;

      myPlayer.playerPosX -= knockback;

      LMG.play();
      LMG.rewind();
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
