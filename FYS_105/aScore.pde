// TE4M
// Quinn Koene

class aScore {
  int score;
  int id;
  String idh;
  // String[] idha = new String[ids];

  int deadC;
  boolean dead;
  String typing = "";
  String name = "";
  int nameC;

  aScore() {
  }

  void draw() {
    if (!dead) {
      fill(255);
      text(""+score, 20, 30);
    }
    if (dead) {
      if (deadC > 31) {
        deadC = 31;
      }
      fill(255);
      textSize(40);
      typing.toUpperCase();
      text("" + typing, width/2 - 90, height/2 - 10);
      deadC++;
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
  void keyPressed() {
    if (dead && deadC > 30) {
      if (key == '\n' || nameC == 4) {
        name = typing;
        saveScore();
      } else {
        nameC++;
        typing = typing + key;
      }
    }
  }
}
