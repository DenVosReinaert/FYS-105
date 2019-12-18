class MachineGun extends GameObject {


  MachineGun() {
    threshold = 8;
    cooldown = 0;
    knockback = 15;
  }

  void shoot() {


    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(random(-0.5, 0.5), random(-14.5, -15.5)));

      cooldown = 0;

      myPlayer.playerPosY += knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      Add(new Bullet(random(-0.5, 0.5), random(14.5, 15.5)));

      cooldown = 0;


      myPlayer.playerPosY -= knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      Add(new Bullet(random(-14.5, -15.5), random(-0.5, 0.5)));

      cooldown = 0;

      myPlayer.playerPosX += knockback;

      LMG.play();
      LMG.rewind();
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      Add(new Bullet(random(14.5, 15.5), random(-0.5, 0.5)));

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
