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

  int itemPriceCurrent, itemPriceBase;
  int totalShopItems;

  boolean shopA = false;
  boolean shopItemsHaveSpawned = false;


  Shop() 
  {
    item1Pos=new PVector();
    item2Pos=new PVector();
    item3Pos=new PVector();

    item1Pos.x=width/2-100;
    item1Pos.y=height/2+50;
    item2Pos.x=width/2;
    item2Pos.y=height/2+50;
    item3Pos.x=width/2+100;
    item3Pos.y=height/2+50;

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

          if (!shopItemsHaveSpawned)
            SpawnItems();
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

    shopItemsHaveSpawned = false;
  }



  void SpawnItems() {

    GameObjectRef.Add(new Powerups(item1Pos.x, item1Pos.y));
    GameObjectRef.Add(new Powerups(item2Pos.x, item2Pos.y));
    GameObjectRef.Add(new Powerups(item3Pos.x, item3Pos.y));
    shopItemsHaveSpawned = true;
  }


  void ResetPrices()
  {
    if (msql.connect())
    {
      msql.query("SELECT COUNT(DISTINCT idItem) FROM Items");

      while (msql.next())
      {
        totalShopItems = parseInt(msql.getString("COUNT(DISTINCT idItem)"));
      }

      for (int i = 0; i < totalShopItems; i++)
      {
        msql.query("SELECT priceItemBase FROM Items WHERE idItem = '%s'", i);
        while (msql.next())
        {
          itemPriceBase = parseInt(msql.getString("priceItemBase"));



          //THIS QUERY DOESNT WORK BECAUSE IT NEEDS TO !!!NOT!!! BE ITEMPRICE
          //msql.query( "SELECT u.itemBought FROM User_has_Items u WHERE User_idUser = '%s' AND Items_idItem = '%s'", User.currentUser, itemPriceCurrent );
        }
        //UPDATE CURRENT ITEM PRICE TO MATCH WAVE NUMBER
        msql.query("UPDATE Items SET priceItemCurrent = '%s' WHERE idItem = '%s'", itemPriceBase, i);
      }
    }
  }




  void UpdatePrices()
  {
    if (msql.connect())
    {
      msql.query("SELECT COUNT(DISTINCT idItem) FROM Items");

      while (msql.next())
      {
        totalShopItems = parseInt(msql.getString("COUNT(DISTINCT idItem)"));
      }

      for (int i = 0; i < totalShopItems; i++)
      {
        msql.query("SELECT priceItemBase FROM Items WHERE idItem = '%s'", i);
        while (msql.next())
        {
          itemPriceCurrent = parseInt(msql.getString("priceItemBase")) * spawn.wave;
        }
        //UPDATE CURRENT ITEM PRICE TO MATCH WAVE NUMBER
        msql.query("UPDATE Items SET priceItemCurrent = '%s' WHERE idItem = '%s'", itemPriceCurrent, i);
      }
    }
  }
}
