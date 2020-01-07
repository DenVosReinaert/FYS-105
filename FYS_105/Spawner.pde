//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnSpdTimer = new Timer(1);
  Timer spawnGrntTimer = new Timer(2);
  Timer spawnBrtTimer = new Timer(3);
  Timer spawnHvyTimer = new Timer(5);
  Timer waveTextTimer = new Timer(6);

  //int timer = 0;
  int wave = 1;
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

      if (!waveTextTimer.TimerDone())
      {
        textSize(80);
        text("WAVE "+ (wave), width/2-150, height/2);
      } else if (!waveInProgress && waveTextTimer.TimerDone())
      {
        waveInProgress = true;
        SpawnWave();
      }


      if (waveInProgress && waveTextTimer.TimerDone() && GameObjectRef.gameObject.size() == 0)
      {
        waveFinished = true;
      }


      if (waveFinished)
      {
        lvlMngr.apActive = true;

        if (wave % 2 == 0)
          shop.shopA = true;
      }
      //if (!waveTextTimer.TimerDone() && !waveInProgress) {
      //  textSize(80);
      //  text("WAVE "+ (wave + 1), width/2-150, height/2);
      //} else if (wave == 0)
      //  NextWave();

      //if (GameObjectRef.gameObject.size() == 0 && waveInProgress && !waveFinished)
      //{
      //  waveInProgress = false;
      //  waveFinished = true;
      //  shop.cartX = -100;
      //}

      //if (!waveInProgress && waveFinished && GameObjectRef.gameObject.size() == 0 && waveTextTimer.TimerDone()) {
      //  lvlMngr.apActive = true;
      //  if (wave%2 == 0)
      //    shop.shopA = true;
      //}

      if (shop.shopA)
        shop.draw();

      //if (!waveInProgress && GameObjectRef.gameObject.size() == 0 && waveTextTimer.TimerDone())
      //  NextWave();

      popStyle();
    }
  }//spawnerUpdate







  void NextWave()
  {
    waveInProgress = false;
    waveFinished = false;

    spawn.wave ++;

    waveTextTimer.Reset();
    shop.shopA = false;
    lvlMngr.apActive = false;


    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    for (int i = 0; i < 1; i++)
    {
      lvlMngr.lvlNum = round(random(0, 3));
    }
  }



  void SpawnWave()
  {
    //waveInProgress = true;
    //waveFinished = false;

    HeavySpawn();
    GruntSpawn();
    SpeedsterSpawn();
    BruteSpawn();

    if (wave % 5 == 0)
      Boss1Spawn();
  }




  void BruteSpawn() {
    for (int i = 0; i< round(random(wave, wave * 2)); i ++)
    {
      if (spawnBrtTimer.TimerDone())
      {
        Add(new Brute());
        spawnBrtTimer.Reset();
      }
    }
  }//spawnerShow




  void GruntSpawn() {
    for (int i = 0; i< round(random(wave, wave * 3)); i ++)
    {
      if (spawnGrntTimer.TimerDone())
      {
        Add(new Grunt());
        spawnGrntTimer.Reset();
      }
    }
  }




  void SpeedsterSpawn() {
    for (int i = 0; i< round(random(wave, wave * 4)); i ++)
    {
      if (spawnSpdTimer.TimerDone())
      {
        Add(new Speedster());
        spawnSpdTimer.Reset();
      }
    }
  }




  void HeavySpawn() {
    for (int i = 0; i< round(random(wave, wave * 2)); i ++)
    {
      if (spawnHvyTimer.TimerDone())
      {
        Add(new Heavy());
        spawnHvyTimer.Reset();
      }
    }
  }




  void Boss1Spawn() {
    for (int i = 0; i < round(wave / 5); i ++)
    {
      Add(new Boss1());
    }
  }
}
