class Level1
{
  int pillarCount = 4;
  int pillarInterval = 200;
  Pillar[] pillars = new Pillar[pillarCount];


  void setup()
  {
  }


  void draw()
  {
    if (gamemngr.shake) {
      gamemngr.screenShake();
    }
    image(background, 0, 0);

    for (int i = 0; i < pillarCount; i++)
    {
      pillars[i] = new Pillar();
      pillars[i].draw(300 + i * pillarInterval + pillars[i].pillarWidth * i, 100);
    }

    for (int j = 0; j < pillarCount; j++)
    {
      pillars[j] = new Pillar();
      pillars[j].draw(300 + j * pillarInterval + pillars[j].pillarWidth * j, 400);
    }
  }
}
