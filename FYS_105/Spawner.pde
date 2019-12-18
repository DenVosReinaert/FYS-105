//Ruben de Jager
class Spawner extends GameObject {

  Timer spawnableTimer = new Timer(5);
  Timer spawnTimer = new Timer(2);
  Timer waveTextTimer = new Timer(10);

  //int timer = 0;
  int wave = 1;
  int gruntCount, bruteCount, heavyCount, speedsterCount, bossCount;
  boolean gruntSpawnDone, bruteSpawnDone, speedsterSpawnDone, heavySpawnDone, bossSpawnDone;

  boolean waveInProgress = true;

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

    pushStyle();
    fill(255);

    if (waveInProgress && GameObjectRef.gameObject.size() == 0)
      NextWave();

    popStyle();
  }//spawnerUpdate







  void NextWave()
  {
    waveTextTimer.Timerr();

    if (!waveTextTimer.TimerDoneWithoutReset()) {
      textSize(80);
      text("WAVE "+ wave, width/2-150, height/2);
    }

    SpawnWave();

    waveInProgress = true;
  }



  void SpawnWave()
  {
    for (int i = 0; i< (int) random(wave * 2, wave * 5); i ++)
    {
      HeavySpawn();
      GruntSpawn();
      SpeedsterSpawn();
      BruteSpawn();
    }

    if (wave % 5 == 0)
      Boss1Spawn();
  }


  void BruteSpawn() {
    Add(new Brute( random(-1, 3)));
  }//spawnerShow

  void GruntSpawn() {
    Add(new Grunt( random(-1, 3)));
  }




  void SpeedsterSpawn() {
    Add(new Speedster( random(-1, 3)));
  }




  void HeavySpawn() {
    Add(new Heavy(random(-1, 3)));
  }




  void Boss1Spawn() {
    Add(new Boss1(random(-1, 3)));
  }
}
