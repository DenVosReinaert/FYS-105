class UltimateMachineGun extends GameObject {

  UltimateMachineGun() {
    threshold = 3;    //when the cooldown is the same number as threshold, you can shoot.
    cooldown = 0;     //cooldown is +1 every frame.
    knockback = 3;    //knockback is 3 pixels back when you shoot every time.
  }

  void shoot() {
    // if you are shooting up, the bullets will go up.
    if (cooldown == threshold && myPlayer.shootingUp) {
      Add(new Bullet(random(-0.25, 0.25), -20));

      cooldown = 0;

      //the knockback is down.
      myPlayer.playerPosY += knockback;

      //if you are shooting down, the bullets will go down.
    } else if (cooldown == threshold && myPlayer.shootingDown) {
      Add(new Bullet(random(-0.25, 0.25), 20));

      cooldown = 0;

      //the knockback is up.
      myPlayer.playerPosY -= knockback;

      //if you are shooting to the right, the bullets will go right.
    } else if (cooldown == threshold && myPlayer.shootingRight) {
      Add(new Bullet(20, (random(-0.25, 0.25))));

      cooldown = 0;

      //the knockback is to the left.
      myPlayer.playerPosX -= knockback;

      //if you are shooting to the let, the bullets will go left.
    } else if (cooldown == threshold && myPlayer.shootingLeft) {
      Add(new Bullet(-20, random(-0.25, 0.25)));

      cooldown = 0;

      //the knockback is to the right.
      myPlayer.playerPosX += knockback;
    }
  }

  //cooldown will add 1 every frame till it reaches the threshold.
  void recharge() {
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
