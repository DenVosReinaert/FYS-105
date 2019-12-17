class Shotgun extends Gun {

  Shotgun() {
    threshold = 60;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.shootingUp) {
      Shotgun.play();
      bengine.engine.add(new Bullet(-2, -14));
      bengine.engine.add(new Bullet(-1, -15));
      bengine.engine.add(new Bullet(0, -16));
      bengine.engine.add(new Bullet(1, -15));
      bengine.engine.add(new Bullet(2, -14));
      Shotgun.rewind();
      ShotgunReload.play();
      if (myPlayer.playerPosY < height - 20 - myPlayer.playerHeight ) {
        myPlayer.playerPosY = myPlayer.playerPosY + 20;
      }
      cooldown = 0;
      ShotgunReload.rewind();
    } else if (cooldown == threshold && bengine.shootingDown) {
      Shotgun.play();
      bengine.engine.add(new Bullet(-2, 14));
      bengine.engine.add(new Bullet(-1, 15));
      bengine.engine.add(new Bullet(0, 16));
      bengine.engine.add(new Bullet(1, 15));
      bengine.engine.add(new Bullet(2, 14));
      if (myPlayer.playerPosY > 0 + 20) {
        myPlayer.playerPosY = myPlayer.playerPosY - 20;
      }
      cooldown = 0;
      ShotgunReload.rewind();
    } else if (cooldown == threshold && bengine.shootingRight) {
      Shotgun.play();
      bengine.engine.add(new Bullet(14, -2));
      bengine.engine.add(new Bullet(15, -1));
      bengine.engine.add(new Bullet(16, 0));
      bengine.engine.add(new Bullet(15, 1));
      bengine.engine.add(new Bullet(14, 2));
      Shotgun.rewind();
      ShotgunReload.play();
      if (myPlayer.playerPosX > 0 + 20) {
        myPlayer.playerPosX = myPlayer.playerPosX - 20;
      }
      cooldown = 0;
      ShotgunReload.rewind();
    } else if (cooldown == threshold && bengine.shootingLeft) {
      Shotgun.play();
      bengine.engine.add(new Bullet(-14, -2));
      bengine.engine.add(new Bullet(-15, -1));
      bengine.engine.add(new Bullet(-16, 0));
      bengine.engine.add(new Bullet(-15, 1));
      bengine.engine.add(new Bullet(-14, 2));
      Shotgun.rewind();
      ShotgunReload.play();
      if (myPlayer.playerPosX < width - 20 - myPlayer.playerWidth ) {
        myPlayer.playerPosX = myPlayer.playerPosX + 20;
      }
      cooldown = 0;
      ShotgunReload.rewind();
    }
  }
}
