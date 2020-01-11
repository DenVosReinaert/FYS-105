// TE4M
// Quinn Koene

class aScore {
  int randomSoundTrack; //choosing a random sound to play with switch statement
  int totalSoundTracks; //number of sounds you want to use for the random
  int score; // The current score
  float combo; // The current combo or score multiplier
  String oScore; // "Old Score" score already in scorelist belonging to player
  String name; // String containing inserted name from 'Login' class

  aScore() {
    combo = 1;
    totalSoundTracks = 2;
  }

  void draw() {
    float tCombo = combo - combo%0.01; // This is the number visible on the display
    if (!gamemngr.dead) { 
      pushStyle();
      fill(255);
      textSize(20);
      text("Score: "+score, width/9 - 10, height/10); // Total score of the player op to that point at the top left
      text("x" + tCombo, myPlayer.objPosX - myPlayer.objWidth/2 + 5, myPlayer.objPosY); // Indicator of the score multiplier above the player
      popStyle();
    }
  }



  void saveScore() {
    println("Levens" + UI.levens);
    if (msql.connect() && UI.levens <= 0) {
      msql.query( "SELECT idScores, valueScores FROM Scores WHERE idScores = '%s' AND nameScores = '%s'", User.currentUser, ascore.name ); // Grab the score from the player
      while ( msql.next() ) {
        oScore = msql.getString("valueScores"); // temporary score (score belonging to player)
        println("Select Score: " + oScore);
      }
      println("ID: " + User.currentUser);
      if (oScore == null && User.currentUser != 0) { // if score doesn't exist make one
        msql.query( "INSERT INTO Scores (idScores, nameScores, valueScores) VALUES ('%s','%s','%s')", User.currentUser, ascore.name, score );
        println("INSERT!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      if (oScore != null && score > parseInt(oScore)) { // If score is bigger than the lowest score and idh is 20 then
        msql.query( "UPDATE Scores SET valueScores = '%s' WHERE idScores = '%s' AND nameScores = '%s'", score, User.currentUser, ascore.name ); // Update score
        println("UPDATE!: " + oScore + " ID: " + User.currentUser + " Name: " + ascore.name);
      }
      // UI.levens = -1; // set 'levens' to -1 (so it doesn't repeat)
    } else {
      println("Old Score: " + oScore);
      println("New Score: " + score);
    }
  }


  void ComboReset()
  {
    randomSoundTrack = round(random(0, totalSoundTracks)); // picks 0, 1 or 2

    //takes the random pick and plays the corresponding sound
    switch(randomSoundTrack) {
    case 0:
      bruh.setGain(20);
      bruh.play();
      bruh.rewind();
      missing1.pause();
      missing2.pause();
      break;
    case 1:
      missing1.setGain(40);
      missing1.play();
      missing1.rewind();
      missing2.pause();
      bruh.pause();
      break;
    case 2:
      missing2.setGain(40);
      missing2.play();
      missing2.rewind();
      missing1.pause();
      bruh.pause();
      break;
    }
    combo = 1;
  }
}
