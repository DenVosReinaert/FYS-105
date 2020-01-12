public class GameObject {

  ArrayList<GameObject> gameObject = new ArrayList();
  String tag;


  PVector spawnerPos0, spawnerPos1, spawnerPos2, spawnerPos3;


  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;
  boolean lookingUp, lookingLeft, lookingRight, lookingDown = true;
  boolean shootingUp, shootingDown, shootingLeft, shootingRight;
  boolean collLeft, collRight, collTop, collBott;


  float dx, dy, dir, dxA, dyA;
  float angleBetweenVector;
  PVector enemyVector, playerVector;

  float objPosX, objPosY, objWidth, objHeight;
  float tempObjPosX, tempObjPosY;
  float scorePopUp, scorePopUpAlpha;

  float moveVelX, moveVelY;

  float defaultSpeed, defaultSpeedInit, diaSpeed, diaSpeedInit;

  float knockback;
  float hp, hpBarTotal, hpBarTotalInit;
  float cooldown, threshold;


  float scoreGain;

  float powerUpChance;
  //float speedUpX, speedUpY, speedUpDia;
  //float healthUpX, healthUpY, healthUpDia;
  //float shieldX, shieldY, shieldDia, shieldOnPlayerDia;
  //float normalSpeed, bonusSpeed;

  float tileSize;

  int[] idAchievement = new int[5];





  GameObject() 
  {

    spawnerPos0 = new PVector();
    spawnerPos1 = new PVector();
    spawnerPos2 = new PVector();
    spawnerPos3 = new PVector();
    //for(int i = 0; i < gameObject.size(); i ++)
    //{
    //  GameObject gameobject = new GameObject();
    //}
  }


  void draw()
  {    
    noStroke();
    //println("I have been drawn");

    tileSize = 100;
  }//enemyUpdate

  boolean Dead() {
    return false;
  }

  void Add(GameObject object)
  {
    GameObjectRef.gameObject.add(object); 
    println("A new object has been created");
  }

  void Remove(GameObject object)
  {
    GameObjectRef.gameObject.remove(object);
  }

  void drawObjects() {
    //println(gameObject);

    for (int i = 0; i < gameObject.size(); i++) {
      gameObject.get(i).draw();
    }
  }
}
