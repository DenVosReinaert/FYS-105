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
      msql.query( "SELECT name,score FROM scores ORDER BY score DESC");
      while ( msql.next() && Ans < 10) {
        name = msql.getString("name"); // string name is 'name' uit database
        names = append(names, name); // Voeg name toe aan de array names
        score = msql.getString("score"); // string score is 'score' uit database
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
      scrBgr.resize(width, height);
      image(scrBgr, 0, 0);
      textSize(40);
      if (scores.length == 0) {
        text("Huh? It's empty!", width/2 - 150, hScoreH+100); 
        text("Play now and be the first!", width/4 + 80, hScoreH+160);
      }
      for (int i = 0; i < Asc; i++) { 
        if (names.length > 0 && scores.length > 0) {
          text(""+scores[i], width/3, hScoreH + 40*i);
          text(""+names[i], width/3+300, hScoreH + 40*i);
        }
      }
    }
  }
}
