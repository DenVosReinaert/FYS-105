class BulletEngine {
  ArrayList<GameObject> engine;

  boolean wkey, akey, skey, dkey, onekey, twokey, threekey, upkey;

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
      akey = true;
    }
    if (key == 's') {
      skey = true;
    }
    if (key == 'd') {
      dkey = true;
    }
    if (key == 'w') {
      wkey = true;
    }
    if (keyCode  == UP) {
     lookingUp = true;
     lookingDown = false;
     lookingLeft = false;
     lookingRight = false;
    }
    if (keyCode == DOWN) {
     lookingDown = true;
     lookingUp = false;
     lookingRight = false;
     lookingLeft = false;
    }
    if (keyCode == RIGHT) {
     lookingRight = true;
     lookingLeft = false;
     lookingUp = false;
     lookingDown = false;
    }
    if (keyCode == LEFT) {
     lookingLeft = true;
     lookingRight = false;
     lookingUp = false;
     lookingDown = false;
    }
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
  }

  void keyReleased() {
    if (key == 'a') akey = false;
    if (key == 's') skey = false;
    if (key == 'd') dkey = false;
    if (key == 'w') wkey = false;
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
    if (keyCode == UP) lookingUp = false;
    if (keyCode == DOWN) lookingDown = false;
    if (keyCode == LEFT) lookingLeft = false;
    if (keyCode == RIGHT) lookingRight = false;
  }
}
