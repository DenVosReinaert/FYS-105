//Dylan Vermeulen
class User {
  int currentUser;
  String idUser;
  String TID;
  String pScore;
  int pnewID;

  void setup() {
  }

  void draw()
  {
    keyPressed();
  }

  void idCheck() {
    msql.query ( "SELECT idUser FROM User WHERE nameUser = '%s'", ascore.name); // Select ID for user
    while (msql.next() ) { // if ^ queries
      idUser = msql.getString("idUser"); // Attach idUser to string
    }
    if (idUser == null) {
      msql.query( "SELECT idUser FROM User ORDER BY idUser DESC LIMIT 1" ); // select highest ID
      while (msql.next() ) {
        TID = msql.getString("idUser"); // Set temporary ID
        pnewID = parseInt(TID) + 1; // Make new ID
      }
      if (pnewID == 0) { // If VERY first user, make it start at 1, prevents it from being 0
        pnewID = 1; // New ID is 1 if there are no id's
        currentUser = 1; // current User has id 1
      }
      if (currentUser != pnewID) { // If Account created, currentID is newID
        currentUser = pnewID; // currentUser is newID
      }
      msql.query( "INSERT INTO User (idUser, nameUser) VALUES ('%s','%s')", pnewID, ascore.name ); // Insert new ID for user
    }
    if (idUser != null) { // If there is a user with the same name, currentUser is ID belonging to name
      if (currentUser != parseInt(idUser) ) {  // if currentUser is not idUser then do this
        currentUser = parseInt(idUser); // Make currentUser into idUser
      }
    }
  }
  void keyPressed() {
    // Resets user and score with cascade delete
    if (gamemngr.hscore && key == 'r') {
      println("user account reset!");
      msql.query("DELETE FROM User WHERE idUser = '%s'", User.currentUser); // resets the currentUser and the corresponding scores and achievements
      gamemngr.hscore = false;
      gamemngr.login = true;
    }
    if (gamemngr.hscore && key == 'e') {
     println("Changing Username!");
     Login.nameChange = true;
     gamemngr.hscore = false;
     gamemngr.login = true;
    }
  }
  void nameChange() {
    msql.query("UPDATE User SET nameUser = '%s' WHERE nameUser = '%s'", Login.newName, ascore.name); 
    println("Username Changed!");
  }
}
