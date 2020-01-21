//Adriaan Pronk
class AchievementManager
{


  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements, progression, progressionCurrent;
  String tempId, dbDupeInsertCheck;


  float startPosX, startPosY, endPosX, endPosY;

  ArrayList<AchievementAnimator> achievementAnim = new ArrayList<AchievementAnimator>();   //Creates a list of instances for the animations of an achievement plate when they are unlocked.



  AchievementManager()
  {
    totalAchievements = 6;

    msql.connect();
    achievementAnimsActive = 0;
  }





  void draw()
  {
    for (int i = 0; i < achievementAnim.size(); i++)                                                 //Call the draw function of every existing achievement animator that is in the existing list
    {
      achievementAnim.get(i).draw();
    }

    startPosX = width;
    startPosY = height - chievePlate[1].height - (chievePlate[1].height * achievementAnimsActive);   //Start the animation of an achievement plate in the bottom right corner

    endPosX = width - chievePlate[1].width;                                                          //End the animation of an achievement plate when it is fully on screen
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

        achievementAnim.add(new AchievementAnimator(achievementNumber, startPosX, startPosY));    //Create an instance of the achievement animator with the corresponding achievement number
      }
    }
  }
}
