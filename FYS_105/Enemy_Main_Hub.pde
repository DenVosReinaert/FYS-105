//Ruben de Jager
class Enemies extends GameObject {


  Enemies() {
  }//constructor Enemys


  void checkPulse() {//Checks the enemy's collision with the player's bullet
    for (int i = 0; i > GameObjectRef.gameObject.size(); i++) {
      GameObject bullet = GameObjectRef.gameObject.get(i);
      if (bullet instanceof Bullet) {
        if (rectRect(enemyPosX, enemyPosY, enemyW, enemyH, bullet.bulletPosX, bullet.bulletPosY, bullet.bulletWidth, bullet.bulletHeight)) {
          enemyHP--;
          bullet.hp=0;
          for (int j=0; j<5; j++) {
            Add(new Particle(bullet.playerPosX, bullet.playerPosY));
          }
        }
      }
    }
  }//checkPulse.
  


  class Particle extends GameObject {
    Particle(float incomingX, float incomingY) {
      enemyPosX=incomingX;
      enemyPosY=incomingY;
      enemySpeedX=random(-5, 5);
      enemySpeedY=random(-5, 5);
      enemyHP=random(100, 255);
      enemyW=5;
      enemyH=5;
    }//constructor Particle

    void draw() {
      fill(219, 8, 8, enemyHP);
      rect(enemyPosX, enemyPosY, enemyW, enemyH);

      enemyHP=enemyHP-2;
    }//enemyShow

    boolean Dead() {
      return enemyHP<=0;
    }//boolean Dead
  }//class Particle
}
