//Ruben de Jager
class Spawner extends GameObject {

  Timer timer = new Timer();

  float spawnerPosX0, spawnerPosY0, spawnerW, spawnerH; //Left
  float spawnerPosX1, spawnerPosY1; //Right
  float spawnerPosX2, spawnerPosY2; //Up
  float spawnerPosX3, spawnerPosY3; //Down

  boolean spawnable = false;

  //int timer = 0;
  float wave, waveAmount, gruntCount, bruteCount, heavyCount, speedsterCount, bossCount;
  boolean gruntSpawnDone, bruteSpawnDone, speedsterSpawnDone, heavySpawnDone, bossSpawnDone;



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

    waveAmount = 1;
  }//constructor spawner






  void draw() {
    fill(255);
    rect(spawnerPosX0, spawnerPosY0, spawnerW, spawnerH);//Left
    rect(spawnerPosX1, spawnerPosY1, spawnerW, spawnerH);//Right
    rect(spawnerPosX2, spawnerPosY2, spawnerW, spawnerH);//Up
    rect(spawnerPosX3, spawnerPosY3, spawnerW, spawnerH);//Down

    //timer<100



    for (int wave = 0; wave < waveAmount; wave ++)
    {
      if (timer.Timerr(5)) {
        textSize(80);
        text("WAVE "+wave, width/2-150, height/2);

        if (spawnable)
        {
          BruteSpawn();
          GruntSpawn();
          HeavySpawn();
          SpeedsterSpawn();

          if (wave % 5 == 0)
            Boss1Spawn();
        }

        spawnable = true;



        if (spawnable && heavySpawnDone && gruntSpawnDone && speedsterSpawnDone && bruteSpawnDone && bossSpawnDone && GameObjectRef.gameObject.size() == 0)
        {
          spawnable = false;
          heavySpawnDone = false;
          gruntSpawnDone = false;
          speedsterSpawnDone = false;
          bruteSpawnDone = false;
          bossSpawnDone = false;

          waveAmount ++;
        }
      }
    }
  }//spawnerUpdate



  void BruteSpawn() {


    bruteCount = random(wave * 2, wave * 5);

    for (int i = 0; i < bruteCount; i ++)
    {
      if (timer.Timerr(5))
        Add(new Brute());

      if (i == bruteCount)
        bruteSpawnDone = true;
    }
  }//spawnerShow




  void GruntSpawn() {
    gruntCount = random(wave * 2, wave * 5);

    for (int i = 0; i < gruntCount; i ++)
    {
      if (timer.Timerr(2))
        Add(new Grunt());

      if (i == gruntCount)
        gruntSpawnDone = true;
    }
  }




  void SpeedsterSpawn() {
    speedsterCount = random(wave * 2, wave * 5);

    for (int i = 0; i < speedsterCount; i ++)
    {
      if (timer.Timerr(1))
        Add(new Speedster());

      if (i == speedsterCount)
        speedsterSpawnDone = true;
    }
  }




  void HeavySpawn() {
    heavyCount = random(wave * 2, wave * 5);

    for (int i = 0; i < heavyCount; i ++)
    {
      if (timer.Timerr(7))
        Add(new Heavy());

      if (i == heavyCount)
        heavySpawnDone = true;
    }
  }




  void Boss1Spawn() {
    bossCount = 1;

    for (int i = 0; i < bossCount; i ++)
    {
      Add(new Boss1());

      if (i == bossCount)
        bossSpawnDone = true;
    }
  }
}
