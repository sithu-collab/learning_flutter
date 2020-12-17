import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_drawer/navigation_bloc/navigation_bloc.dart';
import 'package:navigation_drawer/siderbar/menu_item.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _animationDuration, vsync: this);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void _onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45.0,
          duration: _animationDuration,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFF262AAA),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      ListTile(
                        title: Text(
                          'Sithu Lwin',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'lwin10415@gmail.com',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          child: Icon(
                            Icons.person,
                            color: Colors.cyan,
                            size: 30.0,
                          ),
                          radius: 40.0,
                        ),
                      ),
                      Divider(
                        height: 30.0,
                        color: Colors.white.withOpacity(0.7),
                        thickness: 0.5,
                        indent: 23.0,
                        endIndent: 23.0,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(HomePageClickedEvent());
                        },
                      ),
                      MenuItem(
                        icon: Icons.person_outline,
                        title: 'My Account',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(MyAccountsClickedEvent());
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_cart,
                        title: 'My Order',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(MyOrdersClickedEvent());
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: 'Wish List',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(WishListClickedEvent());
                        },
                      ),
                      Divider(
                        height: 30.0,
                        color: Colors.white.withOpacity(0.7),
                        thickness: 0.5,
                        indent: 23.0,
                        endIndent: 23.0,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: 'Settings',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(SettingClickedEvent());
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: 'Logout',
                        onTap: () {
                          _onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(LogoutClickedEvent());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.93),
                child: GestureDetector(
                  onTap: () {
                    _onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35.0,
                      height: 110.0,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController.view,
                        color: Colors.cyan,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
