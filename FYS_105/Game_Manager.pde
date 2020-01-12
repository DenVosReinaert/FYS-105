class Game_Manager {
  boolean login;
  boolean dead;
  boolean statspage;
  boolean creditspage;
  boolean home;
  boolean hscore;
  boolean shake;

  int trackNumber;

  boolean inputBlockedUI;
  boolean inputtingCode;

  String codeDoom = "ssssss";
  String codeUndertale = "sswd";
  String codeStreetFighter = "ssddl";
  String codeKonami = "wwssadadkl";
  String codeDMC = "aaaaaddddd";
  String codeFireEmblem = "wswsad";
  String codeXenoblade = "sdwas";
  String code = "";

  int konamiCodeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  float  badgePosX, badgePosY;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
    trackNumber = 1;
    konamiCodeLength = 10;

    badgePosX = width/2 + 375;
    badgePosY = height/5 + 30;
  }

  void draw() {

    if (statspage) {
      home = false;
      stats.draw();
      stats.keyReleased();
    }
    if (creditspage) {
      home = false;
      credits.draw();
      credits.keyReleased();
    }

    if (login) {

      game = false;
      Login.draw();
      loginMusic.setGain(0);
      if (!loginMusic.isPlaying()) 
      {
        loginMusic.play();
        loginMusic.rewind();
      }
      image(pokemonMDB, badgePosX, badgePosY);
    }
    if (home) {
      UI.draw();
      loginMusic.rewind();
      loginMusic.pause();
      death.rewind();
      death.pause();
      game = false;
      dead = false;
      homeSnd.setGain(0);
      if (!homeSnd.isPlaying() ) {
        homeSnd.play();
        homeSnd.rewind();
      }
    }
    if (hscore) {
      if (hscoreA == 0) {
        hscorel = new hScorelijst();
      }
      hscoreA = 1;
      hscorel.draw();
    }

    if (game) {

      switch(trackNumber) {
      case 1:
        gameMusic.setGain(0);
        if (!gameMusic.isPlaying()) {
          gameMusic.play();
          gameMusic.rewind();
        }
        break;
      case 2:
        contraJungleTheme.setGain(100);
        if (!contraJungleTheme.isPlaying())
        {
          contraJungleTheme.play();
          contraJungleTheme.rewind();
        }
        break;
      case 3:
        guilesTheme.setGain(100);
        if (!guilesTheme.isPlaying())
        {
          guilesTheme.play();
          guilesTheme.rewind();
        }
        break;
      case 4:
        megalovania.setGain(0);
        if (!megalovania.isPlaying())
        {
          megalovania.play();
          megalovania.rewind();
        }
        break;
      case 5:
        e1m1.setGain(0);
        if (!e1m1.isPlaying())
        {
          e1m1.play();
          e1m1.rewind();
        }
        break;
      case 6:
        devilMayCry.setGain(0);
        if (!devilMayCry.isPlaying()) {
          devilMayCry.play();
          devilMayCry.rewind();
        }
        break;
      case 7:
        fireEmblem.setGain(0);
        if (!fireEmblem.isPlaying()) {
          fireEmblem.play();
          fireEmblem.rewind();
        }
        break;
      case 8:
        xenoblade.setGain(0);
        if (!xenoblade.isPlaying()) {
          xenoblade.play();
          xenoblade.rewind();
        }
        break;
      }

      if (UI.levens <= 0) {
        gamemngr.dead = true;
      }

      homeSnd.pause();

      ascore.draw();

      spawn.draw();
    }





    if (dead) {
      game = false;
      gameover.draw();
    }
  }

  void screenShake() {
    translate(-shakeAmount, shakeAmount);
    shake = false;
  }

  void keyPressed() {

    // Stats for devs (Show us information)
    if (key == 'p') 
    {
      println("ID: " + User.currentUser);
      println("Player: " + ascore.name);
      println("Levens: " + UI.levens + " Shield: " + UI.shield);
      println("GameObjects: " + GameObjectRef.gameObject.size() + " Brt: " + spawn.countBrt + " Hvy: " + spawn.countHvy + " Grnt: " + spawn.countGrnt + " Spd: " + spawn.countSpd + " Bss: " + spawn.countBss);
      println("Wave: " + spawn.wave + " In progress: " + spawn.waveInProgress + " Finished: " + spawn.waveFinished);
    }



    if (login) {
      Login.keyPressed();
    }
    if (dead) {
      gameover.keyPressed();
    }
    if (game) {
      myPlayer.keyPressed();
    }
    if (home) {


      switch(key)        //KEY
      {
      case 'r':
        println("PRESSED SELECT");
        break;

      case 'w':
        if (inputtingCode)
          code += key;
        break;

      case 's':
        if (inputtingCode)
          code += key;
        break;

      case 'a':
        if (inputtingCode)
          code += key;
        break;

      case 'd':
        if (inputtingCode)
          code += key;
        break;
      }


      switch(keyCode)    //KEYCODE
      {
      case UP:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'j';
          code += key;
        }
        break;

      case LEFT:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'h';
          code += key;
        }
        break;

      case DOWN:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'k';
          code += key;
        }
        break;

      case RIGHT:
        if (inputtingCode && inputBlockedUI)
        {
          key = 'l';
          code += key;
        }
        break;

      case RETURN:
        if (inputtingCode)
        {
          if (code.equals(codeKonami))
          {
            chieves.UnlockAchievement(3);

            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            chieves.UnlockAchievement(4);

            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
          }

          if (code.equals(codeUndertale))
          {
            chieves.UnlockAchievement(5);

            println("You're gonna have a bad time");
            if (trackNumber == 4)
              trackNumber = 1;
            else trackNumber = 4;
          }

          if (code.equals(codeDoom))
          {
            chieves.UnlockAchievement(6);

            println("At Doom's Gate");
            if (trackNumber == 5)
              trackNumber = 1;
            else trackNumber = 5;
          }
          if (code.equals(codeDMC))
          {
            println("You can cry if you want, it doesn't make you a crybaby. Does make you a little bitch though.");
            if (trackNumber == 6)
              trackNumber = 1;
            else trackNumber = 6;
          }
          if (code.equals(codeFireEmblem))
          {
            println("kill EVERY LAST ONE OF THEM");
            if (trackNumber == 7)
              trackNumber = 1;
            else trackNumber = 7;
          }
          if (code.equals(codeXenoblade))
          {
            println("You've caught Territorial Rotbart's attention!");
            if (trackNumber == 8)
              trackNumber = 1;
            else trackNumber = 8;
          }

          code = code.substring(0, code.length()-code.length());
        }
        break;



      case ENTER:
        if (inputtingCode)
        {
          if (code.equals(codeKonami))
          {
            chieves.UnlockAchievement(3);

            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            chieves.UnlockAchievement(4);

            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
          }

          if (code.equals(codeUndertale))
          {
            chieves.UnlockAchievement(5);

            println("You're gonna have a bad time");
            if (trackNumber == 4)
              trackNumber = 1;
            else trackNumber = 4;
          }

          if (code.equals(codeDoom))
          {
            chieves.UnlockAchievement(6);

            println("At Doom's Gate");
            if (trackNumber == 5)
              trackNumber = 1;
            else trackNumber = 5;
          }
          if (code.equals(codeDMC))
          {
            println("You can cry if you want, it doesn't make you a crybaby. Does make you a little bitch though.");
            if (trackNumber == 6)
              trackNumber = 1;
            else trackNumber = 6;
          }
          if (code.equals(codeFireEmblem))
          {
            println("kill EVERY LAST ONE OF THEM");
            if (trackNumber == 7)
              trackNumber = 1;
            else trackNumber = 7;
          }
          if (code.equals(codeXenoblade))
          {
            println("You've caught Territorial Rotbart's attention!");
            if (trackNumber == 8)
              trackNumber = 1;
            else trackNumber = 8;
          }
          code = code.substring(0, code.length()-code.length());
        }
        break;
      }


      if (!inputtingCode && !inputBlockedUI)
        UI.keyPressed();
    }
  }


  void keyReleased() {
    if (hscore) {
      if (keyCode == DOWN) {
        hscore = false;
        home = true;
      }
    }
    println(code);
    if (home)
    {
      if (code.length() > konamiCodeLength - 1)
        code = code.substring(0, code.length() - (code.length() - konamiCodeLength));

      switch(key)
      {
      case 'r':      
        code = code.substring(0, code.length()-code.length());
        if (inputtingCode && inputBlockedUI)
        {
          inputtingCode = false;
          inputBlockedUI = false;
        } else
          if (!inputtingCode && !inputBlockedUI)
          {
            inputtingCode = true;
            inputBlockedUI = true;
          }
        break;
      }
    }

    if (game) {
      myPlayer.keyReleased();
    }
  }
}
