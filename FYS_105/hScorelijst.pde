// TE4M
// Quinn Koene

class hScorelijst {
  int hScoreH = height/3; // Hoogte van text
  int Asc = 0;
  String[] scores = new String[Asc];
  String score;
  String name;
  String[] names = new String[Asc];

  hScorelijst() {

    if (msql.connect() && Asc < 10) {
      msql.query( "SELECT name,score FROM scores ORDER BY score DESC");
      while ( msql.next() ) {
        for (int i = 0; i < Asc; i++) {
          name = msql.getString("name");
          names = append(names, name);
          score = msql.getString("score");
          scores = append(scores, score);
          Asc++;
          println("Names & scores are being attached to array");
        }
      }
    } else { 
      println("ERROR: Couldn't fetch scores, names & id");
    }
  }

  void setup() {
  }

  void draw() {
    background(0);
    fill(255);
    rect(width/4, height/8, width/2, height - height/4);
    fill(0);
    text("Highscores", width/3, height/5);
    fill(0);
    if (Asc < 10) {
      for (int i = 0; i < Asc; i++) { 
        text(""+scores[i], width/3, hScoreH + 25*i);
        text(""+names[i], width/3+80, hScoreH + 25*i);
      }
    }
  }
}
