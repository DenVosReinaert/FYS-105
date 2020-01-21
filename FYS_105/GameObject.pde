public class GameObject {

  ArrayList<GameObject> gameObject = new ArrayList();                                                      //List of all GameObject instances
  String tag;                                                                                              //Recognition tag


  PVector spawnerPos0, spawnerPos1, spawnerPos2, spawnerPos3;


  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;
  boolean lookingUp, lookingLeft, lookingRight, lookingDown = true;
  boolean shootingUp, shootingDown, shootingLeft, shootingRight;
  boolean collLeft, collRight, collTop, collBott;


  float dx, dy, dir, dxA, dyA;
  float angleBetweenVector;
  PVector enemyVector, playerVector;

  int totalEnemyCount;

  float objPosX, objPosY, objWidth, objHeight;                                                             //Object positioning and dimensions
  float tempObjPosX, tempObjPosY;                                                                          //Temporary object position in case of "homing" projectiles for example
  float scorePopUp, scorePopUpAlpha;

  float moveVelX, moveVelY;

  float defaultSpeed, defaultSpeedInit, diaSpeed, diaSpeedInit;

  float knockback;
  float hp, hpBarTotal, hpBarTotalInit;


  float scoreGain;

  float powerUpChance;

  int shopItemNumber, itemPrice;

  float tileSize;

  int[] idAchievement = new int[5];





  GameObject() 
  {
    spawnerPos0 = new PVector();                                                                           //Initializing of the spawner position vectors
    spawnerPos1 = new PVector();
    spawnerPos2 = new PVector();
    spawnerPos3 = new PVector();
  }


  void draw()
  {    
  }

  void Add(GameObject object)                                                                             //Instantiate the given object in the gameObject list
  {
    GameObjectRef.gameObject.add(object); 
  }

  void Remove(GameObject object)                                                                          //Remove the instance of the given object from the gameObject list
  {
    GameObjectRef.gameObject.remove(object);
  }

  void drawObjects()
  {                                                                                    //Run the draw function of each instance in the gameObject list
    for (int i = 0; i < gameObject.size(); i++) {
      gameObject.get(i).draw();
    }
  }
}
