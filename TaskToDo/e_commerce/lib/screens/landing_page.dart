import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // firebase set up
        // if snapshot has error
        if(snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        //firebase initialization state
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<dynamic> streamSnapshot) {

              //if streamSnapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text('Error: ${streamSnapshot.error}'),
                  ),
                );
              }

              // if auth state active - Do the user to login
              if(streamSnapshot.connectionState == ConnectionState.active) {
                // Get the User
                User _user = streamSnapshot.data;
                
                // if the user is null, we're not logged in
                if(_user == null) {
                  // if user not logged in, head to login page
                  return LoginPage();
                }else{
                  // if user logged in, head to home page
                  return HomePage();
              }
              }
              // auth state - Loading
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
        //firebase loading
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
