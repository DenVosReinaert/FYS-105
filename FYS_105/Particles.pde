//Ruben de Jager
class Particle extends GameObject {
  float particleAlpha;

  Particle(float incomingX, float incomingY) {
    objPosX=incomingX;
    objPosY=incomingY;
    moveVelX=random(-5, 5);
    moveVelY=random(-5, 5);
    objWidth=5;
    objHeight=5;

    particleAlpha = 255;
  }//constructor Particle

  void draw() {
    pushStyle();
    tint(219, 8, 8, particleAlpha);
    image(bloodOrb, objPosX, objPosY);
    popStyle();
    //rect(particlePosX, particlePosY, particleWidth, particleHeight);

    objPosX += moveVelX;
    objPosY += moveVelY;

    particleAlpha -= 7;

    if (particleAlpha <= 0)
      Remove(this);
  }//enemyShow
}//class Particle
