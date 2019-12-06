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
    } else if (frameCount>400 && frameCount < 2160) {
      GruntSpawn();
    } else if (frameCount>2160 && frameCount < 3060) {
    } else if (frameCount>3060 && frameCount < 4860) {
      GruntSpawn();
      SpeedsterSpawn();
    } else if (frameCount>4860 && frameCount <5760) {
    } else if (frameCount>5760 && frameCount < 7560) {
      GruntSpawn();
      HeavySpawn();
    } else if (frameCount>7560 && frameCount <8460) {
    } else if (frameCount>8460 && frameCount <10260) {
      GruntSpawn();
      SpeedsterSpawn();
      HeavySpawn();
    } else if (frameCount>10260 && frameCount < 11160) {
    } else if (frameCount>11160 && frameCount <12960) {
      SpeedsterSpawn();
      HeavySpawn();
    } else if (frameCount>12960 && frameCount < 13860) {
    } else if (frameCount> 13860 && frameCount < 13950) {
      BruteSpawn();
      GruntSpawn();
    } else if (frameCount>13950 && frameCount < 14025) {
    } else if (frameCount>14025 && frameCount <15825) {
      HeavySpawn();
      BruteSpawn();
      GruntSpawn();
    } else if (frameCount>15825 && frameCount < 16725) {
    } else if (frameCount>16725 && frameCount <18525) {
      SpeedsterSpawn();
      BruteSpawn();
    } else if (frameCount<18525) {
    }
    else if (frameCount > 19200 ) {
     Boss1Spawn(); 
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
