//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnableTimer = new Timer(5);
  Timer spawnTimer = new Timer(random(1, 3));
  Timer waveTextTimer = new Timer(6);

  //int timer = 0;
  int wave = 0;
  int gruntCount, bruteCount, heavyCount, speedsterCount, bossCount;
  boolean gruntSpawnDone, bruteSpawnDone, speedsterSpawnDone, heavySpawnDone, bossSpawnDone;
  boolean waveInProgress = false;
  boolean waveFinished = false;

  Spawner() {
    spawnerPos0.x=width/2;
    spawnerPos0.y= -10;

    spawnerPos1.x=width + 10;
    spawnerPos1.y = height/2;

    spawnerPos2.x = width/2;
    spawnerPos2.y = height + 10;

    spawnerPos3.x = -10;
    spawnerPos3.y = height/2;
  }//constructor spawner






  void draw() {

    if (game) {
      pushStyle();
      fill(255);

      if (!waveTextTimer.TimerDone() && !waveInProgress) {
        textSize(80);
        text("WAVE "+ (wave + 1), width/2-150, height/2);
      } else if (wave == 0)
        NextWave();

      if (GameObjectRef.gameObject.size() == 0 && waveInProgress && !waveFinished)
      {
        waveInProgress = false;
        waveFinished = true;
        shop.cartX = -100;
      }

      if (!waveInProgress && waveFinished && GameObjectRef.gameObject.size() == 0 && waveTextTimer.TimerDone()) {
        lvlMngr.apActive = true;
        if (wave%2 == 0)
          shop.shopA = true;
      }

      if (shop.shopA)
        shop.draw();

      //if (!waveInProgress && GameObjectRef.gameObject.size() == 0 && waveTextTimer.TimerDone())
      //  NextWave();

      popStyle();
    }
  }//spawnerUpdate







  void NextWave()
  {
    shop.shopA = false;
    SpawnWave();

    for (int i = 0; i < 1; i++)
    {
      wave++;
    }
  }



  void SpawnWave()
  {
    waveInProgress = true;
    waveFinished = false;

    HeavySpawn();
    GruntSpawn();
    SpeedsterSpawn();
    BruteSpawn();

    if (wave % 5 == 0)
      Boss1Spawn();
  }


  void BruteSpawn() {
    for (int i = 0; i< random(wave, wave * 2); i ++)
    {
      //spawnWaveTimer.Timerrr();

      //if()
      Add(new Brute());
    }
  }//spawnerShow

  void GruntSpawn() {
    for (int i = 0; i< random(wave, wave * 3); i ++)
    {
      Add(new Grunt());
    }
  }

  void SpeedsterSpawn() {
    for (int i = 0; i< random(wave, wave * 4); i ++)
    {
      Add(new Speedster());
    }
  }

  void HeavySpawn() {
    for (int i = 0; i< random(wave, wave * 2); i ++)
    {
      Add(new Heavy());
    }
  }

  void Boss1Spawn() {
    Add(new Boss1());
  }
}
