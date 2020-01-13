class GameOver {


  GameOver() {
  }

  void setup() {
  }

  void draw() {
    if (gamemngr.dead) {
      pushStyle();
      fill(0);
      rect(0, 0, width, height);
      popStyle();
      pushStyle();
      fill(255);
      textAlign(CENTER);
      textSize(80);
      text("YOU DIED", width/2, height/2 - 10);
      textSize(15);
      text("PRESS A TO CONTNUE", width/2, height/2 + 50);
      popStyle();
      gameMusic.pause();
      gameMusic.rewind();
      contraJungleTheme.pause();
      contraJungleTheme.rewind();
      guilesTheme.pause();
      guilesTheme.rewind();
      megalovania.pause();
      megalovania.rewind();
      e1m1.pause();
      e1m1.rewind();
      devilMayCry.pause();
      devilMayCry.rewind();
      fireEmblem.pause();
      fireEmblem.rewind();
      xenoblade.pause();
      xenoblade.rewind();
      // Remove all enemies!
      for (int i = 0; i < GameObjectRef.gameObject.size(); i++)
      {
        GameObjectRef.gameObject.get(i).hp = 0;
        GameObjectRef.Remove(GameObjectRef.gameObject.get(i));
      }
      // Turn everything off!
      myPlayer.shootingRight = false;
      myPlayer.shootingLeft = false;
      myPlayer.shootingUp = false;
      myPlayer.shootingDown = false;
      myPlayer.lookingLeft = false;
      myPlayer.lookingRight = false;
      myPlayer.lookingUp = false;
      myPlayer.lookingDown = true;

      death.play();
    }
  }
  void keyPressed() {
    if (gamemngr.dead) {
      if (keyCode == RIGHT) {
        ascore.saveScore();
        gamemngr.dead = false;
        gamemngr.hscore = true;
        Reset();
      }
    }
  }
  void Reset()
  {
    ascore.combo = 1;
    UI.shield = 0;
    UI.levens = 3;
    gamemngr.hscoreA = 0;

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2;
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;

    Pistol.pause();
    Shotgun.pause();
    AR1.pause();

    UI.ammoP = 5;


    Pistol.rewind();
    Shotgun.rewind();
    AR1.rewind();

    ascore.score = 0;
    spawn.wave = 1;
    spawn.waveTextTimer.Reset();

    // print(UI.levens);
    gamemngr.dead = false;
    gamemngr.hscore = true;

    myPlayer.collLeft = false;
    myPlayer.collRight = false;
    myPlayer.collTop = false;
    myPlayer.collBott = false;

    myPlayer.akey = false;
    myPlayer.dkey = false;
    myPlayer.wkey = false;
    myPlayer.skey = false;

    spawn.spawnBrtFinished = false;
    spawn.spawnSpdFinished = false;
    spawn.spawnGrntFinished = false;
    spawn.spawnHvyFinished = false;
    spawn.spawnBssFinished = false;

    spawn.countBrt = round(random(spawn.wave, spawn.wave + 1));    //Adjust enemy count to the new wave number
    spawn.countSpd = round(random(spawn.wave, spawn.wave + 3));
    spawn.countGrnt = round(random(spawn.wave, spawn.wave + 2));
    spawn.countHvy = round(random(spawn.wave, spawn.wave + 1));
    spawn.countBss = round(spawn.wave / 5);

    damage.pause();
    bruh.pause();
    garfield.pause();
    achievement.pause();
    buying1.pause();
    buying2.pause();
    buying3.pause();
    buying4.pause();
    buying5.pause();
    buying6.pause();
    buying7.pause();
    cantbuy1.pause();
    cantbuy2.pause();
    missing1.pause();
    missing2.pause();
    ohhimark.pause();
    uhoh.pause();
    shieldup.pause();
    ultimatemachinegun.pause();
    speedup.pause();
    garfieldSans.pause();
  }
}
