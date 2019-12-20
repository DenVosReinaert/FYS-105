// TE4M
// Quinn Koene

class aScore {
  int score; // The current score
  int id; // Current/new id
  String idh; // String containing highest id in scores table

  String lscore; // lowest score
  String lid; // lowest id
  // String[] idha = new String[ids];

  String name; // String containing inserted name from 'GameOver' class

  aScore() {
  }

  void draw() {
    if (!gamemngr.dead) {
      fill(255);
      textSize(20);
      text("score: "+score, width/9 - 10, height/10);
    }
  }

  void saveScore() {
    if (msql.connect() && UI.levens <= 0) {
      msql.query ( "SELECT id FROM scores ORDER BY id DESC LIMIT 1" ); // Select highest id from scores table
      while (msql.next() ) { // if ^ queries
        idh = msql.getString("id"); // Attach highest id in scores tabel to string idh(idhighest)
      }
      if (idh == null) {
        id = 1;
      }
      if (idh != null) {
        id = parseInt(idh) + 1;
      }
      if (idh != null && parseInt(idh) == 20) {
        msql.query( "SELECT id,score FROM scores ORDER BY score ASC LIMIT 1" ); // Select lowest score & belonging id from scores table
        while ( msql.next() ) {
          lscore = msql.getString("score"); // temporary score (score belonging to the id with lowest score)
          lid = msql.getString("id"); // temporary id (id belonging to the lowest score)
        }
      }
      if (idh != null && lscore != null && score > parseInt(lscore) && parseInt(idh) == 20) { // If score is bigger than the lowest score and idh is 20 then
        msql.query( "UPDATE scores SET name = '%s', score = '%s' WHERE id = '%s'", name, score, lid ); // Update lowest id with new score & name
      } 
      if (idh != null && parseInt(idh) < 20 || id == 1) { // if idh is lower than 19 then
        msql.query( "INSERT INTO scores (id, name, score) VALUES ('%s','%s','%s')", id, name, score ); // Insert new id, name and score into the scores table
      } else {
        println("id;  "+lid); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary id
        println("lowest score: "+lscore); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary score
      }

     // UI.levens = -1; // set 'levens' to -1 (so it doesn't repeat)
    }
  }
}
