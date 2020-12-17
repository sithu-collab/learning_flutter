import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nav_test/app_state/app_state.dart';
import 'package:nav_test/pages/main_page.dart';
import 'package:nav_test/pages/settings_page.dart';
import 'package:nav_test/pages/sidebar_home.dart';
import 'package:nav_test/pages/sidebar_my_account.dart';
import 'package:nav_test/pages/sidebar_shop.dart';
import 'package:provider/provider.dart';


import 'app_drawer.dart';

const Color _inactiveColor = Colors.blueGrey;

class NavDrawerPage extends StatefulWidget {
  @override
  _NavDrawerPageState createState() => _NavDrawerPageState();
}

class _NavDrawerPageState extends State<NavDrawerPage> {
  int _currentIndex = 0;
  
  final tabs = [
    MainPage(),
    SidebarMyAccountPage(),
    SidebarShopPage(),
    SidebarHomePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Test', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
        elevation: 0,
      //  backgroundColor: Colors.transparent,
        actions: [
          Padding(padding: EdgeInsets.only(right: 8.0),child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SettingPage()
              ));
            },)),
        ],
      ),
      drawer: AppDrawerPage(),
      body: Container(
        child: tabs[_currentIndex],
      ),

    ///BottomNavyBar
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedIndex: _currentIndex,
          showElevation: false,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Me'),
                activeColor: Colors.blue,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.fastfood),
                inactiveColor: _inactiveColor,
                title: Text('Shop'),
                activeColor: Colors.blue,
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.schedule),
                inactiveColor: _inactiveColor,
                title: Text('Schedule'),
                activeColor: Colors.blue,
                textAlign: TextAlign.center
            ),
          ],
        ),

    ///CurvedNavigationBar
//      bottomNavigationBar: CurvedNavigationBar(
//        height: MediaQuery.of(context).size.height / 12,
//        backgroundColor: Color(0xFF4A4A65),
//          items: <Widget>[
//            Icon(Icons.home, color: Colors.blueAccent, size: 25.0,),
//            Icon(Icons.person, color: Colors.blueAccent, size: 25.0),
//            Icon(Icons.fastfood, color: Colors.blueAccent, size: 25.0),
//            Icon(Icons.schedule, color: Colors.blueAccent, size: 25.0),
//          ],
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//
//      ),

    ///Simple BottomNavigationBar

//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentIndex,
//        iconSize: 25.0,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              backgroundColor: Colors.blue,
//              title: Text('Home', style: TextStyle(color: Colors.white),)
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.person),
//              backgroundColor: Colors.blue,
//              title: Text('Me', style: TextStyle(color: Colors.white),)
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.fastfood),
//              backgroundColor: Colors.pink,
//              title: Text('Food', style: TextStyle(color: Colors.white),)
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.exit_to_app),
//              backgroundColor: Colors.deepOrange,
//              title: Text('Logout', style: TextStyle(color: Colors.white),)
//          ),
//        ],
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//
//      ),
    );
  }
}