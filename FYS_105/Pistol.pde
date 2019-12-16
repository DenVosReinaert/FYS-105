class Pistol extends Gun {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }


  void shoot() {
    if (cooldown == threshold && bengine.lookingUp) {
      bengine.engine.add(new Bullet(0, -15));
      myPlayer.playerPosY = myPlayer.playerPosY + 5;
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingDown) {
      bengine.engine.add(new Bullet(0, 15));
      myPlayer.playerPosY = myPlayer.playerPosY - 5;
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingLeft) {
      bengine.engine.add(new Bullet(-15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX + 5;
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    } else if (cooldown == threshold && bengine.lookingRight) {
      bengine.engine.add(new Bullet(15, 0));
      myPlayer.playerPosX = myPlayer.playerPosX - 5;
      Pistol.play();
      Pistol.rewind();
      cooldown = 0;
    }
  }
}
