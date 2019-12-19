class Pistol extends GameObject {

  Pistol() {
    threshold = 50;
    cooldown = 0;
    knockback = 5;
  }

// Show weapon sprite
  void holdingGun() {
    float barrelX, barrelY;
    if (lookingUp) {
      barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2;
      barrelY = myPlayer.playerPosY - myPlayer.playerHeight/2;
        image(handgunUp, barrelX, barrelY);
    }
    else if (lookingDown) {
     barrelX = myPlayer.playerPosX + myPlayer.playerWidth/2;
     barrelY = myPlayer.playerPosY + myPlayer.playerHeight/2;
     image(handgunDown, barrelX, barrelY);
    }
    else if (lookingRight) {
     barrelX = myPlayer.playerPosX + playerWidth;
     barrelY = myPlayer.playerPosY - playerHeight/2;
     image(handgunRight, barrelX, barrelY);
    }
    else if (lookingLeft) {
     barrelX = myPlayer.playerPosX - playerWidth;
     barrelY = myPlayer.playerPosY - playerHeight/2;
     image(handgunLeft, barrelX, barrelY);
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
