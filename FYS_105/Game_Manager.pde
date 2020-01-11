class Game_Manager {
  boolean login;
  boolean dead;
  boolean home;
  boolean hscore;
  boolean shake;

  int trackNumber;

  boolean codeInput;
  boolean inputBlocked;
  int codeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
    trackNumber = 2;

    inputBlocked = false;
    codeInput = false;  
    codeLength = 10;
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
      if (codeInput)
      {
        image(codeInputBox, width/2 - codeInputBox.width/2, height/2 - codeInputBox.height/2);
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
    if (home && !inputBlocked) {
      UI.keyPressed();
    }

    //if (codeInput)
    //{
    //  if (key == 'r')
    //  {
    //    inputBlocked = false;
    //    codeInput = false;
    //    clear();
    //  }

    //  if (key == 'w' || key == 's' || key == 'a' || key == 'd' || key == UP || key == DOWN || key == LEFT || key == RIGHT)
    //  {
    //    //PLACE A BIG ASTERISK IN TEXT BOX
    //    pushStyle();
    //    textSize(80);
    //    text("*", 10, 10);
    //    popStyle();
    //  }
    //}
    //if (!codeInput)
    //  if (key == 'r')
    //  {
    //    inputBlocked = true;
    //    codeInput = true;
    //  }
  }
  void keyReleased() {
    if (game) {
      myPlayer.keyReleased();
    }
  }
}
