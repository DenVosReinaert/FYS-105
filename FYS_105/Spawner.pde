//Ruben de Jager
class Spawner extends GameObject {

  float spawnerPosX0, spawnerPosY0, spawnerW, spawnerH; //Left
  float spawnerPosX1, spawnerPosY1; //Right
  float spawnerPosX2, spawnerPosY2; //Up
  float spawnerPosX3, spawnerPosY3; //Down

  int timer = 0;
  int wave;

  Spawner() {
    spawnerPosX0=-40 * 2;
    spawnerPosY0=height/2-spawnerW;

    spawnerPosX1=width + 40 * 2;
    spawnerPosY1=height/2-spawnerW;

    spawnerPosX2=width/2-spawnerW;
    spawnerPosY2=-40 * 2;

    spawnerPosX3=width/2-spawnerW;
    spawnerPosY3=height + 40 * 2;

    spawnerW=100;
    spawnerH=100;
  }//constructor spawner


  void draw() {
    fill(255);
    rect(spawnerPosX0, spawnerPosY0, spawnerW, spawnerH);//Left
    rect(spawnerPosX1, spawnerPosY1, spawnerW, spawnerH);//Right
    rect(spawnerPosX2, spawnerPosY2, spawnerW, spawnerH);//Up
    rect(spawnerPosX3, spawnerPosY3, spawnerW, spawnerH);//Down


    if (frameCount<100) {
    } else if (frameCount<400) {
      straightLine1();
    } else if (frameCount<1500) {
      straightLine1();
      straightLine2();
    } else if (frameCount<2300) {
      straightLine1();
      straightLine2();
      straightLine3();
    }
  }//spawnerShow


  void straightLine1() {
    if (frameCount %100==0) {//modulus
      Add(new Grunt());
    }
  }

  void straightLine2() {
    if (frameCount %50==0) {//modulus
      Add(new Speedster());
    }
  }

  void straightLine3() {
    if (frameCount %30==0) {//modulus
      Add(new Heavy());
    }
  }
}
