// TE4M
// Quinn Koene

class hScorelijst {
  int hScoreH = height/3;
  String[] hScore = loadStrings("Highscorelijst.txt");

  void draw() {
    background(0);
    rect(width/4, height/8, width/2, height - height/4);
    fill(0);
    text("Highscores", width/3, height/5);
    fill(0);
    for (int i = 0; i < hScore.length; i++) {
      text(hScore[i], width/3, hScoreH + 25*i);
    }
    sort(hScore);
  }
}
