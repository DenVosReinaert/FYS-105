class Player
{
  float sizeX, sizeY, jumpForce;
  float playerPosX, playerPosY, playerVelX, gravity, playerGrav;
  boolean left, right, jump;

  Player() 
  {
    sizeX = 60;
    sizeY = 80;

    playerPosX = width/2 - sizeX/2;
    playerPosY = height-height/12 - sizeY;

    playerVelX = 5;
    gravity = 1.1;

    playerPosY -= jumpForce;
    jumpForce = 30;
  }


  void draw()
  {
    jumpForce /= gravity;
    playerPosY -= jumpForce;
    playerPosY += playerGrav;
    playerGrav *= gravity;



    if (isGrounded())
    {
      playerGrav = 0;
      jumpForce = 0;
    } else playerGrav = 3;

    if(keyPressed)
    setMove(keyCode, true);

    if (playerPosY > (vHoogte - sizeY)) {
      playerPosY = vHoogte - sizeY;
      jumpForce = 0;
      playerGrav = 0;
    }


    noStroke();
    fill(255, 0, 0);
    rect(playerPosX, playerPosY, sizeX, sizeY);


    //KeyPressed
      if (left)
      {
        playerPosX -= playerVelX;
      }


      if (right)
      {
        playerPosX += playerVelX;
      }


      if (jump && isGrounded())
      {
        jumpForce = 30;
        playerGrav = 3;
      }
  }


  boolean isGrounded()
  {
    if (playerPosY + sizeY >= vHoogte)
      return true;
    else if (platform.playerOnPlatform)
      return true;
    else return false;
  }
//For list of keyCodes:
//http://gcctech.org/csc/javascript/javascript_keycodes.htm
  boolean setMove(int keycode, boolean move)
  {
    if (keycode == LEFT)
    {
      return left = move;
    }
    else 
    if ( keycode == RIGHT)
    {
    return right = move;
    }
    else
    //32 == SPACEBAR
    if( keycode == UP)
    {
    return jump = move;
    }
    else
      return move;
  }
  
  void keyReleased()
  {
    setMove(keyCode, false);
  }
}
