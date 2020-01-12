class friends {

  String pName; // Player Name
  String fName; // Friends Name
  int pID; //Player ID

  void setup() {
  }
  friends() {
  }

  void getID() {
    msql.query( "SELECT idUser FROM User WHERE nameUser = '%s'", pName);
    while (msql.next() ) {
      pID = parseInt(msql.getString("idUser"));
    }
    if (pID == 0) {
      println("Couldn't find ID for " + pName);
    }
  }

  void addFriend() {
    getID();
    if (pID > 0) {
      msql.query( "INSERT INTO Friends (idFriends, User_idUser) VALUES ('%s', '%s')", pID, User.currentUser);
      println("Yeehaw " + ascore.name + " and " + pName + " are now friends!");
      totalFriends();
    }
  }

  void removeFriend() {
    getID();
    msql.query( "DELETE FROM Friends WHERE User_idUser = '%s' AND idFriends = '%s'", User.currentUser, pID);
    println("How sad! " + ascore.name + " deleted " + pName + " as a friend");
    totalFriends();
  }

  void totalPlayers() {
    msql.query( "SELECT COUNT(idUser) FROM User" );
    while (msql.next() ) {
      String tPlayers;
      tPlayers = msql.getString("COUNT(idUser)");
      stats.totalPlayers = parseInt(tPlayers);
      if (stats.totalPlayers > 0) {
        msql.query("SELECT u.nameUser FROM User u OUTER JOIN Friends f ON u.idUser != f.idFriends WHERE u.idUser = '%s'", User.currentUser);
        while (msql.next() ) {
          pName = msql.getString("nameUser");
          println("NAAME: " + pName);
          stats.players = append(stats.players, pName);
          stats.aPlayers++;
        }
      } else {
        println("Couldn't find any users");
      }
    }
  }

  void totalFriends() {
    msql.query( "SELECT COUNT(User_idUser) FROM Friends WHERE User_idUser = '%s'", User.currentUser );
    while (msql.next() ) {
      String tFriends;
      tFriends = msql.getString("COUNT(User_idUser)");
      stats.totalFriends = parseInt(tFriends);
      
      if (stats.totalFriends != 0) {
        msql.query( "SELECT u.nameUser FROM User u INNER JOIN Friends f ON u.idUser = f.idFriends WHERE f.User_idUser = '%s'", User.currentUser );
        while (msql.next() ) {
          fName = msql.getString("nameUser");
          stats.friends = append(stats.friends, fName);
          stats.aFriends++;
        }
      } else {
        println("Couldn't find any friends");
      }
    }
  }
}
