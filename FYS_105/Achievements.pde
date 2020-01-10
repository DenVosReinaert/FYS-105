class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;




  Achievements()
  {
    msql.connect();


    println(bossCounter);
  }




  void draw()
  {
    msql.query("SELECT counterAchievements FROM Achievements INNER JOIN User_has_Achievements WHERE idAchievements = '%s', idUser = '%s'", 3, user.currentUser);
    while (msql.next())
    {
      bossCounter = parseInt(msql.getString("counter"));
    }
  }






  void ChieveReset()
  {
    if (msql.connect())
      msql.query("UPDATE Achievements  SET collectedAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE collectedAchievements = '1', idUser = '%s'", chieveFalse, user.currentUser);

    if (msql.connect())
      msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE idUser = '%s'", 0, user.currentUser);
  }
}
