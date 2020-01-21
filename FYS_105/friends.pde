// Reno Bisschop
class friends {

  String playerName; // Player Name
  String friendsName; // Friends Name
  int pID; //Player ID

  void setup() {
  }
  friends() {
  }

  void getID() { // Function to get id from the selected player (stats menu)
    msql.query( "SELECT idUser FROM User WHERE nameUser = '%s'", playerName); // query to select id where nameUser is the same as the name in playerName
    while (msql.next() ) { // Continue
      pID = parseInt(msql.getString("idUser")); // Id of user playerName(nameUser) is set into pID and put as an int
    }
    if (pID == 0) { // if pID is empty
      println("Couldn't find ID for " + playerName);
    }
  }

  void addFriend() { // Function to add a friend when selected is not in Friendslist (stats menu)
    getID(); // run function getID to receive an ID
    if (pID > 0) { // if pID is higher than 0
      msql.query( "INSERT INTO Friends (idFriends, User_idUser) VALUES ('%s', '%s')", pID, User.currentUser); // Insert pID and User.currentUser(ID Of user playing) into database as 'Friends'
      println("Yeehaw " + ascore.name + " and " + playerName + " are now friends!");
      totalFriends();
    }
  }

  void removeFriend() { // Function to remove a friend when selected is not in Playerlist (stats menu)
    getID(); // run function getID to receive an ID
    msql.query( "DELETE FROM Friends WHERE User_idUser = '%s' AND idFriends = '%s'", User.currentUser, pID); // Remove the record where User_idUser is User.currentUser(ID of user playing) and idFriends is pID(ID of selected friend)
    println("How sad! " + ascore.name + " deleted " + playerName + " as a friend");
    totalFriends(); // Run function total friends to update the friendlist in stats menu
  }

