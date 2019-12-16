class BulletEngine {
  ArrayList<GameObject> engine;
  boolean wKey, aKey, sKey, dKey, spacekey, oneKey, twoKey, threeKey;
  boolean shootingDown, shootingLeft, shootingRight, shootingUp;
  boolean lookingDown, lookingLeft, lookingRight = false;
  boolean lookingUp = true;

  BulletEngine() {
    engine = new ArrayList<GameObject>(20);
    engine.add(myPlayer);
    rectMode(CENTER);
  }

  void draw() {

    int i = engine.size() - 1;
    while (i >= 0) {
      GameObject thing = engine.get(i);
      thing.show();
      thing.act();
      if (thing.hasDied()) {
        engine.remove(i);
      }
      i--;
    }
  }

  void keyPressed() {
    if (key == 'a') {
      aKey = true;
    }
    if (key == 's') {
      sKey = true;
    }
    if (key == 'd') {
      dKey = true;
    }
    if (key == 'w') {
      wKey = true;
    }
    if (key == ' ') spacekey = true;
    if (key == '1') oneKey = true;
    if (key == '2') twoKey = true;
    if (key == '3') threeKey = true;

//for shooting in different directions  
  if (keyCode == LEFT) {
    shootingLeft = true;
    shootingUp = false;
    shootingRight = false;
    shootingDown = false;
  } else if (keyCode == DOWN) {
    shootingLeft = false;
    shootingUp = false;
    shootingRight = false;
    shootingDown = true;
  } else if (keyCode == RIGHT) { 
    shootingLeft = false;
    shootingUp = false;
    shootingRight = true;
    shootingLeft = false;
  } else if (keyCode == UP) {
    shootingLeft = false;
    shootingUp = true;
    shootingRight = false;
    shootingDown = false;
  }
//looking for the sprites
    if (keyCode == LEFT) {
    lookingLeft = true;
    lookingUp = false;
    lookingRight = false;
    lookingDown = false;
  } else if (keyCode == DOWN) {
    lookingLeft = false;
    lookingUp = false;
    lookingRight = false;
    lookingDown = true;
  } else if (keyCode == RIGHT) { 
    lookingLeft = false;
    lookingUp = false;
    lookingRight = true;
    lookingLeft = false;
  } else if (keyCode == UP) {
    lookingLeft = false;
    lookingUp = true;
    lookingRight = false;
    lookingDown = false;
  }
}
void keyReleased() {
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  if (key == 'w') wKey = false;
  if (key == ' ') spacekey = false;
  if (key == '1') oneKey = true;
  if (key == '2') twoKey = true;
  if (key == '3') threeKey = true;
  if (keyCode == UP) shootingUp = false;
  if (keyCode == LEFT) shootingLeft = false;
  if (keyCode == RIGHT) shootingRight = false;
  if (keyCode == DOWN) shootingDown = false;
}
}
