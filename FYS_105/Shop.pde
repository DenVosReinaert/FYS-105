class Shop {

  float cartW = 300;
  float cartH = 200;
  float cartX = - 100;
  float cartY = height/2;
  float stopP = width/2 + 150;
  boolean shopA = false;

  Shop() {
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
