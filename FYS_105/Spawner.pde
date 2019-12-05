//Ruben de Jager
class Spawner {

  float spawnerPosX0, spawnerPosY0, spawnerW, spawnerH; //Left
  float spawnerPosX1, spawnerPosY1; //Right
  float spawnerPosX2, spawnerPosY2; //Up
  float spawnerPosX3, spawnerPosY3; //Down

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

  void spawnerShow() {
    fill(255);
    rect(spawnerPosX0, spawnerPosY0, spawnerW, spawnerH);//Left
    rect(spawnerPosX1, spawnerPosY1, spawnerW, spawnerH);//Right
    rect(spawnerPosX2, spawnerPosY2, spawnerW, spawnerH);//Up
    rect(spawnerPosX3, spawnerPosY3, spawnerW, spawnerH);//Down
  }//spawnerShow

  void spawnerUpdate() {
    if (frameCount<100) {
    } else if (frameCount<400) {
      GruntSpawn();
    } else if (frameCount<2160) {
    } else if (frameCount<3060) {
      GruntSpawn();
      SpeedsterSpawn();
    } else if (frameCount<4860) {
    } else if (frameCount<5760) {
      GruntSpawn();
      HeavySpawn();
    } else if (frameCount<7560) {
    } else if (frameCount<8460) {
      GruntSpawn();
      SpeedsterSpawn();
      HeavySpawn();
    } else if (frameCount<10260) {
    } else if (frameCount<11160) {
      SpeedsterSpawn();
      HeavySpawn();
    } else if (frameCount<12960) {
    } else if (frameCount<13860) {
      BruteSpawn();
      GruntSpawn();
    } else if (frameCount<13950) {
    } else if (frameCount<14025) {
      HeavySpawn();
      BruteSpawn();
      GruntSpawn();
    } else if (frameCount<15825) {
    } else if (frameCount<16725) {
      SpeedsterSpawn();
      BruteSpawn();
    } else if (frameCount<18525) {
    }
  }//spawnerUpdate
  void GruntSpawn() {
    if (frameCount %100==0) {//modulus
      gamemngr.AI.add(new Grunt());
    }
  }

  void SpeedsterSpawn() {
    if (frameCount %50==0) {//modulus
      gamemngr.AI.add(new Speedster());
    }
  }

  void HeavySpawn() {
    if (frameCount %30==0) {//modulus
      gamemngr.AI.add(new Heavy());
    }
  }
 //HeavySpawn

void BruteSpawn() {
  if (frameCount %375==0) {//modulus
    gamemngr.AI.add(new Brute());
  }
}//HeavySpawn

void Boss1Spawn() {
  if (frameCount %60==0) {
    gamemngr.AI.add(new Boss1());
  }
}//Boss1Spawn
}//class Spawner
