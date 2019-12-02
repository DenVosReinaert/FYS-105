class Player
{
  float playerPosX, playerPosY, playerWidth, playerHeight;
  
  
  void setup()
  {
    playerWidth = 16;
    playerHeight = 20;
    
    playerPosX = width/2;
    playerPosY = height/2;
  }
  
  
  void draw()
  {
        
    fill(0);
    rect(playerPosX, playerPosY, playerWidth, playerHeight);
    
    if(keyPressed && keyCode == LEFT)
    {
      playerPosX += -2;
    }
    else if (keyPressed && keyCode == RIGHT)
    {
     playerPosX += 2; 
    }
    else if (keyPressed && keyCode == UP)
    {
     playerPosY += -2; 
    }
    else if (keyPressed && keyCode == DOWN)
    {
     playerPosY += 2; 
    }

  }
  
}
