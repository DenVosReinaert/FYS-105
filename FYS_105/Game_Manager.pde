class Game_Manager {
  boolean login;
  boolean dead;
  boolean home;
  boolean hscore;
  boolean shake;

  int trackNumber;

  boolean inputBlockedUI;
  boolean inputtingCode;
  boolean correctCode;
  boolean selectKey;

  String code = "";

  int codeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
    trackNumber = 1;

    codeLength = 9;
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
      if (inputtingCode && inputBlockedUI && code.length() == codeLength)
      {
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
        megalovania.setGain(0);
        if (!megalovania.isPlaying())
        {
          megalovania.play();
          megalovania.rewind();
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
        selectKey = true;
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
        if (code.equals("wwssadadkl") && inputtingCode)
        {
          code = code.substring(0, code.length()-code.length());
          if (trackNumber == 1)
            trackNumber = 2;
          else if (trackNumber == 2)
            trackNumber = 1;
        } else
        {
          code = code.substring(0, code.length()-code.length());
        }
        break;

      case ENTER:
        code = code.substring(0, code.length()-code.length());
        if (inputtingCode)
        {
          code = code.substring(0, code.length()-code.length());
          trackNumber = 2;
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
      if (code.length() > codeLength - 1)
        code = code.substring(0, code.length() - (code.length() - codeLength));

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
