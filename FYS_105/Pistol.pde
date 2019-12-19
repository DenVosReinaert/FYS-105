class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
    knockback = 5;
  }

  // Show weapon sprite
  void holdingGun() {
    float barrelX, barrelY;
    if (myPlayer.lookingUp) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;
      image(handgunUp, barrelX, barrelY);
      handgunUp.resize(8, 35);
      mrSpooksUp.draw(myPlayer.playerPosX, myPlayer.playerPosY);
      mrSpooksUp.update();
      
    } else if (myPlayer.lookingDown) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2+4;
      barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2+10;
      image(handgunDown, barrelX, barrelY);
      handgunDown.resize(8, 35);
      
    } else if (myPlayer.lookingRight) {
      barrelX = myPlayer.playerPosX + playerWidth + 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunRight, barrelX, barrelY);
      handgunRight.resize(35, 16);
      
    } else if (myPlayer.lookingLeft) {
      barrelX = myPlayer.playerPosX - playerWidth - 20;
      barrelY = myPlayer.playerPosY - playerHeight/2 + 2;
      image(handgunLeft, barrelX, barrelY);
      handgunLeft.resize(35, 16);
    }
  }


  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-0.25, 0.25), random(-14.75, -15.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.playerPosY += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-0.25, 0.25), random(14.75, 15.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.playerPosY -=knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(-14.75, -15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.playerPosX += knockback;

        Pistol.play();
        Pistol.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      if (UI.ammoP > 0) {
        Add(new Bullet(random(14.75, 15.25), random(-0.25, 0.25)));
        UI.ammoP--;
        cooldown = 0;

        myPlayer.playerPosX -= knockback;

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
