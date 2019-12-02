// TE4M
// Quinn Koene

class aScore {
  int score; // The current score
  int id; // Current/new id
  String idh; // String containing highest id in scores table
  // String[] idha = new String[ids];

  String name; // String containing inserted name from 'GameOver' class

  aScore() {
  }

  void draw() {
    if (!gamemngr.dead) {
      fill(255);
      textSize(20);
      text(""+score, width/9, height/10);
    }
  }

  void saveScore() {
    if (msql.connect() && healthbar.levens == 0) { // connect to database
      msql.query ( "SELECT id FROM scores ORDER BY id DESC LIMIT 1" ); // Select highest id from scores table
      while (msql.next() ) { // if ^ queries
        idh = msql.getString("id"); // Attach highest id in scores tabel to string idh(idhighest)
      }
      msql.query( "SELECT id,score FROM scores ORDER BY score ASC LIMIT 1" ); // Select lowest score & belonging id from scores table
      while (msql.next() ) {
        String tsc = msql.getString("score"); // temporary score (score belonging to the id with lowest score)
        String tid = msql.getString("id"); // temporary id (id belonging to the lowest score)

        if (score > parseInt(tsc) && parseInt(idh) == 20) { // If score is bigger than the lowest score and idh is 20 then
          msql.query( "UPDATE scores SET name = '%s', score = '%s' WHERE id = '%s'", name, score, tid ); // Update lowest id with new score & name
        } else if (parseInt(idh) < 19) { // if idh is lower than 19 then
          if (parseInt(idh) == 0) { // if idh is 0 then id = 1
            id = 1;
          } else { 
            id = parseInt(idh)+1; // id is idh + 1 (if idh is for example 18 it makes a new one with id 19
          }
          msql.query( "INSERT INTO scores (id, name, score) VALUES ('%s','%s','%s')", id, name, score ); // Insert new id, name and score into the scores table
        } else {
          println("TID: "+tid); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary id
          println("TSC: "+tsc); // if none of these are valid ^ ((list is full(20 max) and score is below the lowest score) print temporary score
        }
      }
      healthbar.levens = -1; // set 'levens' to -1 (so it doesn't repeat)
    }
  }
}
