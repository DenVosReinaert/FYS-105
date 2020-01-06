class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;


  Achievements()
  {
    msql.connect();

    msql.query("SELECT counter FROM Achievements WHERE id = '%s'", 3);
    while (msql.next())
    {
      bossCounter = parseInt(msql.getString("counter"));
    }

    println(bossCounter);
  }

  void draw()
  {
  }






  void ChieveReset()
  {
    if (msql.connect())
      msql.query("UPDATE Achievements SET collected = '%s' WHERE collected = '1'", chieveFalse);

    if (msql.connect())
      msql.query("UPDATE Achievements SET counter = '%s'", 0);
  }
}
