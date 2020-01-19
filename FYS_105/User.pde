<<<<<<< HEAD
=======
//Dylan Vermeulen
>>>>>>> parent of 6a5fb24... zucht
class User {
  int currentUser;
  String idUser;
  String TID;
  int newID;

  void setup() {
  }

  void idCheck() {
    msql.query ( "SELECT idUser FROM User WHERE nameUser = '%s'", ascore.name); // Select ID for user
<<<<<<< HEAD
    println("NAAME: " +ascore.name);
=======
>>>>>>> parent of 6a5fb24... zucht
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
<<<<<<< HEAD
        newID = 1;
        currentUser = 1;
      }
      if (currentUser == 0) { // If Account created, currentID is newID
        currentUser = newID;
=======
        newID = 1; // New ID is 1 if there are no id's
        currentUser = 1; // current User has id 1
      }
      if (currentUser != newID) { // If Account created, currentID is newID
        currentUser = newID; // currentUser is newID
>>>>>>> parent of 6a5fb24... zucht
      }
      msql.query( "INSERT INTO User (idUser, nameUser) VALUES ('%s','%s')", newID, ascore.name ); // Insert new ID for user
    }
    if (idUser != null) { // If there is a user with the same name, currentUser is ID belonging to name
<<<<<<< HEAD
      currentUser = parseInt(idUser);
      print("Already exists!" + currentUser);
=======
      if (currentUser != parseInt(idUser) ) {  // if currentUser is not idUser then do this
        currentUser = parseInt(idUser); // Make currentUser into idUser
      }
>>>>>>> parent of 6a5fb24... zucht
    }
  }
}
