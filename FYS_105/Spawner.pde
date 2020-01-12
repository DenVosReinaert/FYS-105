//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnSpdTimer = new Timer(6);
  Timer spawnGrntTimer = new Timer(8);
  Timer spawnBrtTimer = new Timer(10);
  Timer spawnHvyTimer = new Timer(14);
  Timer spawnBssTimer = new Timer(20);

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

    countBrt = round(random(wave, wave + 1));
    countSpd = round(random(wave, wave + 1));
    countGrnt = round(random(wave, wave + 1));
    countHvy = round(random(wave, wave + 1));
    countBss = round(wave / 5);

    totalEnemyCount = countBrt + countSpd + countGrnt + countHvy + countBss;
  }//constructor spawner






  void draw() {

    if (totalEnemyCount < 0)
      totalEnemyCount = 0;

    //println("Brute: " + countBrt + ", " +"Grunt: " + countGrnt + ", " +"Speed: " + countSpd + ", " +"Heavy: " + countHvy);
    if (game) {

      pushStyle();
      fill(255);

      if (!waveTextTimer.TimerDone())     //Show the text that tells you what wave you're on for as long as the waveTextTimer is not done
      { 
        textSize(80);
        text("WAVE "+ (wave), width/2-150, height/2);
      }

      if (waveTextTimer.TimerDone() && !waveFinished && !waveInProgress)
        waveInProgress = true;

      if (waveFinished)     //When the wave is finished and there are no gameObjects on the screen, show the arrows, and if the round number is even show the shop
      {
        println("The Wave is Finished!");
        lvlMngr.apActive = true;

        if (wave % 2 == 0)
          shop.shopA = true;
      }

      if (shop.shopA)      //
        shop.draw();



      if (waveInProgress && !waveFinished)   //If the wave is in progress, spawn the enemies
      {
        SpawnWave();
      }
    }
  }//spawnerUpdate







  void NextWave()
  {
    shop.Reset();



    waveInProgress = false;      //Reset wave progress
    waveFinished = false;


    spawn.wave ++;      //Set current wave number to the next

    countBrt = round(random(wave, wave + 1));    //Adjust enemy count to the new wave number
    countSpd = round(random(wave, wave + 3));
    countGrnt = round(random(wave, wave + 2));
    countHvy = round(random(wave, wave + 1));
    countBss = round(wave / 5);

    totalEnemyCount = countBrt + countSpd + countGrnt + countHvy + countBss;


    spawnBrtFinished = false;
    spawnSpdFinished = false;
    spawnGrntFinished = false;
    spawnHvyFinished = false;
    spawnBssFinished = false;



    shop.shopA = false;          //Make sure the shop is turned off and the arrows are turned off
    lvlMngr.apActive = false;

    waveTextTimer.Reset();      //Reset the timer for the text "wave n"
    spawnBssTimer.Reset();

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;      //Set the player position to the middle of the screen
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    lvlMngr.lvlNum = round(random(0, 9));
  }





  void SpawnWave()
  {

    if (countBrt == 0)          //If the enemy spawn count has reached 0, stop spawning this enemy
      spawnBrtFinished = true;

    if (countGrnt == 0)
      spawnGrntFinished = true;

    if (countSpd == 0)
      spawnSpdFinished = true;

    if (countHvy == 0)
      spawnHvyFinished = true;

    if (countBss == 0)
      spawnBssFinished = true;


    SpawnSpeedster();          //Spawn all the enemies for this round
    SpawnGrunt();
    SpawnBrute();
    SpawnHeavy();
    SpawnBoss();


    if (spawnBrtFinished && spawnGrntFinished && spawnSpdFinished && spawnHvyFinished && spawnBssFinished && totalEnemyCount <= 0)      //If all the enemies are done spawning and there's nothing left on screen, end the wave
    {
      waveFinished = true;
      waveInProgress = false;
    }
  }





  void SpawnGrunt()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnGrntTimer.TimerDone() && !spawnGrntFinished)
      {
        Add(new Grunt());
        spawnGrntTimer.Reset();
        countGrnt--;
      }
    }
  }



  void SpawnBrute()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnBrtTimer.TimerDone()&& waveInProgress && !spawnBrtFinished)
      {
        Add(new Brute());
        spawnBrtTimer.Reset();
        countBrt--;
      }
    }
  }



  void SpawnSpeedster()
  {
    if (!waveFinished && waveInProgress)
    {
      if (spawnSpdTimer.TimerDone() && !spawnSpdFinished)
      {
        Add(new Speedster());
        spawnSpdTimer.Reset();
        countSpd--;
      }
    }
  }



  void SpawnHeavy()
  {
    if (!waveFinished  && waveInProgress)
    {
      if (spawnHvyTimer.TimerDone() && !spawnHvyFinished)
      {
        Add(new Heavy());
        spawnHvyTimer.Reset();
        countHvy--;
      }
    }
  }



  void SpawnBoss()
  {
    if (!waveFinished && waveInProgress)
    {
      if (wave % 5 == 0) {
        if (spawnBssTimer.TimerDone() && !spawnBssFinished)
        {
          Add(new Boss1());
          spawnBssTimer.Reset();
          countBss--;
          ohhimark.setGain(60);
          ohhimark.play();
        }
      } else spawnBssFinished = true;
    }
  }
}
