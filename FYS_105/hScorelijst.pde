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
      println("Executed query!");
      while ( msql.next() && Ans < 10) {
        name = msql.getString("name"); // string name is 'name' uit database
        names = append(names, name); // Voeg name toe aan de array names
        score = msql.getString("score"); // string score is 'score' uit database
        scores = append(scores, score); // Voeg score toe aan de array scores
        Ans++;
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
    for (int i = 0; i < 10; i++) { 
      text(""+scores[i], width/3, hScoreH + 25*i);
      text(""+names[i], width/3+80, hScoreH + 25*i);
    }
  }
}
