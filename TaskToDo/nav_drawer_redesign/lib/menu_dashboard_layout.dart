import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_drawer_redesign/menu_dashboard/dashboard.dart';
import 'package:nav_drawer_redesign/menu_dashboard/menu.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  bool isCollapsed = true;
  double screenHeight, screenWidth;
  final Duration _duration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_animationController);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_animationController);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0,0)).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          MenuPage(slideAnimation: _slideAnimation, menuScaleAnimation: _menuScaleAnimation,),
          Dashboard(
            isCollapsed: true,
            duration: _duration,
            screenWidth: screenWidth,
            scaleAnimation: _scaleAnimation,
            onMenuTap: onMenuTap,)
        ],
      ),
    );
  }

  void onMenuTap() {
    setState(() {
        if(isCollapsed){
        _animationController.forward();
      }else{
        _animationController.reverse();
      }
        isCollapsed = !isCollapsed;
      });
  }
}
