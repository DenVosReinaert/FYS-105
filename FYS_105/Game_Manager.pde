class Game_Manager {
  boolean login;
  boolean dead;
  boolean home;
  boolean hscore;
  boolean shake;

  boolean codeInput;
  int codeLength;
  int hscoreA;
  int shakeAmount;
  float comboMultiplier = 0.25;

  Timer secretCodeTimer = new Timer(2);


  Game_Manager() 
  {
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

      gameMusic.setGain(0);
      if (!gameMusic.isPlaying()) {
        gameMusic.play();
        gameMusic.rewind();
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
    if (home && !codeInput) {
      UI.keyPressed();
    }

    if (codeInput)
    {
      if (key == 'r')
      {
        codeInput = false;
        clear();
      }

      if (key == 'w' || key == 's' || key == 'a' || key == 'd' || key == UP || key == DOWN || key == LEFT || key == RIGHT)
      {
        //PLACE A BIG ASTERISK IN TEXT BOX
        pushStyle();
        textSize(80);
        text("*", 10, 10);
        popStyle();
      }
    }
    if (!codeInput)
      if (key == 'r')
      {
        codeInput = true;
      }
  }
  void keyReleased() {
    if (game) {
      myPlayer.keyReleased();
    }
  }
}
