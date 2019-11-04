// TE4M
// Quinn Koene

class hScorelijst {
  int hScoreH = height/3; // Hoogte van text
  String[] hScore = loadStrings("Highscorelijst.txt"); // vult Array hScore met lijst uit Highscorelijst.txt

  void draw() {
    background(0);
    fill(255);
    rect(width/4, height/8, width/2, height - height/4);
    fill(0);
    text("Highscores", width/3, height/5);
    fill(0);
    for (int i = 0; i < hScore.length; i++) { // for loop die door blijft gaan tot einde van de array
      if (parseInt(hScore[i]) > 0) { // Als het cijfer in de array groter is dan 0 schrijft deze hem
        text(hScore[i], width/3, hScoreH + 25*i); // hier op :)
      }
    }
    sort(hScore); // Sorteert even zodat alles van kleinste naar grootste staat
  }
}
