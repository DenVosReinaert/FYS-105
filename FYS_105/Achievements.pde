class Achievements
{

  Timer[] achievementRetractTimer;

  int[] achievementsActive;

  int chieveFalse = 0;
  int collected; //Current 
  int bossCounter;

  int idAchievement, achieved;
  String tempId;



  Achievements()
  {
    msql.connect();
  }



  void draw()
  {
    for (int i = 0; i < achievementRetractTimer.length; i++)
    {
      achievementRetractTimer[i] = new Timer(10);
    }
  }



  void UnlockAchievement(int achievementNumber)
  {
    println(User.currentUser);

    if (msql.connect()) 
    {
      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }
      if (achieved != 1) 
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement) VALUES ('%s','%s','%s')", User.currentUser, achievementNumber, 1);
        achievement.play();
        achievement.rewind();
      }
    }

    //achievementRetractTimer.length++;
  }
}
