class Shop {

  float cartW = 300;
  float cartH = 200;
  float cartX = - 100;
  float cartY = height/2;
  float stopP = width/2 + 150;

  Shop() {
  }

  void draw() {
    if (game) {
      if (cartX > stopP && cartX < stopP + 10) {
        cartdirt.draw(cartX-cartW, cartY-cartH);
        cartdirt.update();
      }
      shopcart.draw(cartX-cartW, cartY-cartH);
      shopcart.update();
      if (!(cartX > stopP && cartX < stopP + 10)) {
        cartX = cartX + 3;
      }
    }
  }
}
