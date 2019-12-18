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
      noStroke();
      fill(219, 8, 8, particleAlpha);
      rect(particlePosX, particlePosY, particleWidth, particleHeight);

      particlePosX += particleSpeedX;
      particlePosY += particleSpeedY;

      particleAlpha -= 7;

      if (particleAlpha <= 0)
        Remove(this);
    }
    //class Particle
  }
