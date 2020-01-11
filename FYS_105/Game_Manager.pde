class Game_Manager {
  boolean login;
  boolean dead;
  boolean home;
  boolean hscore;
  boolean shake;

  int trackNumber;

  boolean inputBlockedUI;
  boolean inputtingCode;

  String codeStreetFighter = "ssddl";
  String codeKonami = "wwssadadkl";
  String code = "";

  int konamiCodeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
    trackNumber = 1;

    konamiCodeLength = 10;
  }

  void draw() {
    if (login) {
      game = false;
      Login.draw();
    }
    if (home) {
      UI.draw();
      game = false;
      dead = false;
      homeSnd.setGain(0);
      if (!homeSnd.isPlaying() ) {
        homeSnd.play();
        homeSnd.rewind();
      }


      //KONAMI CODE
      //WWSSADAD(DownArrow)(RightArrow)(Enter)
      if (inputtingCode && inputBlockedUI)
      {
        image(codeInputBox, width/2 - codeInputBox.width/2, height/2 - codeInputBox.height/2);

        pushStyle();
        fill(255);
        textSize(80);
        text("Press START to confirm", width/2, height/2 - 200);
        popStyle();
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
      }

      if (UI.levens <= 0) {
        gamemngr.dead = true;
      }

      homeSnd.pause();

      lvlMngr.lvlNum = 1;

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
    if (hscore) {
      if (keyCode == DOWN) {
        hscore = false;
        home = true;
      }
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
          key = 'j';
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
            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
          }
          code = code.substring(0, code.length()-code.length());
        }
        break;

      case ENTER:
        if (inputtingCode)
        {
          if (code.equals(codeKonami))
          {
            print("!KONAMI CODE HAS BEEN ENTERED!");
            if (trackNumber == 2)
              trackNumber = 1;
            else
              trackNumber = 2;
          }

          if (code.equals(codeStreetFighter))
          {
            println("HADOUKEN!");
            if (trackNumber == 3)
              trackNumber = 1;
            else trackNumber = 3;
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
