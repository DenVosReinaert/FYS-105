// TE4M
// Quinn Koene

class aScore {
  int randomSoundTrack; //choosing a random sound to play with switch statement
  int totalSoundTracks; //number of sounds you want to use for the random
  int score; // The current score
  float combo; // The current combo or score multiplier

  int scoreID; // ID of the score
  String totalScore; // totalScores
  String lowScoreID; // lowest scoreID from player
  String lowScore; // Lowest score belonging to player

  String name; // String containing inserted name from 'Login' class
  boolean chieveUnlocked;

  aScore() {
    combo = 1;
    totalSoundTracks = 2; // Tracks for combo misses
    chieveUnlocked = false;
  }

  void draw() {

    if (score >= 100000 && !chieveUnlocked)
    {
      chieves.AddAchievementProgress(1, 0, 0);
      chieveUnlocked = true;
    } 

    float tCombo = combo - combo%0.01; // This is the number visible on the display in with decimals
    if (!gamemngr.dead) { 
      pushStyle();
      fill(255);
      textSize(20);
      text("Score: "+score, width/9 - 10, height/10); // Total score of the player op to that point at the top left
      text("x" + tCombo, myPlayer.objPosX - myPlayer.objWidth/2 + 5, myPlayer.objPosY); // Indicator of the score multiplier above the player
      popStyle();
    }
  }


  //
  void saveScore() {
    //println("Levens" + UI.levens);
    if (msql.connect() && UI.levens <= 0) {
      msql.query( " SELECT idScores FROM Scores ORDER BY idScores DESC LIMIT 1 " ); // Highest idScore
      while (msql.next() ) {
        scoreID = parseInt(msql.getString("idScores"));
      }
      if (scoreID == 0) {
        scoreID = 1;
      } else {
        scoreID = scoreID + 1;
      }
      msql.query( "SELECT COUNT(User_idUser) FROM User_has_Scores WHERE User_idUser = '%s'", User.currentUser); // Count all scores
      while ( msql.next() ) {
        totalScore = msql.getString("COUNT(User_idUser)"); // Shows how many scores the player has
      }
      msql.query( "SELECT s.valueScores,s.idScores FROM Scores s INNER JOIN User_has_Scores a ON a.Scores_idScores = s.idScores WHERE a.User_idUser = '%s' ORDER BY s.valueScores LIMIT 1", User.currentUser ); // Select lowest score from player
      while (msql.next() ) {
        lowScore = msql.getString("s.valueScores");
        lowScoreID = msql.getString("s.idScores");
      }

      if (totalScore == null) {
        println("Total Score empty..");
      }
      if (parseInt(totalScore) >= 10 && score > parseInt(lowScore) ) {
        msql.query( "UPDATE Scores SET valueScores = '%s' WHERE idScores = '%s'", score, lowScoreID); // Update score
        //println("UPDATE!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      //println("ID: " + User.currentUser);
      if (User.currentUser != 0 && parseInt(totalScore) < 10) { // if score doesn't exist make one
        msql.query( "INSERT INTO Scores (idScores, valueScores) VALUES ('%s','%s')", scoreID, score );
        msql.query( "INSERT INTO User_has_Scores (User_idUser, Scores_idScores) VALUES ('%s','%s')", User.currentUser, scoreID );
        //println("INSERT!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      //if (oScore != null && score > parseInt(oScore)) { // If score is bigger than the lowest score and idh is 20 then
      //  msql.query( "UPDATE Scores SET valueScores = '%s' WHERE idScores = '%s' AND nameScores = '%s'", score, User.currentUser, ascore.name ); // Update score
      //  //println("UPDATE!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      //}
    } else {
      println("ERROR: Couldn't input score!");
    }
  }


  void ComboReset()
  {
    randomSoundTrack = round(random(0, totalSoundTracks)); // picks 0, 1 or 2

    //takes the random pick and plays the corresponding sound
    switch(randomSoundTrack) {
    case 0:
      bruh.setGain(30);
      bruh.play();
      bruh.rewind();
      missing1.pause();
      missing2.pause();
      break;
    case 1:
      missing1.setGain(60);
      missing1.play();
      missing1.rewind();
      missing2.pause();
      bruh.pause();
      break;
    case 2:
      missing2.setGain(60);
      missing2.play();
      missing2.rewind();
      missing1.pause();
      bruh.pause();
      break;
    }
    combo = 1;
  }
}
