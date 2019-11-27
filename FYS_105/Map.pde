class Map {
  
  Map() {
  }
  
  void mapDraw() {

  background(200, 255, 200);

  //boundries van het scherm
  noStroke();
  fill(50, 50, 50); //de kleur van de muren en pilaren
  rect(0, -450, width/3, 500); //vierkant linksboven - naar rechts
  rect(width/3 + width/3, -450, width/3, 500); //vierkant rechtsboven - naar links

  rect(0, height - 75, width/3, 500); //vierkant linksonder - naar rechts
  rect(width/3 + width/3, height - 75, width/3, 500); //vierkant rechtsonder - naar links

  rect(-450, 0, 500, height/3); //vierkant linksboven - naar onder
  rect(width -50, 0, 500, height/3); //vierkant rechtsboven - naar onder

  rect(-450, height/3 + height/3, 500, height/3); //vierkant linksonder - naar boven
  rect(width - 50, height/3 + height/3, 500, height/3); //vierkant rechtsonder - naar boven

  //pilaren
  circle(width/4, height/4, 150); //circle linksboven
  circle(width - width/4, height/4, 150); //circle rechtsboven

  circle(width/4, height - height/4, 150); //circle linksonder
  circle(width - width/4, height - height/4, 150);
  }
}
