//Ruben de Jager
class Spawner {

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

  void spawnerShow() {
    timer++;
    fill(255);
    rect(spawnerPosX0, spawnerPosY0, spawnerW, spawnerH);//Left
    rect(spawnerPosX1, spawnerPosY1, spawnerW, spawnerH);//Right
    rect(spawnerPosX2, spawnerPosY2, spawnerW, spawnerH);//Up
    rect(spawnerPosX3, spawnerPosY3, spawnerW, spawnerH);//Down
  }//spawnerShow

  void spawnerUpdate() {
    if (timer<100) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 1;
    } else if (timer>400 && timer < 2160) {
      GruntSpawn();
    } else if (timer > 2160 && timer < 3060) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 2;
    } else if (timer > 3060 && timer < 4860) {
      GruntSpawn();
      SpeedsterSpawn();
    } else if (timer > 4860 && timer <5760) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 3;
    } else if (timer > 5760 && timer < 7560) {
      GruntSpawn();
      HeavySpawn();
    } else if (timer > 7560 && timer <8460) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 4;
    } else if (timer > 8460 && timer <10260) {
      GruntSpawn();
      SpeedsterSpawn();
      HeavySpawn();
    } else if (timer > 10260 && timer < 11160) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 5;
    } else if (timer > 11160 && timer <12960) {
      SpeedsterSpawn();
      HeavySpawn();
    } else if (timer > 12960 && timer < 13860) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 6;
    } else if (timer > 13860 && timer < 13950) {
      BruteSpawn();
      GruntSpawn();
    } else if (timer > 13950 && timer < 14025) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 7;
    } else if (timer > 14025 && timer <15825) {
      HeavySpawn();
      BruteSpawn();
      GruntSpawn();
    } else if (timer > 15825 && timer < 16725) {
      textSize(80);
      text("WAVE "+wave, width/2-150, height/2);
      wave = 8;
    } else if (timer > 16725 && timer <18525) {
      SpeedsterSpawn();
      BruteSpawn();
    } else if (timer > 18525 && timer < 19200) {
      textSize(80);
      text("BOSS WAVE ", width/2-300, height/2);
      wave = 9;
    } else if (timer > 19200 && timer < 19400 ) {
      Boss1Spawn();
    } else if (timer > 19400) {
    }
  }//spawnerUpdate
  void GruntSpawn() {
    if (frameCount %150==0) {//modulus
      gamemngr.AI.add(new Grunt());
    }
  }

  void SpeedsterSpawn() {
    if (frameCount %360==0) {//modulus
      gamemngr.AI.add(new Speedster());
    }
  }

  void HeavySpawn() {
    if (frameCount %450==0) {//modulus
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
