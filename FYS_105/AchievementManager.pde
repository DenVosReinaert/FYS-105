class AchievementManager
{


  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements, progression, progressionCurrent;
  String tempId, dbDupeInsertCheck;

  float startPosX, startPosY, endPosX, endPosY;

  float[] currentPosX = new float[totalAchievements];
  float[] currentPosY = new float[totalAchievements];

  int[] oldschoolTimer = new int[totalAchievements];

  //boolean[] achievementAnim = new boolean[totalAchievements];


  ArrayList<AchievementAnimator> achievementAnim = new ArrayList<AchievementAnimator>();



  AchievementManager()
  {
    totalAchievements = 6;

    msql.connect();
    achievementAnimsActive = 0;
  }





  void draw()
  {
    for (int i = 0; i < achievementAnim.size(); i++)
    {
      achievementAnim.get(i).draw();
    }

    startPosX = width;
    startPosY = height - chievePlate[1].height - (chievePlate[1].height * achievementAnimsActive);

    endPosX = width - chievePlate[1].width;
    endPosY = startPosY;
  }


  void AddAchievementProgress(int achievementNumber, int progressionGoal)
  {
    if (msql.connect()) 
    {
      msql.query( "SELECT Achievements_idAchievements FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while ( msql.next() ) 
      {
        dbDupeInsertCheck = msql.getString("Achievements_idAchievements");
      }

      if (dbDupeInsertCheck == null)
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 0, 0);
      }


      msql.query( "SELECT progressionAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while (msql.next() ) 
      {
        progression = parseInt(msql.getString("progressionAchievement"));
      }

      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber);
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }


      if (progression < progressionGoal)
        msql.query("UPDATE User_has_Achievements SET progressionAchievement = '%s' WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s' AND collectedAchievement = '%s'", progression + 1, User.currentUser, achievementNumber, achieved);


      if (achieved != 1 && progression == progressionGoal)
      {
        msql.query("UPDATE User_has_Achievements SET collectedAchievement = '%s' WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s' AND progressionAchievement = '%s'", 1, User.currentUser, achievementNumber, progressionGoal);

        achievement.play();
        achievement.rewind();

        achievementAnim.add(new AchievementAnimator(achievementNumber, startPosX, startPosY));
      }
    }
  }
}
