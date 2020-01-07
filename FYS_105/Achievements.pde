class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;


  Achievements()
  {
    msql.connect();

    msql.query("SELECT counterAchievements FROM Achievements WHERE idAchievements = '%s'", 3);
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
      msql.query("UPDATE Achievements SET collectedAchievements = '%s' WHERE collectedAchievements = '1'", chieveFalse);

    if (msql.connect())
      msql.query("UPDATE Achievements SET counterAchievements = '%s'", 0);
  }
}
