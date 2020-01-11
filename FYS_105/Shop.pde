class Shop  {

  float cartW = 300;
  float cartH = 200;
  float cartX = - 100;
  float cartY = height/2;
  float stopP = width/2 + 150;
  PVector item1Pos;
  PVector item2Pos;
  PVector item3Pos;
  boolean shopA = false;

  Shop() {
    item1Pos=new PVector();
    item2Pos=new PVector();
    item3Pos=new PVector();
    item1Pos.x=width/2-100;
    item1Pos.y=height/2-150;
    item2Pos.x=width/2;
    item2Pos.y=height/2-150;
    item3Pos.x=width/2+100;
    item3Pos.y=height/2-150;
  }

  void draw() {
    if (game) {
      if (cartX > stopP && cartX < stopP + 10) {
        if (gamemngr.trackNumber !=4)
        {
          stationaryShopcart.update();
          stationaryShopcart.draw(cartX-cartW, cartY-cartH);
        } else if (gamemngr.trackNumber == 4)
        {
          shopcartSansGarfieldStationary.update();
          shopcartSansGarfieldStationary.draw(cartX - cartW, cartY - cartH);
        }
      }
      if (!(cartX > stopP && cartX < stopP + 10)) {
        if (gamemngr.trackNumber !=4)
        {
          shopcart.draw(cartX-cartW, cartY-cartH);
          shopcart.update();
          cartX = cartX + 3;
          cartdirt.draw(cartX-cartW, cartY-cartH);
          cartdirt.update();

          garfield.setGain(10);
          garfield.play();
          garfield.rewind();
          GameObjectRef.Add(new Powerups(item1Pos.x,item1Pos.y));
          GameObjectRef.Add(new Powerups(item2Pos.x,item2Pos.y));
          GameObjectRef.Add(new Powerups(item3Pos.x,item3Pos.y));
        } else if (gamemngr.trackNumber == 4)
        {
          shopcartSansGarfield.draw(cartX - cartW, cartY - cartH);
          shopcartSansGarfield.update();
          cartX = cartX + 3;
          cartdirt.draw(cartX-cartW, cartY-cartH);
          cartdirt.update();

          garfieldSans.setGain(50);
          garfieldSans.play();
          garfieldSans.rewind();
        }
      }
    }
  }
}
