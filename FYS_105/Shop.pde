class Shop {

  float cartW = 300;
  float cartH = 200;

  float cartPosX ;
  float cartPosY ;

  float beginPosX=-100;
  float beginPosY=height/2;

  float endPosX=width/2 +150;
  float endPosY = height/2; 

  PVector item1Pos;
  PVector item2Pos;
  PVector item3Pos;

  boolean shopA = false;

  Shop() 
  {
    item1Pos=new PVector();
    item2Pos=new PVector();
    item3Pos=new PVector();

    item1Pos.x=width/2-100;
    item1Pos.y=height/2-150;
    item2Pos.x=width/2;
    item2Pos.y=height/2-150;
    item3Pos.x=width/2+100;
    item3Pos.y=height/2-150;

    cartPosX=beginPosX;
    cartPosY=beginPosY;

    Reset();
  }


  void draw() 
  {
    if (game)
    {
      if (endPosX - cartPosX>=0) 
      {
        println(dist(cartPosX, cartPosY, endPosX, endPosY));
        cartPosX+=3;
        if (gamemngr.trackNumber == 4) 
        {
          shopcartSansGarfield.draw(cartPosX - cartW, cartPosY - cartH);
          shopcartSansGarfield.update();

          garfieldSans.setGain(50);
          garfieldSans.play();
          garfieldSans.rewind();
        } else 
        {
          shopcart.draw(cartPosX-cartW, cartPosY-cartH);
          shopcart.update();

          garfield.setGain(50);
          garfield.play();
          garfield.rewind();
        }
        cartdirt.draw(cartPosX-cartW, cartPosY-cartH);
        cartdirt.update();
      } else 
      {
        if (gamemngr.trackNumber == 4) {
          shopcartSansGarfieldStationary.update();
          shopcartSansGarfieldStationary.draw(cartPosX - cartW, cartPosY - cartH);
        } else
        {
          stationaryShopcart.update();
          stationaryShopcart.draw(cartPosX-cartW, cartPosY-cartH);
        }
      }
    }
  }

  void Reset()
  {
    cartPosX = beginPosX;
    garfield.pause();      //Reset shop sound
    garfield.rewind();
    garfieldSans.pause();
    garfieldSans.rewind();
  }
}
