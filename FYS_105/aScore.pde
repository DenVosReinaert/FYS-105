// TE4M
// Quinn Koene

class aScore {
  int score; // The current score
  float combo; // The current combo or score multiplier
  int id; // Current/new id
  String idh; // String containing highest id in scores table
  String lscore; // lowest score
  String lid; // lowest id
  // String[] idha = new String[ids];
  String name; // String containing inserted name from 'GameOver' class

  aScore() {
    combo = 1;
  }

  void draw() {
    float tCombo = combo - combo%0.01; // This is the number visible on the display
    if (!gamemngr.dead) { 
      pushStyle();
      fill(255);
      textSize(20);
      text("Score: "+score, width/9 - 10, height/10); // Total score of the player op to that point at the top left
      text("x" + tCombo, myPlayer.objPosX, myPlayer.objPosY); // Indicator of the score multiplier above the player
      popStyle();
    }
  }



  void saveScore() {
    if (msql.connect() && UI.levens <= 0) {
      msql.query ( "SELECT idScores FROM Scores ORDER BY idScores DESC LIMIT 1" ); // Select highest id from scores table
      while (msql.next() ) { // if ^ queries
        idh = msql.getString("idScores"); // Attach highest id in scores tabel to string idh(idhighest)
      }
      if (idh == null) {
        id = 1;
      }
      if (idh != null) {
        id = parseInt(idh) + 1;
      }
      if (idh != null && parseInt(idh) == 20) {
        msql.query( "SELECT idScores,valueScores FROM Scores ORDER BY valueScores ASC LIMIT 1" ); // Select lowest score & belonging id from scores table
        while ( msql.next() ) {
          lscore = msql.getString("valueScores"); // temporary score (score belonging to the id with lowest score)
          lid = msql.getString("idScores"); // temporary id (id belonging to the lowest score)
        }
      }
      if (idh != null && lscore != null && score > parseInt(lscore) && parseInt(idh) == 20) { // If score is bigger than the lowest score and idh is 20 then
        msql.query( "UPDATE Scores SET nameScores = '%s', valueScores = '%s' WHERE idScores = '%s'", name, score, lid ); // Update lowest id with new score & name
      } 
      if (idh != null && parseInt(idh) < 20 || id == 1) { // if idh is lower than 19 then
        msql.query( "INSERT INTO Scores (idScores, nameScores, valueScores) VALUES ('%s','%s','%s')", id, name, score ); // Insert new id, name and score into the scores table
      } else {
        println("idScores;  "+lid); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary id
        println("lowest score: "+lscore); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary score
      }
      // UI.levens = -1; // set 'levens' to -1 (so it doesn't repeat)
    }
  }
}
