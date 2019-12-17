//Ruben de Jager
class Spawner extends GameObject {

  Timer timer = new Timer();

  PVector spawnerPos0, spawnerPos1, spawnerPos2, spawnerPos3;

  boolean spawnable = false;

  //int timer = 0;
  float wave, waveAmount, gruntCount, bruteCount, heavyCount, speedsterCount, bossCount;
  boolean gruntSpawnDone, bruteSpawnDone, speedsterSpawnDone, heavySpawnDone, bossSpawnDone;



  Spawner() {
    
    spawnerPos0 = new PVector();
    spawnerPos1 = new PVector();
    spawnerPos2 = new PVector();
    spawnerPos3 = new PVector();
    
    
    spawnerPos0.x=width/2;
    spawnerPos0.y= -10;

    spawnerPos1.x=width + 10;
    spawnerPos1.y = height/2;

    spawnerPos2.x = width/2;
    spawnerPos2.y = height + 10;

    spawnerPos3.x = -10;
    spawnerPos3.y = height/2;

    waveAmount = 2;
  }//constructor spawner






  void draw() {

    for (int wave = 1; wave < waveAmount; wave ++)
    {
      if (!timer.Timerr(5)) {
        textSize(80);
        text("WAVE "+wave, width/2-150, height/2);
      }

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

    Add(new Boss1());
  }
}
