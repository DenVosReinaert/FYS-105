//Adriaan Pronk
class AchievementManager
{


  //int chieveFalse = 0;

  int achieved, achievementAnimsActive, totalAchievements;
  String tempId;

  float startPosX, startPosY, endPosX, endPosY;

  float[] currentPosX = new float[totalAchievements];                                      //OBSOLETE
  float[] currentPosY = new float[totalAchievements];                                      //OBSOLETE

  int[] oldschoolTimer = new int[totalAchievements];                                       //OBSOLETE

  //boolean[] achievementAnim = new boolean[totalAchievements];


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



  void UnlockAchievement(int achievementNumber)
  {

    if (msql.connect()) 
    {
      msql.query( "SELECT collectedAchievement FROM User_has_Achievements WHERE User_idUser = '%s' AND Achievements_idAchievements = '%s'", User.currentUser, achievementNumber );    //Check wether the user has achieved the mentioned achievement
      while (msql.next() ) 
      {
        achieved = parseInt(msql.getString("collectedAchievement"));
      }
      if (achieved != 1) 
      {
        msql.query("INSERT INTO User_has_Achievements (User_idUser, Achievements_idAchievements, collectedAchievement, progressionAchievement) VALUES ('%s','%s','%s','%s')", User.currentUser, achievementNumber, 1, 0);    //Add a record in the database stating that the user has unlocked the achievement
        achievement.play();
        achievement.rewind();

        achievementAnim.add(new AchievementAnimator(achievementNumber, startPosX, startPosY));    //Create an instance of the achievement animator with the corresponding achievement number
      }
    }
  }
}
