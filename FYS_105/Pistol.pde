class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }
  void shoot() {

    if (cooldown == threshold && myPlayer.lookingUp) {
      Add(new Bullet(0, -15));
      myPlayer.playerPosY = myPlayer.playerPosY + 5;
    } else if (cooldown == threshold && myPlayer.lookingDown) {
      Add(new Bullet(0, 15));
      myPlayer.playerPosY = myPlayer.playerPosY - 5;
    } else if (cooldown == threshold && myPlayer.lookingLeft) {
      Add(new Bullet(-15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX + 5;
    } else if (cooldown == threshold && myPlayer.lookingRight) {
      Add(new Bullet(15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX - 5;
      Pistol.play();

      Pistol.rewind();
      cooldown = 0;
    }

    Pistol.play();
    Pistol.rewind();
    cooldown = 0;
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
