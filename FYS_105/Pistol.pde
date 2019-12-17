class Pistol extends Gun {

  Pistol() {
    threshold = 50;
    cooldown = 0;
  }


  void shoot() {
    if (cooldown == threshold && bengine.lookingUp) {
      if (UI.ammoP > 0) {
        Pistol.play();
        UI.ammoP--;
        bengine.engine.add(new Bullet(0, -15));
        if (myPlayer.playerPosY < height - 5 - myPlayer.playerHeight ) {
          myPlayer.playerPosY = myPlayer.playerPosY + 5;
        }
        Pistol.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.lookingDown) {
      if (UI.ammoP > 0) {
        Pistol.play();
        UI.ammoP--;
        bengine.engine.add(new Bullet(0, 15));
        if (myPlayer.playerPosY > 0 + 10) {
          myPlayer.playerPosY = myPlayer.playerPosY - 5;
        }
        Pistol.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.lookingLeft) {
      if (UI.ammoP > 0) {
        Pistol.play();
        UI.ammoP--;
        bengine.engine.add(new Bullet(-15, 0));
        if (myPlayer.playerPosX < width - 5 - myPlayer.playerWidth ) {
          myPlayer.playerPosX = myPlayer.playerPosX + 5;
        }
        Pistol.rewind();
        cooldown = 0;
      }
    } else if (cooldown == threshold && bengine.lookingRight) {
      if (UI.ammoP > 0) {
        Pistol.play();
        UI.ammoP--;
        bengine.engine.add(new Bullet(15, 0));
        if (myPlayer.playerPosX > 0 + 10) {
          myPlayer.playerPosX = myPlayer.playerPosX - 5;
        }
        Pistol.rewind();
        cooldown = 0;
      }
    }
  }
}
