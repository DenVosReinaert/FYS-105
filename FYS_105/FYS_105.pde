ArrayList<GameObject> engine;
boolean wkey, akey, skey, dkey, spacekey, onekey, twokey, threekey, upkey;

boolean lookingDown, lookingLeft, lookingRight = false;
boolean lookingUp = true;

Player myPlayer;
Gun myGun;

int timer = 0;

void setup(){
  size(1280, 720);
  engine = new ArrayList<GameObject>(10000);
  myPlayer = new Player();
  engine.add(myPlayer);
  
  rectMode(CENTER);
}

void draw() {
  background(0, 0, 0);
  timer = timer + 1;
  
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
    lookingLeft = true;
    lookingUp = false;
    lookingRight = false;
    lookingDown = false;
  }
  if (key == 's') {
    skey = true;
    lookingLeft = false;
    lookingUp = false;
    lookingRight = false;
    lookingDown = true;
  }
  if (key == 'd') {
    dkey = true;
    lookingLeft = false;
    lookingUp = false;
    lookingRight = true;
    lookingDown = false;
  }
  if (key == 'w') {
    wkey = true;
    lookingLeft = false;
    lookingUp = true;
    lookingRight = false;
    lookingDown = false;
  }
  
  if (key == 'i') upkey = true;
  if (key == ' ') spacekey = true;
  if (key == '1') onekey = true;
  if (key == '2') twokey = true;
  if (key == '3') threekey = true;
}

void keyReleased() {
  if (key == 'a') akey = false;
  if (key == 's') skey = false;
  if (key == 'd') dkey = false;
  if (key == 'w') wkey = false;
  if (key == ' ') spacekey = false;
  if (key == '1') onekey = true;
  if (key == '2') twokey = true;
  if (key == '3') threekey = true;

}
