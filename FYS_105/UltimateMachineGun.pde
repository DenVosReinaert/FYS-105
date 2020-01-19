// Reno Bisschop
class UltimateMachineGun extends GameObject {

  Timer cooldownTimer = new Timer(0.05);

  UltimateMachineGun() {

    knockback = 3;    //knockback is 3 pixels back when you shoot every time.
  }

  void shoot() {
    // if you are shooting up, the bullets will go up.
    if (cooldownTimer.TimerDone() && myPlayer.shootingUp) {
      Add(new Bullet(random(-0.25, 0.25), -20));


      //the knockback is down.
      myPlayer.objPosY += knockback;

      //if you are shooting down, the bullets will go down.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingDown) {
      Add(new Bullet(random(-0.25, 0.25), 20));

      //the knockback is up.
      myPlayer.objPosY -= knockback;

      //if you are shooting to the right, the bullets will go right.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingRight) {
      Add(new Bullet(20, (random(-0.25, 0.25))));

      //the knockback is to the left.
      myPlayer.objPosX -= knockback;

      //if you are shooting to the let, the bullets will go left.
    } else if (cooldownTimer.TimerDone() && myPlayer.shootingLeft) {
      Add(new Bullet(-20, random(-0.25, 0.25)));

      //the knockback is to the right.
      myPlayer.objPosX += knockback;
    }

    cooldownTimer.Reset();
  }
}
