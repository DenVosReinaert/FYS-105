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

    if (timer<100) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 1;
    } else if (timer>400 && timer < 2160) {
      GruntSpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 3060 && timer < 3065) {
        timer = 3060;
      }
    } else if (timer > 2160 && timer < 3060 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 2;
    } else if (timer > 3060 && timer < 4860) {
      GruntSpawn();
      SpeedsterSpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 5760 && timer < 5765) {
        timer = 5760;
      }
    } else if (timer > 4860 && timer <5760 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 3;
    } else if (timer > 5760 && timer < 7560) {
      GruntSpawn();
      HeavySpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 8460 && timer < 8465) {
        timer = 8460;
      }
    } else if (timer > 7560 && timer <8460 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 4;
    } else if (timer > 8460 && timer <10260) {
      GruntSpawn();
      SpeedsterSpawn();
      HeavySpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 11160 && timer < 11165) {
        timer = 1160;
      }
    } else if (timer > 10260 && timer < 11160 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 5;
    } else if (timer > 11160 && timer <12960) {
      SpeedsterSpawn();
      HeavySpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 13860 && timer < 13865) {
        timer = 13860;
      }
    } else if (timer > 12960 && timer < 13860 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 6;
    } else if (timer > 13860 && timer < 13950) {
      BruteSpawn();
      GruntSpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 14025 && timer < 14030) {
        timer = 14025;
      }
    } else if (timer > 13950 && timer < 14025 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 7;
    } else if (timer > 14025 && timer <15825) {
      HeavySpawn();
      BruteSpawn();
      GruntSpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 16725 && timer < 16730) {
        timer = 16725;
      }
    } else if (timer > 15825 && timer < 16725 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 8;
    } else if (timer > 16725 && timer <18525) {
      SpeedsterSpawn();
      BruteSpawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 19200 && timer < 19205) {
        timer = 19200;
      }
    } else if (timer > 18525 && timer < 19200 && GameObjectRef.gameObject.size() == 0) {
      textSize(80);
      text("BOSS WAVE", width/2-250, height/2);
      wave = 9;
    } else if (timer > 19200 && timer < 20100 ) {
      Boss1Spawn();
      if (GameObjectRef.gameObject.size() != 0 && timer > 20090 && timer < 20120) {
        timer = 20100;
      }
    } else if (timer > 20200 && GameObjectRef.gameObject.size() == 0) {
      healthbar.levens = 0;
    }
  }//spawnerUpdate


  void BruteSpawn() {
    if (frameCount %150==0) {//modulus
      Add(new Brute());
    }
  }//spawnerShow


  void GruntSpawn() {
    if (frameCount %100==0) {//modulus
      Add(new Grunt());
    }
  }

  void SpeedsterSpawn() {
    if (frameCount %50==0) {//modulus
      Add(new Speedster());
    }
  }

  void HeavySpawn() {
    if (frameCount %30==0) {//modulus
      Add(new Heavy());
    }
  }

  void Boss1Spawn() {
    if (frameCount %60==0) {//modulus
      Add(new Boss1());
    }
  }
}
