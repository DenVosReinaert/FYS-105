class Achievements
{
  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;

  int idAchievement, achieved;
  String tempId;

  Achievements()
  {
    msql.connect();

    //AddChieveToTable(3);
    UnlockAchievement(3);

    //println(bossCounter);
  }




  void draw()
  {
    msql.query("SELECT counterAchievements FROM Achievements INNER JOIN User_has_Achievements ON User_has_Achievements.Achievements_idAchievements = Achievements.idAchievements WHERE Achievements_idAchievements = '%s', User_idUser = '%s'", idAchievement, User.currentUser);
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



  //void AddChieveToTable(int achievementNumber)
  //{
  //  msql.query("SELECT Achievements_idAchievements FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber);
  //  while (msql.next())
  //  {
  //    tempId = msql.getString("idAchievement");
  //    if (tempId == null)
  //    {
  //      msql.query("INSERT INTO User_has_Acievements (User_idUser, Achievements_idAchievements) VALUES ('%s','%s')", User.currentUser, idAchievement);
  //    }
  //  }
  //}


  void UnlockAchievement(int achievementNumber)
  {
    //if (msql.connect())
    //{
    //  msql.query("SELECT a.collectedAchievements, u.User_idUser FROM Achievements a INNER JOIN User_has_Achievements u ON u.User_idUser = '%s' AND a.idAchievements = u.Achievements_idAchievements WHERE a.collectedAchievements = '0' AND a.idAchievements = '%s'", User.currentUser, achievementNumber);
    //  while (msql.next())
    //  {
    //    msql.query("UPDATE Achievements SET a.collectedAchievements = '1' FROM Achievements a INNER JOIN User_has_Achievements u ON u.User_idUser = '%s'", User.currentUser);
    //    println("YOU UNLOCKED ACHIEVEMENT:" + achievementNumber);
    //  }
    //}


    if (msql.connect())
    {
      if (msql.connect()) 
      {
        msql.query( "SELECT collectedAchievements FROM User_has_Achievements WHERE Use_idUser = '%s' AND idAchievements = '%s'", User.currentUser, achievementNumber );
        while (msql.next() ) 
        {
          achieved = parseInt(msql.getString("collectedAchievements"));
        }
        if (achieved != 1) 
        {
          //println( User.currentUser + " heeft achievement" + achievementNumber + " behaald!");
          msql.query("INSERT INTO User_has_Achievement (User_idUser, Achievement_idAchievements, collectedAchievements) VALUES ('%s','%s','%s')", User.currentUser, achievementNumber, achieved);
          //dbAchieved.clear();
          //GetAchieved();
        }
      }
    }
  }
}

//"SELECT a.collectedAchievements, u.User_idUser FROM Achievements a INNER JOIN User_has_Achievements u ON a.idAchievements = u.Achievements_idAchievements WHERE a.collectedAchievements = '0' AND a.idAchievement = '%s' AND u.User_idUser = '%s'", achievementNumber, User.currentUser
