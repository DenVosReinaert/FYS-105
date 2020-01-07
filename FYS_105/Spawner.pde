//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnSpdTimer = new Timer(1);
  Timer spawnGrntTimer = new Timer(2);
  Timer spawnBrtTimer = new Timer(3);
  Timer spawnHvyTimer = new Timer(5);
  Timer spawnBssTimer = new Timer(10);

  Timer waveTextTimer = new Timer(6);

  //int timer = 0;
  int wave = 1;

  int countBrt, countSpd, countGrnt, countHvy, countBss;


  boolean waveInProgress = false;

  boolean spawnBrtFinished, spawnGrntFinished, spawnSpdFinished, spawnHvyFinished, spawnBssFinished;
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

    countBrt = round(random(wave, wave * 2));
    countSpd = round(random(wave, wave * 4));
    countGrnt = round(random(wave, wave * 3));
    countHvy = round(random(wave, wave * 2));
    countBss = round(wave / 5);
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
      }

      if (waveInProgress)
        SpawnWave();


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

      if (shop.shopA)
        shop.draw();
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



    countBrt = round(random(wave, wave * 2));
    countSpd = round(random(wave, wave * 4));
    countGrnt = round(random(wave, wave * 3));
    countHvy = round(random(wave, wave * 2));
    countBss = round(wave / 5);
  }





  void SpawnWave()
  {
    for (int i = 0; i < countBrt; i ++)
    {
      if (i >= countBrt)
        spawnBrtFinished = true;

      if (spawnBrtTimer.TimerDone())
      {
        Add(new Brute());
        spawnBrtTimer.Reset();
      }
    }


    for (int j = 0; j < countGrnt; j ++)
    {
      if (j >= countGrnt)
        spawnGrntFinished = true;

      if (spawnGrntTimer.TimerDone())
      {
        Add(new Grunt());
        spawnGrntTimer.Reset();
      }
    }


    for (int k = 0; k < countSpd; k ++)
    {
      if (k >= countSpd)
        spawnSpdFinished = true;

      if (spawnSpdTimer.TimerDone() && !spawnSpdFinished)
      {
        Add(new Speedster());
        spawnSpdTimer.Reset();
      }
    }


    for (int l = 0; l < countHvy; l ++)
    {
      if (l >= countHvy)
        spawnHvyFinished = true;

      if (spawnHvyTimer.TimerDone())
      {
        Add(new Heavy());
        spawnHvyTimer.Reset();
      }
    }


    if (wave % 5 == 0) {
      for (int m = 0; m < countBss; m ++)
      {
        if (m >= countBss)
          spawnBssFinished = true;

        if (spawnBssTimer.TimerDone())
        {
          Add(new Boss1());
          spawnBssTimer.Reset();
        }
      }
    }
  }
}
