class Shotgun extends GameObject {

  Shotgun() {
    threshold = 100;
    cooldown = 0;
    knockback = 40;
  }

  void shoot() {

    if (cooldown == threshold && myPlayer.shootingUp) {
      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          Add(new Bullet(random(-2, 2), random(-14, -16)));
        }
        UI.ammoS1--;
        cooldown = 0;

        myPlayer.playerPosY += knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      if ( UI.ammoS1 > 0) {


        for (int i = 0; i < 5; i++)
        {
          Add(new Bullet(random(-2, 2), random(14, 16)));
        }
        UI.ammoS1--;
        cooldown = 0;

        myPlayer.playerPosY -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      if ( UI.ammoS1 > 0) {

        for (int i = 0; i < 5; i++)
        {
          Add(new Bullet(random(14, 16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

        myPlayer.playerPosX -= knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      if ( UI.ammoS1 > 0) {
        for (int i = 0; i < 5; i++)
        {
          Add(new Bullet(random(-14, -16), random(-2, 2)));
        }
        UI.ammoS1--;
        cooldown = 0;

        myPlayer.playerPosX += knockback;

        Shotgun.play();
        Shotgun.rewind();
        ShotgunReload.play();
        ShotgunReload.rewind();
      }
    }
  }

  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
