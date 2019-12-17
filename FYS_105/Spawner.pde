//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnTimer = new Timer(5);
  Timer waveTextTimer = new Timer(5);

  boolean spawnable = false;

  //int timer = 0;
  int wave, waveAmount;
  float gruntCount, bruteCount, heavyCount, speedsterCount, bossCount;
  boolean gruntSpawnDone, bruteSpawnDone, speedsterSpawnDone, heavySpawnDone, bossSpawnDone;



  Spawner() {
    spawnerPos0.x=width/2;
    spawnerPos0.y= -10;

    spawnerPos1.x=width + 10;
    spawnerPos1.y = height/2;

    spawnerPos2.x = width/2;
    spawnerPos2.y = height + 10;

    spawnerPos3.x = -10;
    spawnerPos3.y = height/2;

    waveAmount = 1;
  }//constructor spawner






  void draw() {

    pushStyle();
    fill(255);

    for (wave = 1; wave <= waveAmount; wave ++)
    {
      if (!waveTextTimer.TimerDoneWithoutReset()) {
        textSize(80);
        text("WAVE "+ wave, width/2-150, height/2);
      }
    }
    popStyle();

    if (spawnTimer.TimerDone() && spawnable)
    {
      HeavySpawn();
      GruntSpawn();
      SpeedsterSpawn();
      BruteSpawn();
      spawnTimer.TimerReset();
    }

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
    
    spawnable = true;



  }//spawnerUpdate



  void BruteSpawn() {


    bruteCount = random(wave * 2, wave * 5);

    for (int i = 0; i < bruteCount; i ++)
    {
      if (spawnTimer.TimerDoneWithoutReset())
        Add(new Brute((int) random(-1, 3)));

      if (i == bruteCount)
        bruteSpawnDone = true;
    }
  }//spawnerShow




  void GruntSpawn() {
    gruntCount = random(wave * 2, wave * 5);

    for (int i = 0; i < gruntCount; i ++)
    {
      if (spawnTimer.TimerDoneWithoutReset())
        Add(new Grunt((int) random(-1, 3)));

      if (i == gruntCount)
        gruntSpawnDone = true;
    }
  }




  void SpeedsterSpawn() {
    speedsterCount = random(wave * 2, wave * 5);

    println("GET FUUUUUUUUUUUUUUUUUUCKED!!!!!!");

    for (int i = 0; i < speedsterCount; i ++)
    {
      if (spawnTimer.TimerDoneWithoutReset())
        Add(new Speedster((int) random(-1, 3)));

      if (i == speedsterCount)
        speedsterSpawnDone = true;
    }
  }




  void HeavySpawn() {
    heavyCount = random(wave * 2, wave * 5);

    for (int i = 0; i < heavyCount; i ++)
    {
      if (spawnTimer.TimerDoneWithoutReset())
        Add(new Heavy((int) random(-1, 3)));

      if (i == heavyCount)
        heavySpawnDone = true;
    }
  }




  void Boss1Spawn() {

    Add(new Boss1((int) random(-1, 3)));
  }
}
