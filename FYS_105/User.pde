//Dylan Vermeulen
class User {
  int currentUser;
  String idUser;
  String TID;
  int newID;

  void setup() {
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
        newID = parseInt(TID) + 1; // Make new ID
      }
      if (newID == 0) { // If VERY first user, make it start at 1, prevents it from being 0
        newID = 1; // New ID is 1 if there are no id's
        currentUser = 1; // current User has id 1
      }
      if (currentUser != newID) { // If Account created, currentID is newID
        currentUser = newID; // currentUser is newID
      }
      msql.query( "INSERT INTO User (idUser, nameUser) VALUES ('%s','%s')", newID, ascore.name ); // Insert new ID for user
    }
    if (idUser != null) { // If there is a user with the same name, currentUser is ID belonging to name
      if (currentUser != parseInt(idUser) ) {  // if currentUser is not idUser then do this
        currentUser = parseInt(idUser); // Make currentUser into idUser
      }
    }
  }
}
