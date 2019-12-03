class LevelManager
{
  int lvlNum = 0;
  Level1 lvl1 = new Level1();
  Level2 lvl2 = new Level2();

  void setup()
  {
    lvl1.setup();
    lvl2.setup();
  }

  void draw()
  {
    switch(lvlNum){
      case 1:
        lvl1.draw();
        break;
      case 2:
        lvl2.draw();
        break;
    }
  }
}
