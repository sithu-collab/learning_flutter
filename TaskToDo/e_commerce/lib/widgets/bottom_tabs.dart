import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int currentIndex;
  final Function(int) tabPressed;
  BottomTabs({this.currentIndex, this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex ?? 0;

    return BottomNavigationBar(
      onTap: (index) {
        widget.tabPressed(index);
      },
      currentIndex: _currentIndex,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      unselectedItemColor: Colors.grey,
      iconSize: 25.0,
      selectedFontSize: 5.0,
      unselectedFontSize: 12.0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.white),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search', style: TextStyle(color: Colors.white),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text('Save', style: TextStyle(color: Colors.white),)
        ),
        BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
              Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
              FirebaseAuth.instance.signOut();
            },),
            title: Text('Logout', style: TextStyle(color: Colors.white),)
        )
      ],
    );
  }
}
