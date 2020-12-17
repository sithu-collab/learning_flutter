import 'package:flutter/material.dart';

class NavBarItemList extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const NavBarItemList({
    @required this.icon,
    @required this.title,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }


}
