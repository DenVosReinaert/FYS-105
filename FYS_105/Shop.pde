class Shop {

  float cartW = 300;
  float cartH = 200;
  float cartX ;
  float cartY ;
  float beginPosX=-100;
  float beginPosY=height/2;
  float endPosX=width/2 +150;;
  float endPosY; 
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
    cartX=beginPosX;
    cartY=beginPosY;
  }

  void draw() {
    if (game) {
      if(dist(cartX, cartY,endPosX,endPosY)>=0){
      cartX+=3;
      if(gamemngr.trackNumber ==4){
      shopcart.draw(cartX-cartW, cartY-cartH);
          shopcart.update();
      }else{
        shopcartSansGarfield.draw(cartX - cartW, cartY - cartH);
        shopcartSansGarfield.update(); 
      }
          cartdirt.draw(cartX-cartW, cartY-cartH);
          cartdirt.update();
      }else{
        if(gamemngr.trackNumber ==4){
      shopcartSansGarfieldStationary.update();
      shopcartSansGarfieldStationary.draw(cartX - cartW, cartY - cartH);
       garfieldSans.setGain(50);
       garfieldSans.play();
       garfieldSans.rewind();
      }else{
        stationaryShopcart.update();
        stationaryShopcart.draw(cartX-cartW, cartY-cartH);
      }  
      }
    
    }
  }
}
