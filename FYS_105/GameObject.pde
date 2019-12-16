public class GameObject {


  ArrayList<GameObject> gameObject = new ArrayList();

  float cooldown, threshold;

  boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;

  boolean lookingUp, lookingLeft, lookingRight = false;
  boolean lookingDown = true;
  boolean shootingUp, shootingDown, shootingLeft, shootingRight;

  String tag;

  float bulletPosX, bulletPosY, bulletWidth, bulletHeight;
  float enemyPosX, enemyPosY, enemyW, enemyH, enemyHP, enemySpeedX, enemySpeedY;
  float playerPosX, playerPosY, moveVelX, moveVelY, playerWidth, playerHeight, hp;
  float defaultSpeed = 5;
  float diaSpeed = (sqrt(pow(defaultSpeed, 2) + pow(defaultSpeed, 2)) / 2); //hij kiest twee punten op het veld om de diagonale snelheid te berekenen.




  GameObject() 
  {

    //for(int i = 0; i < gameObject.size(); i ++)
    //{
    //  GameObject gameobject = new GameObject();
    //}
  }


  void draw()
  {    
    drawObjects();
    //println("I have been drawn");


  }//enemyUpdate

  boolean Dead() {
    return false;
  }

  void Add(GameObject object)
  {
    GameObjectRef.gameObject.add(object); 
    println("A new object has been created");
    println(GameObjectRef.gameObject.size());
  }

  void Remove(GameObject object)
  {
    GameObjectRef.gameObject.remove(object);
  }

  void drawObjects() {
    //println(gameObject.size());

    for (GameObject object : GameObjectRef.gameObject) {
      println("2");
      object.draw();
    }
  }
}
