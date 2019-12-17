class MachineGun extends Gun {

  MachineGun() {
    threshold = 8;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && bengine.shootingUp) {
      if (UI.ammoM1 > 0 ) {
        LMG.play();
        bengine.engine.add(new Bullet(0, -15));
        UI.ammoM1--;
        if (myPlayer.playerPosY < height - 10 - myPlayer.playerHeight ) {
          myPlayer.playerPosY = myPlayer.playerPosY + 10;
        }
        LMG.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.shootingDown) {
      if (UI.ammoM1 > 0 ) {
        LMG.play();
        UI.ammoM1--;
        bengine.engine.add(new Bullet(0, 15));
        if (myPlayer.playerPosY > 0 + 10) {
          myPlayer.playerPosY = myPlayer.playerPosY - 10;
        }
        LMG.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.shootingLeft) {
      if (UI.ammoM1 > 0 ) {
        LMG.play();
        UI.ammoM1--;
        bengine.engine.add(new Bullet(-15, 0));
        if (myPlayer.playerPosX < width - 10 - myPlayer.playerWidth ) {
          myPlayer.playerPosX = myPlayer.playerPosX + 10;
        }
        LMG.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.shootingRight) {
      if (UI.ammoM1 > 0 ) {
        LMG.play();
        UI.ammoM1--;
        bengine.engine.add(new Bullet(15, 0));
        if (myPlayer.playerPosX > 0 + 10) {
          myPlayer.playerPosX = myPlayer.playerPosX - 10;
        }
        LMG.rewind();
        cooldown = 0;
      }
    }
  }
}
