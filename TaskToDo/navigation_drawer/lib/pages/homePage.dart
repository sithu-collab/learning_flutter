import 'package:flutter/cupertino.dart';
import 'package:navigation_drawer/navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationState{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Homepage'),
    );
  }
}
