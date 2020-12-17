import 'package:flutter/material.dart';
import 'package:nav_test/pages/sidebar_home.dart';

class SidebarMyAccountPage extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('My Account', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
