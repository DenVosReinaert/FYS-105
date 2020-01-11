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
          stationaryShopcart.update();
          stationaryShopcart.draw(cartX-cartW, cartY-cartH);
      }
      if (!(cartX > stopP && cartX < stopP + 10)) {
          shopcart.draw(cartX-cartW, cartY-cartH);
          shopcart.update();
          cartX = cartX + 3;
          cartdirt.draw(cartX-cartW, cartY-cartH);
        cartdirt.update();
        garfield.setGain(10);
        garfield.play();
        garfield.rewind();
      }
    }
  }
}
