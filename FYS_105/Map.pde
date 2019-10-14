class Map {
  
  Map() {
  }
  
  void mapDraw() {

    background(142, 203, 232); // Lucht

    pushStyle();
    fill(145, 74, 33);
    rect(0, height - height /12, width, width);  // Aarde
    popStyle();

    pushStyle();
    fill(97, 217, 78);
    rect(0, height - height /10 + 10, width, 25);  // Gras
    popStyle();

    pushStyle();
    fill(89, 47, 32);
    rect(400, height/2, 160, 442); // Boomstam
    popStyle();

    pushStyle();
    fill(84, 194, 62);
    ellipse(478, height/2 - 200, 380, 442); // Boom "bladeren"
    popStyle();

    pushStyle();
    fill(234, 237, 19);
    ellipse(100, 100, 150, 150); // Zon
    popStyle();

  }
}
