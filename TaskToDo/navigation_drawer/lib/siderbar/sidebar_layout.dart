import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_drawer/navigation_bloc/navigation_bloc.dart';
import 'package:navigation_drawer/pages/homePage.dart';
import 'package:navigation_drawer/pages/myAccount_page.dart';
import 'package:navigation_drawer/siderbar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationState> (
              builder: (context, navigationState) {
                return navigationState as Widget;
              }
            ),
            SideBar(),
          ],
        ),
      )
    );
  }
}
