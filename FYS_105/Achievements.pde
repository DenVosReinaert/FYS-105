class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;

  int totalAchievements;


  Achievements()
  {
    msql.connect();


    println(bossCounter);
  }




  void draw()
  {
    msql.query("SELECT SUM(idAchievements) FROM Achievements");
    while (msql.next())
    {
      totalAchievements = parseInt(msql.getString("SUM(idAchievements)"));
      msql.query( "INSERT INTO User_has_Acievements (User_idUser, Achievements_idAchievements) VALUES ('%s','%s')", User.currentUser, totalAchievements);
    }

    msql.query("SELECT counterAchievements FROM Achievements INNER JOIN User_has_Achievements WHERE Achievements_idAchievements = '%s', User_idUser = '%s'", 3, User.currentUser);
    while (msql.next())
    {
      bossCounter = parseInt(msql.getString("counterAchievements"));
    }
  }






  void ChieveReset()
  {
    if (msql.connect())
      msql.query("UPDATE Achievements  SET collectedAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE collectedAchievements = '1', User_idUser = '%s'", chieveFalse, User.currentUser);

    if (msql.connect())
      msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE User_idUser = '%s'", 0, User.currentUser);
  }
}
