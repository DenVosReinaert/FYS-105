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

    println("Brute: " + countBrt + ", " +"Grunt: " + countGrnt + ", " +"Speed: " + countSpd + ", " +"Heavy: " + countHvy);


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

      //if (!waveTextTimer.TimerDone())
      //{
      //  textSize(80);
      //  text("WAVE "+ (wave), width/2-150, height/2);
      //} else if (!waveInProgress && waveTextTimer.TimerDone())
      //{
      //  waveInProgress = true;
      //}


      //if (waveInProgress && waveTextTimer.TimerDone() && GameObjectRef.gameObject.size() == 0)
      //{
      //  waveFinished = true;
      //}

      //if (waveFinished)
      //{
      //  lvlMngr.apActive = true;

      //  if (wave % 2 == 0)
      //    shop.shopA = true;
      //}


      //popStyle();
    }
  }//spawnerUpdate







  void NextWave()
  {
    garfield.pause();      //Reset shop sound
    garfield.rewind();
    waveInProgress = false;      //Reset wave progress
    waveFinished = false;

    spawn.wave ++;      //Set current wave number to the next

    countBrt = round(random(wave, wave * 2));    //Adjust enemy count to the new wave number
    countSpd = round(random(wave, wave * 4));
    countGrnt = round(random(wave, wave * 3));
    countHvy = round(random(wave, wave * 2));
    countBss = round(wave / 5);

    shop.shopA = false;          //Make sure the shop is turned off and the arrows are turned off
    lvlMngr.apActive = false;

    waveTextTimer.Reset();      //Reset the timer for the text "wave n"

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;      //Set the player position to the middle of the screen
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    lvlMngr.lvlNum = round(random(0, 3));
  }





  void SpawnWave()
  {
    if (waveInProgress && !waveFinished && spawnBrtFinished && spawnGrntFinished && spawnSpdFinished && spawnHvyFinished && spawnBssFinished && GameObjectRef.gameObject.size() == 0)
    {
      waveInProgress = false;
      waveFinished = true;
    }

    if (!waveFinished && waveInProgress)
    {
      if (countBrt == 0)
        spawnBrtFinished = true;

      if (spawnBrtTimer.TimerDone()&& waveInProgress && !spawnBrtFinished)
      {
        Add(new Brute());
        spawnBrtTimer.Reset();
        countBrt--;
      }
    }


    if (!waveFinished && waveInProgress)
    {
      if (countGrnt == 0)
        spawnGrntFinished = true;

      if (spawnGrntTimer.TimerDone() && !spawnGrntFinished)
      {
        Add(new Grunt());
        spawnGrntTimer.Reset();
        countGrnt--;
      }
    }

    if (!waveFinished && waveInProgress)
    {
      if (countSpd == 0)
        spawnSpdFinished = true;

      if (spawnSpdTimer.TimerDone() && !spawnSpdFinished)
      {
        Add(new Speedster());
        spawnSpdTimer.Reset();
        countSpd--;
      }
    }

    if (!waveFinished  && waveInProgress)
    {
      if (countHvy == 0)
        spawnHvyFinished = true;

      if (spawnHvyTimer.TimerDone() && !spawnHvyFinished)
      {
        Add(new Heavy());
        spawnHvyTimer.Reset();
        countHvy--;
      }
    }

    if (!waveFinished && waveInProgress)
    {
      if (wave % 5 == 0) {

        if (countBss == 0)
          spawnBssFinished = true;

        if (spawnBssTimer.TimerDone() && !spawnBssFinished)
        {
          Add(new Boss1());
          spawnBssTimer.Reset();
          countBss--;
        }
      }
    }
  }
}
