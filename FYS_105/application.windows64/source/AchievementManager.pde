class AchievementManager
{


  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements;
  String tempId;

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



  void UnlockAchievement(int achievementNumber)
  {

    if (msql.connect()) 
    {
      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }
      if (achieved != 1) 
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 1, 0);
        achievement.play();
        achievement.rewind();

        achievementAnim.add(new AchievementAnimator(achievementNumber, startPosX, startPosY));
      }
    }
  }
}