  void totalPlayers() { // Function to grab all users that are not friends of current playing player
    msql.query( "SELECT COUNT(DISTINCT u.idUser) FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name );
    // Select a not already selected u.idUser(ID of player that is NOT a friend of current playing player) from the database where u.idUser is not the same as f.idFriends if f.User_idUser(ID of the current playing player) is the same id
    while (msql.next() ) { // Continue to the next line
      String tPlayers; // String to count TotalPlayers
      tPlayers = msql.getString("COUNT(DISTINCT u.idUser)"); // Attach COUNT(DISTINCT u.idUser) (total of users not friends with current player) to the String tPlayers
      stats.totalPlayers = parseInt(tPlayers); // set stats.totalPlayers as the number version of the tPlayers String
      println("Total Players: " + stats.totalPlayers);
      if (stats.totalPlayers >= 0) { // if stats.totalPlayers is higher or same as 0 (to stop it from selecting if there are no users)
        msql.query("SELECT DISTINCT u.nameUser FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name);
        //  Select a not already selected u.nameUser(Name of an user that is NOT a friend of current playing player) from database where u.idUser is not the same as f.idFriends if f.user_idUser(ID of the current playing player) is the same id
        while (msql.next() ) { // Continue to the next line
          playerName = msql.getString("nameUser"); // Attach nameUser(Name of an user that is not a friend of current playing player) to string playerName(playerName)
          println("NAME: " + playerName);
          stats.players = append(stats.players, playerName); // Add playerName to array stats.players
          //stats.aPlayers++; // Increase the array size of stats.players
        }
      } else {
        println("Couldn't find any users");
      }
    }
  }

  void totalFriends() { // Function to grab all friends of current playing player
    msql.query( "SELECT COUNT(User_idUser) FROM Friends WHERE User_idUser = '%s'", User.currentUser ); // Count all the friends the current playing player has by checking if id is in Friends
    while (msql.next() ) { // Continue to the next line
      String tFriends; // String to count total friends
      tFriends = msql.getString("COUNT(User_idUser)"); // Attach COUNT(User_idUser) (the amount of friends the current playing player has) to the String tFriends
      stats.totalFriends = parseInt(tFriends); // Change the tFriends string into a number

      if (stats.totalFriends != 0) { // to make sure it does not select when user has no friends
        msql.query( "SELECT u.nameUser FROM User u INNER JOIN Friends f ON u.idUser = f.idFriends WHERE f.User_idUser = '%s'", User.currentUser );
        // Select u.nameUser(Name of friend of current playing player) from database table User and Friends where u.idUser(id of player(ANY) ) is equal to f.idFriends(id of friend current playing player)
        while (msql.next() ) { // Continue to next line
          friendsName = msql.getString("nameUser"); // Attach nameUser(Name of friend of current playing player) to string friendsName(friendName)
          stats.friends = append(stats.friends, friendsName); // Add friendsName to array stats.friends
          //stats.aFriends++; // Increase the array size of stats.friends
        }
      } else {
        println("Couldn't find any friends");
      }
    }
    //msql.query( "SELECT idUser FROM User WHERE nameUser = '%s'", playerName); // query to select id where nameUser is the same as the name in playerName
    //while (msql.next() ) { // Continue
    //  pID = parseInt(msql.getString("idUser")); // Id of user playerName(nameUser) is set into pID and put as an int
    //}
    //if (pID == 0) { // if pID is empty
    //  println("Couldn't find ID for " + playerName);
    //}
  }

  //void addFriend() { // Function to add a friend when selected is not in Friendslist (stats menu)
  //getID(); // run function getID to receive an ID
  //if (pID > 0) { // if pID is higher than 0
  //  msql.query( "INSERT INTO Friends (idFriends, User_idUser) VALUES ('%s', '%s')", pID, User.currentUser); // Insert pID and User.currentUser(ID Of user playing) into database as 'Friends'
  //  println("Yeehaw " + ascore.name + " and " + playerName + " are now friends!");
  //  totalFriends();
  //}
}

//void removeFriend() { // Function to remove a friend when selected is not in Playerlist (stats menu)
//getID(); // run function getID to receive an ID
//msql.query( "DELETE FROM Friends WHERE User_idUser = '%s' AND idFriends = '%s'", User.currentUser, pID); // Remove the record where User_idUser is User.currentUser(ID of user playing) and idFriends is pID(ID of selected friend)
//println("How sad! " + ascore.name + " deleted " + playerName + " as a friend");
//totalFriends(); // Run function total friends to update the friendlist in stats menu


//void totalPlayers() { // Function to grab all users that are not friends of current playing player
//msql.query( "SELECT COUNT(DISTINCT u.idUser) FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name );
//// Select a not already selected u.idUser(ID of player that is NOT a friend of current playing player) from the database where u.idUser is not the same as f.idFriends if f.User_idUser(ID of the current playing player) is the same id
//while (msql.next() ) { // Continue to the next line
//  String tPlayers; // String to count TotalPlayers
//  tPlayers = msql.getString("COUNT(DISTINCT u.idUser)"); // Attach COUNT(DISTINCT u.idUser) (total of users not friends with current player) to the String tPlayers
//  stats.totalPlayers = parseInt(tPlayers); // set stats.totalPlayers as the number version of the tPlayers String
//  println("Total Players: " + stats.totalPlayers);
//  if (stats.totalPlayers >= 0) { // if stats.totalPlayers is higher or same as 0 (to stop it from selecting if there are no users)
//    msql.query("SELECT DISTINCT u.nameUser FROM User u LEFT JOIN Friends f ON u.idUser != f.idFriends WHERE f.User_idUser = '%s' AND u.nameUser != '%s'", User.currentUser, ascore.name);
//    //  Select a not already selected u.nameUser(Name of an user that is NOT a friend of current playing player) from database where u.idUser is not the same as f.idFriends if f.user_idUser(ID of the current playing player) is the same id
//    while (msql.next() ) { // Continue to the next line
//      playerName = msql.getString("nameUser"); // Attach nameUser(Name of an user that is not a friend of current playing player) to string playerName(playerName)
//      println("NAME: " + playerName);
//      stats.players = append(stats.players, playerName); // Add playerName to array stats.players
//      stats.aPlayers++; // Increase the array size of stats.players
//    }
//  } else {
//    println("Couldn't find any users");
//  }
//}


//void totalFriends() { // Function to grab all friends of current playing player
//msql.query( "SELECT COUNT(User_idUser) FROM Friends WHERE User_idUser = '%s'", User.currentUser ); // Count all the friends the current playing player has by checking if id is in Friends
//while (msql.next() ) { // Continue to the next line
//  String tFriends; // String to count total friends
//  tFriends = msql.getString("COUNT(User_idUser)"); // Attach COUNT(User_idUser) (the amount of friends the current playing player has) to the String tFriends
//  stats.totalFriends = parseInt(tFriends); // Change the tFriends string into a number

//  if (stats.totalFriends != 0) { // to make sure it does not select when user has no friends
//    msql.query( "SELECT u.nameUser FROM User u INNER JOIN Friends f ON u.idUser = f.idFriends WHERE f.User_idUser = '%s'", User.currentUser );
//    // Select u.nameUser(Name of friend of current playing player) from database table User and Friends where u.idUser(id of player(ANY) ) is equal to f.idFriends(id of friend current playing player)
//    while (msql.next() ) { // Continue to next line
//      friendsName = msql.getString("nameUser"); // Attach nameUser(Name of friend of current playing player) to string friendsName(friendName)
//      stats.friends = append(stats.friends, friendsName); // Add friendsName to array stats.friends
//      stats.aFriends++; // Increase the array size of stats.friends
//    }
//  } else {
//    println("Couldn't find any friends");
//  }
//}
