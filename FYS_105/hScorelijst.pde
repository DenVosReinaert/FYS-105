// TE4M
// Quinn Koene

class hScorelijst {
  int hScoreH = height/3; // Hoogte van text
  int Asc = 0; // 'Array Score'
  int Ans = 0; // 'Array name & score'
  String[] scores = new String[Asc];
  String score;
  String name;
  String[] names = new String[Asc];

  hScorelijst() {

    if (msql.connect() && Ans < 10) { // Als geconnect is met database & Ans kleiner is dan 10
      msql.query( "SELECT u.nameUser, s.valueScores FROM Scores s INNER JOIN User_has_Scores o ON s.idScores = o.Scores_idScores INNER JOIN User u WHERE u.idUser = o.User_idUser ORDER BY s.valueScores DESC LIMIT 10");
      while ( msql.next() && Ans < 10) {
        name = msql.getString("u.nameUser"); // string name is 'name' uit database
        names = append(names, name); // Voeg name toe aan de array names
        score = msql.getString("s.valueScores"); // string score is 'score' uit database
        scores = append(scores, score); // Voeg score toe aan de array scores
        Asc++;
        Ans++;
      }
    } else { 
      println("ERROR: Couldn't fetch scores, names & id");
    }
  }

  void setup() {
  }

  void draw() {
    if (gamemngr.hscore) {
      death.pause();
      death.rewind();
      scrBgr.resize(width, height);
      image(scrBgr, 0, 0);
      pushStyle();
      textAlign(CENTER);
      textSize(40);
      text("Press 'B' to go back", 200, 40);
      text("Press 'SELECT' to reset your account", 640, 680);
      if (scores.length == 0) {
        text("Huh? It's empty!", width/2, hScoreH+100); 
        text("Play now and be the first!", width/2 + 80, hScoreH+160);
      }
      popStyle();
      textSize(40);
      for (int i = 0; i < Asc; i++) {
        if (names.length > 0 && scores.length > 0) {
          text(""+scores[i], width/3, hScoreH + 40*i);
          text(""+names[i], width/3+300, hScoreH + 40*i);
        }
      }
    }
  }
}
