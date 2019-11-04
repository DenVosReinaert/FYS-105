// TE4M
// Quinn Koene

class Highscore {

  int cScore;
  String[] lScore;
  String scorelijst;

  int hScoreX = width - width/8;
  int hScoreY = height/15;

  Highscore() {
    lScore = loadStrings("Highscorelijst.txt"); // Laad in Array lScore de lijst uit Highscorelijst.txt
  }
  void draw() {

    fill(255);
    text("score: " + cScore, hScoreX, hScoreY);
    if (keyPressed) {
      if (key == 'i') {
        cScore++;
      }
    }
  }
  void saveScore() { // Functie die ervoor zorgt dat de score wordt opgeslagen
    if (lScore.length < 10) // Als lScore.length kleiner is dan 10 dan doet ie de code hieronder 
    { // Als lengte kleiner is dan de gelimiteerde nummer 10 dan voegt ie cScore toe
      // lScore=append(lScore, str(cScore)); // Voegt cScore toe aan de array lScore
    } else // Als lScore.length niet kleiner is dan 10 doet ie de code hieronder
    {
      if (parseInt(lScore[lScore.length-1]) < cScore) // Kijkt of alle elementen in array kleiner zijn dan cScore
      {
        lScore[lScore.length-1]=str(cScore); // zet cScore in de array lScore
        for (int i = lScore.length-1; i > 0; i--) // Loopt door de array heen van achteraan tot eerste
        {
          if (parseInt(lScore[i]) > parseInt(lScore[i-1])) // Kijkt of array lScore groter is dan array lScore - 1
          {
            String zetLager=lScore[i-1]; // Maakt string aan van array lScore-1
            lScore[i-1]=lScore[i]; // Maakt van array lScore-1, array lScore
            lScore[i]=zetLager; // Maakt van array lScore naar array lScore - 1
          }
        }
      }
      scorelijst="";
      for (int i = 0; i < lScore.length; i++) 
      {
        scorelijst+=lScore[i]+"  "; // Voegt array lScore toe aan scorelijst
      }
      saveStrings("Highscorelijst.txt", lScore); // Slaat array lScore op in highscorelijst.txt
     // println("Saved " + scorelijst);
    }
    sort(lScore);
  }
}
