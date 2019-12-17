class MachineGun extends GameObject {


  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {


    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(0, -15));
      myPlayer.playerPosY = myPlayer.playerPosY + 10;
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      Add(new Bullet(0, 15));
      myPlayer.playerPosY = myPlayer.playerPosY - 10;
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      Add(new Bullet(-15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX + 10;
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      Add(new Bullet(15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX - 10;
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
