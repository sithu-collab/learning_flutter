import 'package:databaseintro/models/user.dart';
import 'package:databaseintro/utils/database_helper.dart';
import 'package:flutter/material.dart';


List _users;
void main() async{

  runApp(new MaterialApp(
    title: 'database',
    home: new Home(),
  ));
  var db = new DatabaseHelper();

  //Add user
  int savedUser = await db.saverUser(User("Nora","passsword2"));
  print("User saved : $savedUser");

  //Get all user
  _users = await db.getAllUsers();
  for(int i; i < _users.length; i++){
    User user = User.map(_users[i]);
    print("Username : ${user.username}, Password : ${user.password}");
  }

  //Get count
  int count = await db.getCount();
  print("Count is : $count");

  //Get user
  User user = await db.getUser(1);
  print("Get User : ${user.username}, Password : ${user.password}");

  //Delete user
  int deleteUser = await db.deleteUser(3);
  print("Deleted user : $deleteUser");

  //Retrieving user
  User updateUser = User.fromMap({
    "username" : "UpdateUser",
    "password" : "UpdatePassword",
    "id" : 1
  });

  //update
  await db.updateUser(updateUser);

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Database Intro'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
          itemBuilder: (_,int position){
            return new Card(
              color: Colors.white,
              elevation: 2.0,
              child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text("${User.fromMap(_users[position]).username.substring(0, 1)}"),
                ),
                title: new Text("User : ${User.fromMap(_users[position]).username}"),
                subtitle: new Text("ID : ${User.fromMap(_users[position]).id}"),

                onTap: () => debugPrint("Password : ${User.fromMap(_users[position]).password}"),
              ),
            );
      }),
      
    );
  }
}
