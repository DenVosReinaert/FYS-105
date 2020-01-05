//Ruben de Jager
class Particle extends GameObject {
  float particlePosX, particlePosY, particleSpeedX, particleSpeedY, particleWidth, particleHeight, particleAlpha;

  Particle(float incomingX, float incomingY) {
    particlePosX=incomingX;
    particlePosY=incomingY;
    particleSpeedX=random(-5, 5);
    particleSpeedY=random(-5, 5);
    particleWidth=5;
    particleHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(bloodOrb, particlePosX, particlePosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    particlePosX += particleSpeedX;
    particlePosY += particleSpeedY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow




  void checkPulse() {//Checks the enemy's collision with the player's bullet
    //Quinn versie
    for (int i = 0; i < GameObjectRef.gameObject.size(); i ++)
    {
      if (dist(enemyPosX, enemyPosY, myPlayer.playerPosX, myPlayer.playerPosY) < 10) {
        UI.spelerhit();
        hp = 0;
      }

      if (GameObjectRef.gameObject.get(i).bulletPosX > 0 && GameObjectRef.gameObject.get(i).bulletPosY > 0) {
        if (GameObjectRef.gameObject.get(i).bulletPosX == 0)
          GameObjectRef.gameObject.get(i).bulletPosX = -10000;
        if (GameObjectRef.gameObject.get(i).bulletPosY == 0)
          GameObjectRef.gameObject.get(i).bulletPosY = -10000;
        if (dist(enemyPosX, enemyPosY, GameObjectRef.gameObject.get(i).bulletPosX, GameObjectRef.gameObject.get(i).bulletPosY) < 20) {
          hp=hp-1;
          Remove(GameObjectRef.gameObject.get(i));
          for (int j=0; j < 20; j++) {
            Add(new Particle(enemyPosX, enemyPosY));
          }//for
        }
      }
    }
  }

  boolean Dead() {
    return hp<=0;
  }//boolean Dead
}//class Particle
