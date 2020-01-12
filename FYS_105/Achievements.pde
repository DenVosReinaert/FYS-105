class Achievements
{

  Timer[] achievementRetractTimer;

  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements;
  String tempId;

  float startPosX, startPosY, endPosX, endPosY;

  float[] currentPosX = new float[totalAchievements];
  float[] currentPosY = new float[totalAchievements];

  boolean[] achievementAnim = new boolean[totalAchievements];






  Achievements()
  {
    totalAchievements = 6;

    msql.connect();
    achievementAnimsActive = 0;
  }





  void draw()
  {
    for (int i = 0; i < achievementAnim.length; i++)
    {
      achievementRetractTimer[i] = new Timer(10);
      
      if (achievementAnim[i])
      {
        currentPosX[i] = startPosX;
        currentPosY[i] = startPosY;

        image(chieveHighscore, startPosX, startPosY);

        if (currentPosX[i] > endPosX)
        {
          currentPosX[i]--;
        }
      }
    }


    startPosX = width;
    startPosY = height - chieveKonami.height - (chieveKonami.height * achievementAnimsActive);

    endPosX = width - chieveKonami.width;
    endPosY = startPosY;
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
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 1, 0);
        achievement.play();
        achievement.rewind();
      }
    }
    
    achievementRetractTimer[achievementNumber].Reset();
    achievementAnimsActive++;
  }
}
