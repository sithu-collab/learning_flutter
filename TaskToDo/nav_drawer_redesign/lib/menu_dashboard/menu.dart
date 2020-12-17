import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final Animation<Offset> _slideAnimation;
  final Animation<double> _menuScaleAnimation;

  const MenuPage({
    @required Animation<Offset> slideAnimation,
    @required Animation<double> menuScaleAnimation,
  })  : _slideAnimation = slideAnimation,
        _menuScaleAnimation = menuScaleAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Messages',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Utility Bills',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Funds transfer',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Branches',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
