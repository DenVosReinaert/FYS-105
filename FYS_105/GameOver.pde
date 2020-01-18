class GameOver {


  GameOver() {
  }

  void setup() {
  }

  void draw() {
    if (gamemngr.dead) { // if boolean 'dead' is true
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
      text("PRESS A TO CONTNUE", width/2, height/2 + 50); // Text for whatever stands there <
      popStyle();
      spawn.wave = 1; // reset the wave in class spawn to 1
      myPlayer.currentGun = 1; // reset currentGun in class Player to 1

      // turn off and rewind every goddamn soundtrack other people added :D
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
      // End of turning every sound off

      // Remove all enemies!
      for (int i = 0; i < GameObjectRef.gameObject.size(); i++) // if i tinier than the size of GameObject then add i
      {
        GameObjectRef.gameObject.get(i).hp = 0; // get the 'hp' from gameObject with same i and turn hp to 0 (killing everything)
        GameObjectRef.Remove(GameObjectRef.gameObject.get(i)); // get gameObject with same i and remove it from the gameObject array
      }
      // Turn every movements off
      myPlayer.shootingRight = false;
      myPlayer.shootingLeft = false;
      myPlayer.shootingUp = false;
      myPlayer.shootingDown = false;
      myPlayer.lookingLeft = false;
      myPlayer.lookingRight = false;
      myPlayer.lookingUp = false;
      myPlayer.lookingDown = true;
      // End of turning every movements off

      // play death sound
      death.play();
    }
  }
  void keyPressed() {
    if (gamemngr.dead) { // if boolean 'dead' true
      if (keyCode == RIGHT) { 
        ascore.saveScore(); // run saveScore function from ascore class
        gamemngr.dead = false; // turn boolean 'dead' in class gamemngr to false
        gamemngr.hscore = true; // turn boolean 'hscore' in class gamemngr to true
        Reset(); // run reset function
      }
    }
  }
  void Reset()
  {
    ascore.combo = 1; // reset ascore.combo to 1
    UI.shield = 0; // reset shield level to 0
    UI.levens = 3; // reset levens to 3
    gamemngr.hscoreA = 0; // reset hscoreA to 0

    myPlayer.objPosX = width/2 - myPlayer.objWidth/2; // set player back to the middle
    myPlayer.objPosY = height/2 - myPlayer.objHeight/2;// set player back to the middle

    Pistol.pause(); // turn off pistol sound
    Shotgun.pause(); // turn off shotgun sound
    AR1.pause(); // turn off AR1 sound

    // reset all ammo
    UI.ammoP = 5;
    UI.maxM1 = 30;
    UI.maxS1 = 5;

    // rewind gun sounds
    Pistol.rewind();
    Shotgun.rewind();
    AR1.rewind();

    ascore.score = 0; // set score back to 0
    spawn.wave = 1; // reset wave back to 1 (had issue with this so it does it twice in this whole class )
    spawn.waveTextTimer.Reset(); // reset waveTimer

    lvlMngr.apActive = false; // turn lvlMngr to false

    myPlayer.pistol.upgradeLevel = 1; // reset pistol upgrade to 1 
    myPlayer.machineGun.upgradeLevel = 1; // reset machineGun upgrade to 1
    myPlayer.shotGun.upgradeLevel = 1; // reset shotGun upgrade to 1

    // print(UI.levens);
    gamemngr.dead = false; // turn boolean 'dead' to false
    gamemngr.hscore = true; // turn boolean 'hscore' to false

    // Turn all collisions to false
    myPlayer.collLeft = false;
    myPlayer.collRight = false;
    myPlayer.collTop = false;
    myPlayer.collBott = false;

    // turn all key inputs to false
    myPlayer.akey = false;
    myPlayer.dkey = false;
    myPlayer.wkey = false;
    myPlayer.skey = false;

    // turn all spawn booleans to false
    spawn.spawnBrtFinished = false;
    spawn.spawnSpdFinished = false;
    spawn.spawnGrntFinished = false;
    spawn.spawnHvyFinished = false;
    spawn.spawnBssFinished = false;

    //Adjust enemy count to the new wave number
    spawn.countBrt = round(random(spawn.wave, spawn.wave + 1));   
    spawn.countSpd = round(random(spawn.wave, spawn.wave + 3));
    spawn.countGrnt = round(random(spawn.wave, spawn.wave + 2));
    spawn.countHvy = round(random(spawn.wave, spawn.wave + 1));
    spawn.countBss = round(spawn.wave / 5);

    // reset all sounds again

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
