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
      msql.query("SELECT id FROM scores");
      while (msql.next()) {
        idh = msql.getString("id");
        //   idha = append(idha, idh);
        id = parseInt(idh)+1;
        print(id);
      }
      msql.query( "INSERT INTO scores (id, name, score) VALUES ('%s','%s','%s')", id, name, score );
      healthbar.levens = -1;
    }
  }
  void keyPressed() {
    if (dead && deadC > 30) {
      if (key == '\n' || nameC >= 4) {
        name = typing;
        saveScore();
      } else {
        nameC++;
        typing = typing + key;
      }
    }
  }
}
