// TE4M
// Quinn Koene

class aScore {
  int score;
  int id;
  String idh;
  // String[] idha = new String[ids];

  boolean dead;
  String typing = "";
  String name;
  int nameC;

  aScore() {
  }

  void draw() {
    if (!dead) {
      fill(255);
      textSize(20);
      text(""+score, width/9, height/10);
    }
  }

  void saveScore() {
    if (msql.connect() && healthbar.levens == 0) {
      msql.query ( "SELECT id FROM scores ORDER BY id DESC LIMIT 1" );
      while (msql.next() ) {
        idh = msql.getString("id");
      }
      msql.query( "SELECT id,score FROM scores ORDER BY score ASC LIMIT 1" );
      while (msql.next() ) {
        String tsc = msql.getString("score"); // temporary score (score belonging to the id with lowest score)
        String tid = msql.getString("id"); // temporary id (id belonging to the lowest score)

        if (score > parseInt(tsc) && parseInt(idh) == 20) {
          msql.query( "UPDATE scores SET name = '%s', score = '%s' WHERE id = '%s'", name, score, tid );
        } else if (parseInt(idh) < 19) { 
          if (parseInt(idh) == 0) {
            id = 1;
          } else {
            id = parseInt(idh)+1;
          }
          msql.query( "INSERT INTO scores (id, name, score) VALUES ('%s','%s','%s')", id, name, score );
        } else {
          println("TID: "+tid);
          println("TSC: "+tsc);
        }
      }
      healthbar.levens = -1;
    }
  }
}
