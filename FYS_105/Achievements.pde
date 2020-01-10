class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;

  int idAchievement;
  String tempId;

  Achievements()
  {
    msql.connect();

    AddChieveToTable(3);
    UnlockAchievement(3);

    println(bossCounter);
  }




  void draw()
  {
    //msql.query("SELECT SUM(idAchievements) FROM Achievements");
    //while (msql.next())
    //{
    //  totalAchievements = parseInt(msql.getString("SUM(idAchievements)"));

    //}

    msql.query("SELECT counterAchievements FROM Achievements INNER JOIN User_has_Achievements WHERE Achievements_idAchievements = '%s', User_idUser = '%s'", idAchievement, User.currentUser);
    while (msql.next())
    {
      bossCounter = parseInt(msql.getString("counterAchievements"));
    }
  }






  //void ChieveReset()
  //{
  //  if (msql.connect())
  //    msql.query("UPDATE Achievements  SET collectedAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE collectedAchievements = '1', User_idUser = '%s'", chieveFalse, User.currentUser);

  //  if (msql.connect())
  //    msql.query("UPDATE Achievements SET counterAchievements = '%s' FROM Achievements INNER JOIN User_has_Achievements WHERE User_idUser = '%s'", 0, User.currentUser);
  //}



  void AddChieveToTable(int achievementNumber)
  {
    msql.query("SELECT Achievements_idAchievements FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber);
    while (msql.next())
    {
      tempId = msql.getString("idAchievement");
      if (tempId == null)
      {
        msql.query("INSERT INTO User_has_Acievements (User_idUser, Achievements_idAchievements) VALUES ('%s','%s')", User.currentUser, idAchievement);
      }
    }
  }


  void UnlockAchievement(int achievementNumber)
  {
    msql.query("SELECT collectedAchievements FROM Achievements INNER JOIN User_has_Achievements WHERE idAchievements = '%s' AND User_idUser = '%s' AND collectedAchievements = '0'", achievementNumber, User.currentUser);
    while (msql.next())
    {
      msql.query("UPDATE Achievements SET collectedAchievements = '1' FROM User_has_Achievements WHERE User_idUser = '%s'", User.currentUser);
    }
  }
}
