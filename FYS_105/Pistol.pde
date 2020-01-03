class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
    knockback = 5;
  }

  // Show weapon sprite
  void holdingGun() {

    if (myPlayer.lookingUp) {
      barrelPosX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelPosY = myPlayer.playerPosY - myPlayer.playerHeight/2;
      image(handgunUp, barrelPosX, barrelPosY);
      handgunUp.resize(8, 35);
      
    } else if (myPlayer.lookingDown) {
      barrelPosX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelPosY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      image(handgunDown, barrelPosX, barrelPosY);
      handgunDown.resize(8, 35);
      
    } else if (myPlayer.lookingRight) {
      barrelPosX = myPlayer.playerPosX + playerWidth + 20;
      barrelPosY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunRight, barrelPosX, barrelPosY);
      handgunRight.resize(35, 16);
      
    } else if (myPlayer.lookingLeft) {
      barrelPosX = myPlayer.playerPosX - playerWidth - 20;
      barrelPosY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunLeft, barrelPosX, barrelPosY);
      handgunLeft.resize(35, 16);
    }
  }


  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-0.25, 0.25), random(-14.75, -15.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.moveVelY += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.moveVelY -=knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.moveVelX += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.moveVelX -= knockback;

        Pistol.play();
        Pistol.rewind();
      }
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
