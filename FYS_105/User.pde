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
      if (newID == 0) {
        newID = 1;
        currentUser = 1;
      }
      msql.query( "INSERT INTO User (idUser, nameUser) VALUES ('%s','%s')", newID, ascore.name ); // Insert new ID for user
    }
    if (idUser != null) {
      currentUser = parseInt(idUser);
    }
  }
}
